require_relative '../hlpr_content_filter'

#I18n.config.available_locales = :en


# dub ?
# tap ?
# select ?


describe "Backend::App::ContentFilterHelper" do
  describe "normalize_numbers" do
    describe "Write numbers in english" do
      describe "converts single digits to words" do
        it "returns a word for one number" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("zero")).to eq "0"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("one")).to eq "1"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("two")).to eq "2"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("three")).to eq "3"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("four")).to eq "4"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("five")).to eq "5"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fıve")).to eq "5"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("six")).to eq "6"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("siks")).to eq "6"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seven")).to eq "7"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eight")).to eq "8"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("nine")).to eq "9"
        end
      end
      describe "Teens" do
        it "converts irregular numbers to words" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ten")).to eq "10"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eleven")).to eq "eleven"
          #expect(Backend::App::ContentFilterHelper.normalize_numbers("nineteen")).to eq "19"
        end
      end
      describe "tens" do
        it "converts numbers from 20-99 to words" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("twenty")).to eq "20"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("twenty five")).to eq "25"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("twenty eight")).to eq "28"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("thirty")).to eq "30"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("thirty seven")).to eq "37"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("thirty eight")).to eq "38"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fourty")).to eq "40"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fourty one")).to eq "41"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fifty three")).to eq "53"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fivety three")).to eq "53"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fifty siks")).to eq "56"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("fıfty siks")).to eq "56"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sixty")).to eq "60"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("siksty")).to eq "60"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sıxty two")).to eq "62"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("siksty two")).to eq "62"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sixty seven")).to eq "67"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sixty nine")).to eq "69"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seventy")).to eq "70"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seventy two")).to eq "72"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seventy five")).to eq "75"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eighty")).to eq "80"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eıghty")).to eq "80"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eighty one")).to eq "81"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eıghty three")).to eq "83"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eighty six")).to eq "86"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ninety")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("nınety")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ninety two")).to eq "92"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ninety five")).to eq "95"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("nınety seven")).to eq "97"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ninety nine")).to eq "99"
        end
      end
      describe "hundreds" do
        it "converts numbers from 100-999 to words" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("hundred")).to eq "100"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("one hündred")).to eq "100"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("one hundred one")).to eq "101"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("one hündred seven")).to eq "107"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("two hundred")).to eq "200"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("two hundred eleven")).to eq "211"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("two hundred eighty")).to eq "280"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("three hündred five")).to eq "305"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("three hundred fifteen")).to eq "315"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("three hundred seventy three")).to eq "373"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("four hundred one")).to eq "401"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("four hundred twenty")).to eq "420"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("four hundred ninety one")).to eq "491"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("five hündred")).to eq "500"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("five hundred four")).to eq "504"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("five hundred sixteen")).to eq "516"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("five hündred eighty siks")).to eq "586"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("siks hündred ten")).to eq "610"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("six hundred thirty seven")).to eq "637"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("six hündred eighty five")).to eq "685"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seven hundred ten")).to eq "710"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seven hündred eleven")).to eq "711"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seven hundred sıksty")).to eq "760"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eight hundred eight")).to eq "808"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eight hündred eighty eight")).to eq "888"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("eight hundred ninety three")).to eq "893"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("nine hündred one")).to eq "901"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("nine hundred fivety siks")).to eq "956"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("nine hundred ninety nine")).to eq "999"
        end
      end
    end
  end

  describe "spell numbers in english" do
    describe "Single digits" do
      it "should transform 1" do
        expect(Backend::App::ContentFilterHelper.spell_number(1)).to eq "one"
      end
      it "should transform 2" do
        expect(Backend::App::ContentFilterHelper.spell_number(2)).to eq "two"
      end
      it "should transform 3" do
        expect(Backend::App::ContentFilterHelper.spell_number(3)).to eq "three"
      end
      it "should transform 4" do
        expect(Backend::App::ContentFilterHelper.spell_number(4)).to eq "four"
      end
      it "should transform 5" do
        expect(Backend::App::ContentFilterHelper.spell_number(5)).to eq "five"
        expect(Backend::App::ContentFilterHelper.spell_number(5)).to eq "fıve"
      end
      it "should transform 6" do
        expect(Backend::App::ContentFilterHelper.spell_number(6)).to eq "six"
        expect(Backend::App::ContentFilterHelper.spell_number(6)).to eq "siks"
      end
      it "should transform 7" do
        expect(Backend::App::ContentFilterHelper.spell_number(7)).to eq "seven"
      end
      it "should transform 8" do
        expect(Backend::App::ContentFilterHelper.spell_number(8)).to eq "eight"
      end
      it "should transform 9" do
        expect(Backend::App::ContentFilterHelper.spell_number(9)).to eq "nine"
      end
      it "should transform 10" do
        expect(Backend::App::ContentFilterHelper.spell_number(0)).to eq "zero"
      end
    end
    describe "Teens" do
      it "should spell 10 as ten" do
        expect(Backend::App::ContentFilterHelper.spell_number(10)).to eq "ten"
      end
      it "should spell 11 as eleven" do
        expect(Backend::App::ContentFilterHelper.spell_number(11)).to eq "eleven"
      end
      it "should spell 12 as twelve" do
        expect(Backend::App::ContentFilterHelper.spell_number(12)).to eq "twelve"
      end
      it "should spell 13 as thirteen" do
        expect(Backend::App::ContentFilterHelper.spell_number(13)).to eq "thirteen"
      end
      it "should spell 14 as fourteen" do
        expect(Backend::App::ContentFilterHelper.spell_number(14)).to eq "fourteen"
      end
      it "should spell 15 as fifteen" do
        expect(Backend::App::ContentFilterHelper.spell_number(15)).to eq "fifteen"
      end
      it "should spell 16 as sixteen" do
        expect(Backend::App::ContentFilterHelper.spell_number(16)).to eq "sixteen"
      end
      it "should spell 17 as seventeen" do
        expect(Backend::App::ContentFilterHelper.spell_number(17)).to eq "seventeen"
      end
      it "should spell 18 as eighteen" do
        expect(Backend::App::ContentFilterHelper.spell_number(18)).to eq "eighteen"
      end
      it "should spell 19 as nineteen" do
        expect(Backend::App::ContentFilterHelper.spell_number(19)).to eq "nineteen"
      end
    end
    describe "Twenties" do
      it "should spell 20 as twenty" do
        expect(Backend::App::ContentFilterHelper.spell_number(20)).to eq "twenty"
      end
      it "should spell 21 as twenty one" do
        expect(Backend::App::ContentFilterHelper.spell_number(21)).to eq "twenty one"
      end
      it "should spell 22 as twenty two" do
        expect(Backend::App::ContentFilterHelper.spell_number(22)).to eq "twenty two"
      end
      it "should spell 23 as twenty three" do
        expect(Backend::App::ContentFilterHelper.spell_number(23)).to eq "twenty three"
      end
      it "should spell 24 as twenty four" do
        expect(Backend::App::ContentFilterHelper.spell_number(24)).to eq "twenty four"
      end
      it "should spell 25 as twenty five" do
        expect(Backend::App::ContentFilterHelper.spell_number(25)).to eq "twenty five"
      end
      it "should spell 26 as twenty six" do
        expect(Backend::App::ContentFilterHelper.spell_number(26)).to eq "twenty six"
      end
      it "should spell 27 as twenty seven" do
        expect(Backend::App::ContentFilterHelper.spell_number(27)).to eq "twenty seven"
      end
      it "should spell 28 as twenty eigth" do
        expect(Backend::App::ContentFilterHelper.spell_number(28)).to eq "twenty eigth"
      end
      it "should spell 29 as twenty nine" do
            expect(Backend::App::ContentFilterHelper.spell_number(29)).to eq "twenty nine"
           end
    end
    describe "Thirties" do
      it "should spell 30 as thirty" do
        expect(Backend::App::ContentFilterHelper.spell_number(30)).to eq "thirty"
      end
      it "should spell 33 as thirty three" do
        expect(Backend::App::ContentFilterHelper.spell_number(33)).to eq "thirty three"
      end
    end
    describe "Fourties" do
      it "should spell 40 as fourty" do
        expect(Backend::App::ContentFilterHelper.spell_number(40)).to eq "fourty"
      end
      it "should spell 44 as fourty four" do
        expect(Backend::App::ContentFilterHelper.spell_number(44)).to eq "fourty four"
      end
    end
    describe "Fifties" do
      it "should spell 50 as fifty" do
        expect(Backend::App::ContentFilterHelper.spell_number(50)).to eq "fifty"
      end
      it "should spell 55 as fifty five" do
        expect(Backend::App::ContentFilterHelper.spell_number(55)).to eq "fifty five"
        expect(Backend::App::ContentFilterHelper.spell_number(55)).to eq "fıfty five"
      end
    end
    describe "Sixties" do
      it "should spell 60 as sixty" do
        expect(Backend::App::ContentFilterHelper.spell_number(60)).to eq "sixty"
        expect(Backend::App::ContentFilterHelper.spell_number(60)).to eq "siksty"
        expect(Backend::App::ContentFilterHelper.spell_number(60)).to eq "sıxty"
      end
      it "should spell 66 as sixty six" do
        expect(Backend::App::ContentFilterHelper.spell_number(66)).to eq "sixty six"
      end
    end
    describe "Seventies" do
      it "should spell 70 as seventy" do
        expect(Backend::App::ContentFilterHelper.spell_number(70)).to eq "seventy"
      end
      it "should spell 77 as seventy seven" do
        expect(Backend::App::ContentFilterHelper.spell_number(77)).to eq "seventy seven"
      end
    end
    describe "Eighties" do
      it "should spell 80 as eighty" do
        expect(Backend::App::ContentFilterHelper.spell_number(80)).to eq "eighty"
      end
      it "should spell 88 as eighty eigth" do
        expect(Backend::App::ContentFilterHelper.spell_number(88)).to eq "eighty eigth"
        expect(Backend::App::ContentFilterHelper.spell_number(88)).to eq "eıghty eıgth"
      end
    end
    describe "Nineties" do
      it "should spell 90 as ninety" do
        expect(Backend::App::ContentFilterHelper.spell_number(90)).to eq "ninety"
        expect(Backend::App::ContentFilterHelper.spell_number(90)).to eq "nınety"
      end
      it "should spell 99 as ninety nine" do
        expect(Backend::App::ContentFilterHelper.spell_number(99)).to eq "ninety nine"
        expect(Backend::App::ContentFilterHelper.spell_number(99)).to eq "ninety nıne"
      end
    end
    describe "Hundreds" do
      it "should spell 100 as one hundred" do
        expect(Backend::App::ContentFilterHelper.spell_number(100)).to eq "one hundred"
      end
      it "should spell 101 as one hundred one" do
        expect(Backend::App::ContentFilterHelper.spell_number(101)).to eq "one hundred one"
      end
      it "should spell 111 as one hundred eleven" do
        expect(Backend::App::ContentFilterHelper.spell_number(111)).to eq "one hundred eleven"
      end
      it "should spell 155 as one hundred fifty five" do
        expect(Backend::App::ContentFilterHelper.spell_number(155)).to eq "one hundred fifty five"
      end
      it "should spell 190 as onehundredninety" do
        expect(Backend::App::ContentFilterHelper.spell_number(190)).to eq "one hundred ninety"
      end
      it "should spell 200 as two hundred" do
        expect(Backend::App::ContentFilterHelper.spell_number(200)).to eq "two hundred"
      end
      it "should spell 222 as two hundred twenty two" do
        expect(Backend::App::ContentFilterHelper.spell_number(222)).to eq "two hundred twenty two"
      end
      it "should spell 999 as nine hundred ninety nine" do
        expect(Backend::App::ContentFilterHelper.spell_number(999)).to eq "nine hundred ninety nine"
      end
    end
  end
end

    

     



