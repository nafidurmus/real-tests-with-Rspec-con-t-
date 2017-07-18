require_relative '../hlpr_content_filter'

#I18n.config.available_locales = :en


# dub ?
# tap ?
# select ?

describe "Backend::App::ContentFilterHelper" do
  describe "normalize_numbers" do
    describe "Write numbers in turkish" do
      describe "converts single digits to words" do
        it "returns a word for one number" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sifir")).to eq "0"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sıfır")).to_s eq "0"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sıfir")).to eq "0"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sifır")).to eq "0"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("bir")).to eq "1"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("bır")).to eq "1"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("iki")).to eq "2"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ıki")).to eq "2"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ıkı")).to eq "2"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("uç")).to eq "3"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("üc")).to eq "3"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("dort")).to eq "4"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("bes")).to eq "5"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("beş")).to eq "5"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("alti")).to eq "6"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("yedi")).to eq "7"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("sekiz")).to eq "8"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sekız")).to eq "8"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("dokuz")).to eq "9"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dokız")).to eq "9" # hata vermesi lazım.
        end
      end

      describe "Teens" do
        it "converts irregular numbers to words" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("on")).to eq "10"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ön")).to eq "10"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("on bir")).to eq "11"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ön bir")).to eq "11"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("ön dokuz")).to eq "19"
        end
      end

      describe "tens" do
        it "converts numbers from 20-99 to words" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yirmı")).to eq "20"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yırmı")).to eq "20"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("yirmı bes")).to eq "25"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yırmı sekız")).to eq "28"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("otuz")).to eq "30"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("otüz yedi")).to eq "37"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("ötuz sekiz")).to eq "38"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("kırk")).to eq "40"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("kirk bir")).to eq "41"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("elli uc")).to eq "53"
          expect(ContentFilterHelper.normalize_numbers("elli alti")).to eq "56"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("altmiş")).to eq "60"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("altmış ikı")).to eq "62"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("atmış ikı")).to eq "62"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("altmıs yedi")).to eq "67"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("atmıs yedi")).to eq "67"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("altmıs dokuz")).to eq "69"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("yeltmiş")).to eq "70"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yetmiş")).to eq "70"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yetmiş iki")).to eq "72"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yetmiş bes")).to eq "75"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yeltmiş yedi")).to eq "77"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yetmiş dokuz")).to eq "79"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("seksen")).to eq "80"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sehsen")).to eq "80"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seksen bır")).to eq "81"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seksen uc")).to eq "83"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("seksen alti")).to eq "86"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("doksan")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dokzan")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("döksan")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("doksan")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dohsan")).to eq "90"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dokzan iki")).to eq "92"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dokzan bes")).to eq "95"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("döhsan yedi")).to eq "97"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("doksan dokuz")).to eq "99"
        end
      end

      describe "hundreds" do
        it "converts numbers from 100-999 to words" do
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yüz")).to eq "100"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yus")).to eq "100"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yuz")).to eq "100"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yüs bir")).to eq "101"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yüz yedi")).to eq "107"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("iki yüz")).to eq "200"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("iki yüz on bir")).to eq "211"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("iki yüs seksen")).to eq "280"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("uc yüz bes")).to eq "305"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("üç yüz on bes")).to eq "315"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("uc yüz yetmiş üç")).to eq "373"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("dort yüz bır")).to eq "401"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dört yüz yirmi")).to eq "420"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dort yüz doksan bır")).to eq "491"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("bes yüz")).to eq "500"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("bes yüz dort")).to eq "504"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("bes yüz on altı")).to eq "516"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("bes yüz seksen altı")).to eq "586"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("alti yüz on")).to eq "610"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("altı yüz otuz yedi")).to eq "637"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("altı yüz seksen bes")).to eq "685"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("yedi yüz ön")).to eq "710"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yedi yüz on bır")).to eq "711"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("yedi yüz altmıs")).to eq "760"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("sekiz yüz sekiz")).to eq "808"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sekıs yüz seksen sekiz")).to eq "888"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("sekiz yüz doksan uc")).to eq "893"

          expect(Backend::App::ContentFilterHelper.normalize_numbers("dokuz yüz bır")).to eq "901"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dokuz yüz elli")).to eq "956"
          expect(Backend::App::ContentFilterHelper.normalize_numbers("dokuz yüz doksan dokuz")).to eq "999"
        end
      end
    end
  end

  describe "spell numbers in turkish" do
    describe "Single digits" do
      it "should transform 1" do
        expect(Backend::App::ContentFilterHelper.spell_number(1)).to eq "bir"
        expect(Backend::App::ContentFilterHelper.spell_number(1)).to eq "bır"
      end
      it "should transform 2" do
        expect(Backend::App::ContentFilterHelper.spell_number(2)).to eq "iki"
        expect(Backend::App::ContentFilterHelper.spell_number(2)).to eq "ikı"
      end
      it "should transform 3" do
        expect(Backend::App::ContentFilterHelper.spell_number(3)).to eq "üç"
        expect(Backend::App::ContentFilterHelper.spell_number(3)).to eq "üc"
        expect(Backend::App::ContentFilterHelper.spell_number(3)).to eq "uç"
      end
      it "should transform 4" do
        expect(Backend::App::ContentFilterHelper.spell_number(4)).to eq "dört"
      end
      it "should transform 5" do
        expect(Backend::App::ContentFilterHelper.spell_number(5)).to eq "beş"
        expect(Backend::App::ContentFilterHelper.spell_number(5)).to eq "bes"
      end
      it "should transform 6" do
        expect(Backend::App::ContentFilterHelper.spell_number(6)).to eq "altı"
        expect(Backend::App::ContentFilterHelper.spell_number(6)).to eq "alti"
      end
      it "should transform 7" do
        expect(Backend::App::ContentFilterHelper.spell_number(7)).to eq "yedi"
      end
      it "should transform 8" do
        expect(Backend::App::ContentFilterHelper.spell_number(8)).to eq "sekiz"
      end
      it "should transform 9" do
        expect(Backend::App::ContentFilterHelper.spell_number(9)).to eq "dokuz"
        expect(Backend::App::ContentFilterHelper.spell_number(9)).to eq "dökuz"
      end
      it "should transform 10" do
        expect(Backend::App::ContentFilterHelper.spell_number(0)).to eq "sıfır"
        expect(Backend::App::ContentFilterHelper.spell_number(0)).to eq "sıfir"
        expect(Backend::App::ContentFilterHelper.spell_number(0)).to eq "sifır"
      end
    end
    describe "Teens" do
      it "should spell 10 as on" do
        expect(Backend::App::ContentFilterHelper.spell_number(10)).to eq "on"
        expect(Backend::App::ContentFilterHelper.spell_number(10)).to eq "ön"
      end
      it "should spell 11 as on bir" do
        expect(Backend::App::ContentFilterHelper.spell_number(11)).to eq "on bir"
      end
      it "should spell 12 as oniki" do
        expect(Backend::App::ContentFilterHelper.spell_number(12)).to eq "on iki"
      end
      it "should spell 13 as on üç" do
        expect(Backend::App::ContentFilterHelper.spell_number(13)).to eq "on üç"
      end
      it "should spell 14 as on dört" do
        expect(Backend::App::ContentFilterHelper.spell_number(14)).to eq "on dört"
      end
      it "should spell 15 as on beş" do
        expect(Backend::App::ContentFilterHelper.spell_number(15)).to eq "on beş"
      end
      it "should spell 16 as on altı" do
        expect(Backend::App::ContentFilterHelper.spell_number(16)).to eq "on altı"
      end
      it "should spell 17 as on yedi" do
        expect(Backend::App::ContentFilterHelper.spell_number(17)).to eq "on yedi"
      end
      it "should spell 18 as on sekiz" do
        expect(Backend::App::ContentFilterHelper.spell_number(18)).to eq "on sekiz"
      end
      it "should spell 19 as on dokuz" do
        expect(Backend::App::ContentFilterHelper.spell_number(19)).to eq "on dokuz"
      end
    end
    describe "Twenties" do
      it "should spell 20 as yirmi" do
        expect(Backend::App::ContentFilterHelper.spell_number(20)).to eq "yirmi"
      end
      it "should spell 21 as yirmi bir" do
        expect(Backend::App::ContentFilterHelper.spell_number(21)).to eq "yirmi bir"
      end
      it "should spell 22 as yirmi iki" do
        expect(Backend::App::ContentFilterHelper.spell_number(22)).to eq "yirmi iki"
      end
      it "should spell 23 as yirmi üç" do
        expect(Backend::App::ContentFilterHelper.spell_number(23)).to eq "yirmi üç"
      end
      it "should spell 24 as yirmi dört" do
        expect(Backend::App::ContentFilterHelper.spell_number(24)).to eq "yirmi dört"
      end
      it "should spell 25 as yirmi beş" do
        expect(Backend::App::ContentFilterHelper.spell_number(25)).to eq "yirmi beş"
        expect(Backend::App::ContentFilterHelper.spell_number(25)).to eq "yirmı bes"
      end
      it "should spell 26 as yirmi altı" do
        expect(Backend::App::ContentFilterHelper.spell_number(26)).to eq "yirmi altı"
        expect(Backend::App::ContentFilterHelper.spell_number(26)).to eq "yırmı alti"
      end
      it "should spell 27 as yirmi yedi" do
        expect(Backend::App::ContentFilterHelper.spell_number(27)).to eq "yirmi yedi"
      end
      it "should spell 28 as yirmi sekiz" do
        expect(Backend::App::ContentFilterHelper.spell_number(28)).to eq "yirmi sekiz"
      end
      it "should spell 29 as yirmi dokuz" do
        expect(Backend::App::ContentFilterHelper.spell_number(29)).to eq "yirmi dokuz"
      end
    end
    describe "Thirties" do
      it "should spell 30 as otuz" do
        expect(Backend::App::ContentFilterHelper.spell_number(30)).to eq "otuz"
      end
      it "should spell 33 as otuz üç" do
        expect(Backend::App::ContentFilterHelper.spell_number(33)).to eq "otuz üç"
        expect(Backend::App::ContentFilterHelper.spell_number(33)).to eq "otuz üc"
      end
    end
    describe "Fourties" do
      it "should spell 40 as kırk" do
        expect(Backend::App::ContentFilterHelper.spell_number(40)).to eq "kırk"
      end
      it "should spell 44 as kırk dört" do
        expect(Backend::App::ContentFilterHelper.spell_number(44)).to eq "kırk dört"
        expect(Backend::App::ContentFilterHelper.spell_number(44)).to eq "kirk dört"
        expect(Backend::App::ContentFilterHelper.spell_number(44)).to eq "kirk dort"
      end
      it "should spell 49 as kırk dokuz" do
        expect(Backend::App::ContentFilterHelper.spell_number(49)).to eq "kırk dokuz"
        expect(Backend::App::ContentFilterHelper.spell_number(49)).to eq "kirk dokuz"
      end
    end
    describe "Fifties" do
      it "should spell 50 as elli" do
        expect(Backend::App::ContentFilterHelper.spell_number(50)).to eq "elli"
      end
      it "should spell 55 as elli beş" do
        expect(Backend::App::ContentFilterHelper.spell_number(55)).to eq "elli beş"
        expect(Backend::App::ContentFilterHelper.spell_number(55)).to eq "elli bes"
      end
    end
    describe "Sixties" do
      it "should spell 60 as atmış" do
        expect(Backend::App::ContentFilterHelper.spell_number(60)).to eq "atmış"
      end
      it "should spell 66 as atmış altı" do
        expect(Backend::App::ContentFilterHelper.spell_number(66)).to eq "atmış altı"
        expect(Backend::App::ContentFilterHelper.spell_number(66)).to eq "atmıs altı"
      end
    end
    describe "Seventies" do
      it "should spell 70 as yetmiş" do
        expect(Backend::App::ContentFilterHelper.spell_number(70)).to eq "yetmiş"
        expect(Backend::App::ContentFilterHelper.spell_number(70)).to eq "yeltmiş"
        expect(Backend::App::ContentFilterHelper.spell_number(70)).to eq "yetmis"
      end
      it "should spell 77 as yetmiş yedi" do
        expect(Backend::App::ContentFilterHelper.spell_number(77)).to eq "yetmiş yedi"
      end
    end
    describe "Eighties" do
      it "should spell 80 as seksen" do
        expect(Backend::App::ContentFilterHelper.spell_number(80)).to eq "seksen"
      end
      it "should spell 88 as seksen sekiz" do
        expect(Backend::App::ContentFilterHelper.spell_number(88)).to eq "seksen sekiz"
      end
    end
    describe "Nineties" do
      it "should spell 90 as doksan" do
        expect(Backend::App::ContentFilterHelper.spell_number(90)).to eq "doksan"
      end
      it "should spell 91 as doksanbir" do
        expect(Backend::App::ContentFilterHelper.spell_number(91)).to eq "doksan bir"
        expect(Backend::App::ContentFilterHelper.spell_number(91)).to eq "döksan bır"
      end
      it "should spell 99 as doksandokuz" do
        expect(Backend::App::ContentFilterHelper.spell_number(99)).to eq "doksan dokuz"
      end
    end
    describe "Hundreds" do
      it "should spell 100 as yüz" do
        expect(Backend::App::ContentFilterHelper.spell_number(100)).to eq "yüz"
      end
      it "should spell 101 as yüz bir" do
        expect(Backend::App::ContentFilterHelper.spell_number(101)).to eq "yüz bir"
        expect(Backend::App::ContentFilterHelper.spell_number(101)).to eq "yuz bir"
      end
      it "should spell 111 as yüz on bir" do
        expect(Backend::App::ContentFilterHelper.spell_number(111)).to eq "yüz on bir"
        expect(Backend::App::ContentFilterHelper.spell_number(111)).to eq "yuz ön bir"
      end
      it "should spell 155 as yüzellibeş" do
        expect(Backend::App::ContentFilterHelper.spell_number(155)).to eq "yüzellibeş"
      end
      it "should spell 190 as yüz doksan" do
        expect(Backend::App::ContentFilterHelper.spell_number(190)).to eq "yüzdoksan"
      end
      it "should spell 200 as iki yüz" do
        expect(Backend::App::ContentFilterHelper.spell_number(200)).to eq "iki yüz"
      end
      it "should spell 222 as iki yüz yirmi iki" do
        expect(Backend::App::ContentFilterHelper.spell_number(222)).to eq "iki yüz yirmi iki"
      end
      it "should spell 999 as dokuz yüz doksan dokuz" do
        expect(Backend::App::ContentFilterHelper.spell_number(999)).to eq "dokuz yuz doksan dokuz"
      end
    end
  end
end


     



