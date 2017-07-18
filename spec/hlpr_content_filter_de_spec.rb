require_relative '../hlpr_content_filter'
#require "App"

#I18n.config.available_locales = :en

##'abcde'.gsub(/bda/, '123')
#=> "abcde" çıktı

##'abcde'.gsub(/b.d/, '123')
#=> "a123e" çıktı

# gsub ? 
# dub ?
# tap ?
# Regexp ?
# select ?
# include ?


describe "Backend::App::ContentFilterHelper" do
  describe "normalize_numbers" do
    describe "Write numbers in german" do
      describe "converts single digits to words" do
        it "returns a word for one number" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("null")).to eq "0"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("nil")).to eq "0"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("nul")).to eq "0"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eins")).to eq "1"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eıns")).to eq "1"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zwei")).to eq "2"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zwo")).to eq "2"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zweı")).to eq "2"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("drei")).to eq "3"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("vier")).to eq "4"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("vıer")).to eq "4"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fünf")).to eq "5"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("funf")).to eq "5"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seks")).to eq "6"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sechs")).to eq "6"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sieben")).to eq "7"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sıeben")).to eq "7"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("acht")).to eq "8"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("neun")).to eq "9"
        end
      end
      describe "Teens" do
        it "converts irregular numbers to words" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zehn")).to eq "10"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("elf")).to eq "elf"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("neunzehn")).to eq "19"
        end
      end
      describe "tens" do
        it "converts numbers from 20-99 to words" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zwanzig")).to eq "20"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("swanzig")).to eq "20"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("swanzıg")).to eq "20"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("svanzig")).to eq "20"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zwanzih")).to eq "20"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("svansih")).to eq "20"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("fünfzwanzig")).to eq "25"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("achtundzwanzig")).to eq "28"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("dreißig")).to eq "30"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("dreıssig")).to eq "30"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("dreıssıg")).to eq "30"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("dreißih")).to eq "30"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("siebenunddressing")).to eq "37"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("achtunddreissig")).to eq "38"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("vierzig")).to eq "40"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("einundvierzih")).to eq "41"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("dreiundfϋnfzig")).to eq "53"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("sechsundfünfzig")).to eq "56"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sechzig")).to eq "60"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("zwaiundsechzıh")).to eq "62"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("zwaiundsechzig")).to eq "62"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("siebenundsechzig")).to eq "67"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("siebenundseksih")).to eq "67"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("siebzig")).to eq "70"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sıebzih")).to eq "70"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("zwaiundsiebzig")).to eq "72"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("fünfundsiebzig")).to eq "75"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("siebenundsiebzig")).to eq "77"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("neunundsiebzig")).to eq "79"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("achtzig")).to eq "80"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("achtsıh")).to eq "80"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("einundachtzig")).to eq "81"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("dreiundachtzig")).to eq "83"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("seksundachtzig")).to eq "86"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("neunzig")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("neunsig")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("neunzıh")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("neunzih")).to eq "90"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("zwaiundneunzig")).to eq "92"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("fünfundneunzih")).to eq "95"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("siebenundneunzıg")).to eq "97"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("neunundneunzig")).to eq "99"
        end
      end
      describe "hundreds" do
        it "converts numbers from 100-999 to words" do
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("Einhundert")).to eq "100"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("hundert")).to eq "100"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("hundertundeins")).to eq "101"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("hundertundsieben")).to eq "107"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zweihundert")).to eq "200"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zweihundertundelf")).to eq "211"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zweihundertundachtzig")).to eq "280"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dreihundert")).to eq "305"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dreihundertundfünfzehn")).to eq "315"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dreihundertdreiundsiebzig")).to eq "373"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("vierhundertundein")).to eq "401"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("vierhundertundzwanzig")).to eq "420"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("vierhundertneunzigundein")).to eq "491"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fünfhundert")).to eq "500"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fünfhundertundvier")).to eq "504"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fünfhundertundsechzehn")).to eq "516"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fünfhundertsechsundachtzig")).to eq "586"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sechshundertundzehn")).to eq "610"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sechshundertsiebenunddreissig")).to eq "637"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sechshundertfünfundachtzig")).to eq "685"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("siebenhundertundzehn")).to eq "710"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("siebenhundertundelf")).to eq "711"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("siebenhundertundsechzig")).to eq "760"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("achthundertundacht")).to eq "808"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("achthundertachtundzwanzig")).to eq "888"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("achthundertdreiundneunzig")).to eq "893"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("neunhundertundein")).to eq "901"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("neunhundertsechsundfünfzig")).to eq "956"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("neunhundertneunundneunzig")).to eq "999"
        end
      end
    end
  end

  describe "spell_number" do
    describe "spell numbers in german" do
      describe "Single digits" do
        it "should transform 1" do
          expect(Backend::App::ContentFilterHelper.spell_number(1 )).to eq 'eins'
        end
        it "should transform 2" do
           expect(Backend::App::ContentFilterHelper.spell_number(2)).to eq "zwei"
        end
        it "should transform 3" do
          expect(Backend::App::ContentFilterHelper.spell_number(3)).to eq "drei"
        end
        it "should transform 4" do
          expect(Backend::App::ContentFilterHelper.spell_number(4)).to eq "vier"
        end
        it "should transform 5" do
          expect(Backend::App::ContentFilterHelper.spell_number(5)).to eq "fünf"
        end
        it "should transform 6" do
          expect(Backend::App::ContentFilterHelper.spell_number(6)).to eq "sechs"
        end
        it "should transform 7" do
          expect(Backend::App::ContentFilterHelper.spell_number(7)).to eq "sieben"
        end
        it "should transform 8" do
          expect(Backend::App::ContentFilterHelper.spell_number(8)).to eq "acht"
        end
        it "should transform 9" do
          expect(Backend::App::ContentFilterHelper.spell_number(9)).to eq "neun"
        end
        it "should transform 10" do
          expect(Backend::App::ContentFilterHelper.spell_number(0)).to eq "null"
        end
      end
      describe "Teens" do
        it "should spell 10 as zehn" do
          expect(Backend::App::ContentFilterHelper.spell_number(10)).to eq "zehn"
        end
        it "should spell 11 as elf" do
          expect(Backend::App::ContentFilterHelper.spell_number(11)).to eq "elf"
        end
        it "should spell 12 as zwölf" do
          expect(Backend::App::ContentFilterHelper.spell_number(12)).to eq "zwölf"
        end
        it "should spell 13 as dreizehn" do
          expect(Backend::App::ContentFilterHelper.spell_number(13)).to eq "dreizehn"
        end
        it "should spell 14 as vierzehn" do
          expect(Backend::App::ContentFilterHelper.spell_number(14)).to eq "vierzehn"
        end
        it "should spell 15 as fünfzehn" do
          expect(Backend::App::ContentFilterHelper.spell_number(15)).to eq "fünfzehn"
        end
        it "should spell 16 as sechzehn" do
          expect(Backend::App::ContentFilterHelper.spell_number(16)).to eq "sechzehn"
        end
        it "should spell 17 as siebzehn" do
          expect(Backend::App::ContentFilterHelper.spell_number(17)).to eq "siebzehn"
        end
        it "should spell 18 as achtzehn" do
          expect(Backend::App::ContentFilterHelper.spell_number(18)).to eq "achtzehn"
        end
        it "should spell 19 as neunzehn" do
          expect(Backend::App::ContentFilterHelper.spell_number(19)).to eq "neunzehn"
        end
      end
      describe "Twenties" do
        it "should spell 20 as zwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(20)).to eq "zwanzig"
        end
        it "should spell 21 as einundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(21)).to eq "einundzwanzig"
        end
        it "should spell 22 as zweiundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(22)).to eq "zweiundzwanzig"
        end
        it "should spell 23 as dreiundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(23)).to eq "dreiundzwanzig"
        end
        it "should spell 24 as vierundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(24)).to eq "vierundzwanzig"
        end
        it "should spell 25 as fünfundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(25)).to eq "fünfundzwanzig"
        end
        it "should spell 26 as sechsundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(26)).to eq "sechsundzwanzig"
        end
        it "should spell 27 as siebenundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(27)).to eq "siebenundzwanzig"
        end
        it "should spell 28 as achtundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(28)).to eq "achtundzwanzig"
        end
        it "should spell 29 as neunundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(29)).to eq "neunundzwanzig"
        end
      end
      describe "Thirties" do
        it "should spell 30 as dreissig" do
          expect(Backend::App::ContentFilterHelper.spell_number(30)).to eq "dreissig"
        end
        it "should spell 33 as dreiundreissig" do
          expect(Backend::App::ContentFilterHelper.spell_number(33)).to eq "dreiunddreissig"
        end
      end
      describe "Fourties" do
        it "should spell 40 as vierzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(40)).to eq "vierzig"
        end
        it "should spell 44 as vierundvierzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(44)).to eq "vierundvierzig"
        end
      end
      describe "Fifties" do
        it "should spell 50 as fünfzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(50)).to eq "fünfzig"
        end
        it "should spell 55 as fünfundfünfzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(55)).to eq "fünfundfünfzig"
        end
      end
      describe "Sixties" do
        it "should spell 60 as sechzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(60)).to eq "sechzig"
        end
        it "should spell 66 as sechsundsechzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(66)).to eq "sechsundsechzig"
        end
      end
      describe "Seventies" do
        it "should spell 70 as siebzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(70)).to eq "siebzig"
        end
        it "should spell 77 as siebenundsiebzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(77)).to eq "sechsundsechzige"
        end
      end
      describe "Eighties" do
        it "should spell 80 as achtzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(80)).to eq "achtzig"
        end
        it "should spell 88 as achtundachtzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(88)).to eq "achtundachtzig"
        end
      end
      describe "Nineties" do
        it "should spell 90 as neunzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(90)).to eq "neunzig"
        end
        it "should spell 99 as neunundneunzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(99)).to eq "neunundneunzig"
        end
      end
      describe "Hundreds" do
        it "should spell 100 as einhundert" do
          expect(Backend::App::ContentFilterHelper.spell_number(100)).to eq "einhundert"
        end
        it "should spell 101 as einhundertundeins" do
          expect(Backend::App::ContentFilterHelper.spell_number(101)).to eq "einhunderteins"
        end
        it "should spell 111 as einhundertundelf" do
          expect(Backend::App::ContentFilterHelper.spell_number(111)).to eq "einhundertelf"
        end
        it "should spell 155 as einhundertundfünfundfünfzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(155)).to eq "einhundertfünfundfünfzig"
        end
        it "should spell 190 as einhundertneunzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(190)).to eq "einhundertneunzig"
        end
        it "should spell 200 as zweihundert" do
          expect(Backend::App::ContentFilterHelper.spell_number(200)).to eq "zweihundert"
        end
        it "should spell 222 as zweihundertzeiundzwanzig" do
          expect(Backend::App::ContentFilterHelper.spell_number(222)).to eq "zweihundertzweiundzwanzig"
        end
        it "should spell 999 as neunhundertneunundneunzig" do
          expect(Backend::App::ContentFilterHelper.spell_number("999")).to eq "neunhundertneunundneunzig"
        end
      end
    end
  end
end

      