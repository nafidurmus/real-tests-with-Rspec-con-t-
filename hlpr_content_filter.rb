# coding: utf-8
module Backend
  class App
    class ContentFilterHelper

      # Spell numbers (including common usages & misspellings)
      # Covers tr, en and de.
      NUMBER_MAGIC = {
        '1' => '(b[iı]r|one|e[iı]ns)',
        '2' => '([iı]k[iı]|two|zwe[iı]|zwo)',
        '3' => '([üu][cç]|th?ree|dre?i)',
        '4' => '(d[öo]rt|fou?r|v[iı]er)',
        '5' => '(be[şs]|f[iı]ve|f[üu]nf)',
        '6' => '(alt[iı]|si(x|ks)|se(ch|k)s)',
        '7' => '(yed[iı]|seven|s[iı]eben)',
        '8' => '(sek[ıi]z|eigh?t|acht)',
        '9' => '(dok+uz|nine|neun)',
        '0' => '(s[ıi]f[ıi]r|zero|n[ui]l?l|oh?)', 
        '10' => '([oö]n|te+n|zeh?n)',        # eleven ?
        '20' => '(y[ıi]rm[ıi]|twenty|[sz][vw]an[sz][iı][gh])',
        '30' => '([oö]t[uü]z|th?irty|drei(ss|ß)[sz][iı][gh])',
        '40' => '(k[ıi]rk|fou?rty|v[iı]erz[iı][gh])',
        '50' => '(el+[ıi]|f[iı](f|ve)ty|f[üu]nf[sz][iı][gh])',
        '60' => '(al?tm[ıi][sş]|s[ıi](x|ks)ty|se(ch|k)[sz][iı][gh])', # ? ne iş yapıyor.
        '70' => '(yel?tm[ıi][sş]|seventy|s[ıi]e?b[sz][iı][gh])',
        '80' => '(se[kh]?sen|e[iı]gh?ty|acht[sz][iı][gh])',
        '90' => '(d[oö][kh][sz]an|n[iı]nety|neun[sz][ıi][gh])'
      }

      def self.normalize_numbers(clean_text)
        clean_text.dup.gsub(/\s/, '').gsub(/(y[uü][sz]|h[uü]nd?red|hundert)/, '0').tap { |ct|
          self::NUMBER_MAGIC.keys.map(&:to_i).sort.reverse.map(&:to_s).each { |key|
            ct.gsub!(Regexp.new(self::NUMBER_MAGIC[key], Regexp::IGNORECASE), key)
          }
        }
      end

      def self.spell_number(number)
        @@memo ||= Hash.new
        return @@memo[number] unless @@memo[number].nil?

        r = ''
        t = nil # Next number after tenth
        s = number.split('')
        last = s.length - 1
        number.split('').each_with_index do |char, idx|
          char_human = self::NUMBER_MAGIC[char]
          char_tenth = self::NUMBER_MAGIC["#{char}0"] unless char == '0'

          if (idx == 0 && !number.start_with?('0')) || (idx == 1 && number.start_with?('0'))
            r << "(#{char}|#{char_human})(y[uü][sz]|h[uü]nd?red|hundert)?"
          elsif !char_tenth.nil? && ((idx == 1 && !number.start_with?('0')) || (idx == 2 && number.start_with?('0')))
            if (idx + 1 == last)
              # We have a tenth, zero is optional at the end.
              t = number.last
              if t == '0'
                r << "(#{char}0|#{char_human}#{self::NUMBER_MAGIC['0']}|#{char_tenth})"
              else
                r << "(((#{char}|#{char_human})(0|#{self::NUMBER_MAGIC['0']})?)|#{char_tenth})(#{t}|#{self::NUMBER_MAGIC[t]})"
              end
            else
              r << "(#{char}|#{char_human})"
            end
          elsif idx == last && char == t
            # Skip trailing digit. Already handled above using lookahead.
          else
            r << "(#{char}|#{char_human})"
          end
        end

        zero     = "(0|#{self::NUMBER_MAGIC['0']})"
        digit    = '(\d|' "#{self::NUMBER_MAGIC.select{|k,v| ('0'..'9').include?(k)}.values.join('|')})"
        digit_nz = '([1-9]|' "#{self::NUMBER_MAGIC.select{|k,v| ('1'..'9').include?(k)}.values.join('|')})"
        tenth    = "(#{self::NUMBER_MAGIC.select{|k,v| k.length == 2}.values.join('|')})"
        hundreth = '(y[uü][sz]|h[uü]nd?red|hundert)?'
        two_digits = "((#{tenth}#{digit_nz}?)|(#{digit}{2})|(#{zero}?#{digit}))"
        three_digits = "(#{digit}#{hundreth}?#{two_digits})"

        # Expect seven more numbers after the indicator.
        r << "((#{three_digits}#{two_digits}{2})|(#{three_digits}{2}#{digit})|(#{two_digits}{3}#{digit}))"

        @@memo[number] = Regexp.new(r, Regexp::IGNORECASE)
      end

    end
  end
end
