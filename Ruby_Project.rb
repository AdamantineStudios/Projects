# Nazev souboru, ve kterem je chronologicky
# serazeny seznam udalosti pro simulaci.
NAZEV_SOUBORU_UDALOSTI = "udalosti.txt"

# Cena za jeden kus materialu (ocelova konstrukce luzka).
CENA_KONSTRUKCE = 10
# Cena za jeden kus materialu (matrace pro luzko).
CENA_MATRACE = 5
# Cena za jeden kus materialu (elektroinstalace pro luzko).
CENA_ELEKTROINSTALACE = 15
# Pokuta za jeden den, kdy nakladni vozidlo cekana na vylozeni.
POKUTA_PRODLENI_MATERIAL = 2
# Pokuta za jeden den, kdy nebyla objednavka kompletne vyrizena.
POKUTA_PRODLENI_OBJEDNAVKA = 5
# Prodejni cena jednoho luzka.
CENA_LUZKO = 50

class Firma
  attr_reader :rozpocet, :sklad, :den, :objednavky_vyrizene, :objednavky_k_vyrizeni

  def initialize(sklad, rozpocet, vyrobni_kapacita)
    # Kolik luzek muze firma vyrobit za jeden den.
    @vyrobni_kapacita = vyrobni_kapacita
    # Vychozi rozpocet firmy. Firma muze se muze behem simulace dostat i do zaporneho rozpoctu.
    # To simulaci nijak nevadi a neprovadejte zadne zvlastni kroky.
    @rozpocet = rozpocet
    @sklad = sklad

    # Citac dni simulace, ktery je po kazdem dni simulace zvysen o jednicku.
    @den = 1
    # Citac vyrobnich cisel luzek. Po kazdem vyrobenem luzku se zvysi o jednicku.
    @citac_vyrobnich_cisel = 1
    # Chronologicky serazeny seznam vyrizenych objednavek.
    @objednavky_k_vyrizeni = []
    # Chronologicky serazeny seznam objednavek, ktere maji byt vyrizeny.
    @objednavky_vyrizene = []
    # Uchovava informace o cekajich nakladacich s jednotlivymi druhy materialu.
    # Pod klici :konstrukce, :matrace a :elektroinstalace jsou ulozena pole
    # obsahujici pocty kusu materialu z jednotlivych nakladaku, ktere jeste nebyly
    # vylozeny, protoze nebyl dostatek mista na sklade.
    @cekajici_nakladaky = {:konstrukce => [], :matrace => [], :elektroinstalace => []}
  end

  # Nejdrive se zaplati za material, ktery byl privezen.
  # Pote se ulozi material do skladu a pripadne se zaeviduje,
  # ze nektere nakladaky se nepodarilo plne vylozit a cekaji na
  # vylozeni.
  def prijmout_material(material)
    unless material[:konstrukce].empty?
      @rozpocet -= material[:konstrukce].inject {|sum, m| sum + m} * CENA_KONSTRUKCE
    end
    unless material[:elektroinstalace].empty?
      @rozpocet -= material[:elektroinstalace].inject {|sum, m| sum + m} * CENA_ELEKTROINSTALACE
    end
    unless material[:matrace].empty?
      @rozpocet -= material[:matrace].inject {|sum, m| sum + m} * CENA_MATRACE
    end


    def zkontroluj_cekajici_konstrukce()
      indexy_vylozenych = []
      zbytky = []
      @cekajici_nakladaky[:konstrukce].length.times do |index|
        pridano = @sklad.prijmout_konstrukce(@cekajici_nakladaky[:konstrukce][index])
        if pridano == @cekajici_nakladaky[:konstrukce][index]
          indexy_vylozenych << index
        elsif pridano < @cekajici_nakladaky[:konstrukce][index] and pridano != 0
          zbytky << @cekajici_nakladaky[:konstrukce][index] - pridano
        end
      end
      # Mazani uz vylozenych
      indexy_vylozenych.each do |index_item|
        @cekajici_nakladaky[:konstrukce].delete_at(index_item)
      end
      zbytky.each do |zbytek|
        @cekajici_nakladaky[:konstrukce] << zbytek
      end
    end

    def zkontroluj_cekajici_elektroinstalace()
      indexy_vylozenych = []
      zbytky = []
      @cekajici_nakladaky[:elektroinstalace].length.times do |index|
        pridano = @sklad.prijmout_elektroinstalace(@cekajici_nakladaky[:elektroinstalace][index])
        if pridano == @cekajici_nakladaky[:elektroinstalace][index]
          indexy_vylozenych << index
        elsif pridano < @cekajici_nakladaky[:elektroinstalace][index] and pridano != 0
          zbytky << @cekajici_nakladaky[:elektroinstalace][index] - pridano
        end
      end
      # Mazani uz vylozenych
      indexy_vylozenych.each do |index_item|
        @cekajici_nakladaky[:elektroinstalace].delete_at(index_item)
      end
      zbytky.each do |zbytek|
        @cekajici_nakladaky[:elektroinstalace] << zbytek
      end
    end

    def zkontroluj_cekajici_matrace()
      indexy_vylozenych = []
      zbytky = []
      @cekajici_nakladaky[:matrace].length.times do |index|
        pridano = @sklad.prijmout_matrace(@cekajici_nakladaky[:matrace][index])
        if pridano == @cekajici_nakladaky[:matrace][index]
          indexy_vylozenych << index
        elsif pridano < @cekajici_nakladaky[:matrace][index] and pridano != 0
          zbytky << @cekajici_nakladaky[:matrace][index] - pridano
        end
      end
      # Mazani uz vylozenych
      indexy_vylozenych.each do |index_item|
        @cekajici_nakladaky[:matrace].delete_at(index_item)
      end
      zbytky.each do |zbytek|
        @cekajici_nakladaky[:matrace] << zbytek
      end
    end

    if @cekajici_nakladaky[:konstrukce].length > 0
      zkontroluj_cekajici_konstrukce
    end

    if @cekajici_nakladaky[:elektroinstalace].length > 0
      zkontroluj_cekajici_elektroinstalace
    end

    if @cekajici_nakladaky[:matrace].length > 0
      zkontroluj_cekajici_matrace
    end


    def zkontroluj_prichozi_konstrukce(material)
      indexy_vylozenych = []
      material[:konstrukce].length.times do |index|
        pridano = @sklad.prijmout_konstrukce(material[:konstrukce][index])
        if pridano == material[:konstrukce][index]
          indexy_vylozenych << index
        elsif pridano < material[:konstrukce][index] and pridano != 0
          @cekajici_nakladaky[:konstrukce] << material[:konstrukce][index] - pridano
        elsif pridano == 0
          @cekajici_nakladaky[:konstrukce] << material[:konstrukce][index]
        end
      end
      # Mazani uz vylozenych
      indexy_vylozenych.each do |index_item|
        material[:konstrukce].delete_at(index_item)
      end
    end

    def zkontroluj_prichozi_elektroinstalace(material)
      indexy_vylozenych = []
      material[:elektroinstalace].length.times do |index|
        pridano = @sklad.prijmout_elektroinstalace(material[:elektroinstalace][index])
        if pridano == material[:elektroinstalace][index]
          indexy_vylozenych << index
        elsif pridano < material[:elektroinstalace][index] and pridano != 0
          @cekajici_nakladaky[:elektroinstalace] << material[:elektroinstalace][index] - pridano
        elsif pridano == 0
          @cekajici_nakladaky[:elektroinstalace] << material[:elektroinstalace][index]
        end
      end
      # Mazani uz vylozenych
      indexy_vylozenych.each do |index_item|
        material[:elektroinstalace].delete_at(index_item)
      end
    end

    def zkontroluj_prichozi_matrace(material)
      indexy_vylozenych = []
      material[:matrace].length.times do |index|
        pridano = @sklad.prijmout_matrace(material[:matrace][index])
        if pridano == material[:matrace][index]
          indexy_vylozenych << index
        elsif pridano < material[:matrace][index] and pridano != 0
          @cekajici_nakladaky[:matrace] << material[:matrace][index] - pridano
        elsif pridano == 0
          @cekajici_nakladaky[:matrace] << material[:matrace][index]
        end
      end
      # Mazani uz vylozenych
      indexy_vylozenych.each do |index_item|
        material[:matrace].delete_at(index_item)
      end
    end


    if material[:konstrukce].length > 0
      zkontroluj_prichozi_konstrukce(material)
    end

    if material[:elektroinstalace].length > 0
      zkontroluj_prichozi_elektroinstalace(material)
    end

    if material[:matrace].length > 0
      zkontroluj_prichozi_matrace(material)
    end

    #puts @cekajici_nakladaky

    # IMPLEMENTUJE!
    # Prijmete do skladu jednotlive typy materialu.
    # Pokud se nepodari kompletne vylozit nakladak s materialem,
    # pak jej zaevidujte do cekajicich nakladaku dle typu materialu,
    # ktery dovezl. Pokud jiz nejake nakladaky cekaji, pak se nejdrive
    # vylozi material z nich a az po nich se pripadne vykladaji nakladaky,
    # ktere nove prijely.

  end

  # Ulozi objednavky k vyrizeni v poradi v jakem byly
  # metode predany v parametru objednavky, ktery je typu pole.
  def prijmout_objednavky(objednavky)
    objednavky.each do |obj|
      obj[:dodana_luzka] = []
      @objednavky_k_vyrizeni << obj
    end
  end

  # IMPLEMENTUJTE!
  # Nejdrive metoda zjisti kolik luzek lze vyrobit.
  # To se urci rna zaklade nasledujiciho:
  #   Nelze vyrobit vice luzek, nez se jich vejde do skladu.
  #   Nelze vyrobit vice luzek, nez je vyrobni kapacita firmy.
  #   Pro vyrobu jednoho luzka je zapotrebi 1ks od kazdeho typu materialu.
  #     Je tedy poteba 1ks ocelove konstrukce, 1ks elektroinstalace 1ks matrace.
  # Pak probiha samotna vyroba. Tedy vytvareni instanci tridy Luzko, s tim, ze
  # nazev luzka bude LUZKO_X, kde X je hodnota z @citac_vyrobnich_cisel, ktery po
  # vyrobeni jednoho luzka zvyste o jednicku.
  # Vyrobena luzka ulozte na sklad a odeberte spotrebovany material ze skladu.
  def vyrobit_luzka
    muzeme_vyrobit = 0
    if @sklad.volne_misto_luzka >= @vyrobni_kapacita
      muzeme_vyrobit = @vyrobni_kapacita
    elsif @sklad.volne_misto_luzka < @vyrobni_kapacita
      muzeme_vyrobit = @sklad.volne_misto_luzka
    end

    if sklad.konstrukce < muzeme_vyrobit
      muzeme_vyrobit = sklad.konstrukce
    end
    if sklad.elektroinstalace < muzeme_vyrobit
      muzeme_vyrobit = sklad.elektroinstalace
    end
    if sklad.matrace < muzeme_vyrobit
      muzeme_vyrobit = sklad.matrace
    end

    luzka = []
    muzeme_vyrobit.times do
      luzka << Luzko.new("LUZKO_" + @citac_vyrobnich_cisel.to_s, @den)
      @citac_vyrobnich_cisel += 1
    end
    #puts luzka.to_s
    sklad.prijmout_luzka(luzka)
    sklad.odebrat_konstrukce(muzeme_vyrobit)
    sklad.odebrat_matrace(muzeme_vyrobit)
    sklad.odebrat_elektroinstalace(muzeme_vyrobit)
  end

  # Pokud mame nejake objednavky k vyrizeni a zaroven mame na sklade pripravena luzka,
  # pak zpracovavame objednavky. Pokud je objednavka vyrizena, pak je presunuta do
  # vyrizenych objednavek.
  def zpracovat_objednavky
    while (!@objednavky_k_vyrizeni.empty? and !@sklad.luzka.empty?)
      prodano = @objednavky_k_vyrizeni[0][:pocet_ks] > @sklad.luzka.length ? @sklad.luzka.length : @objednavky_k_vyrizeni[0][:pocet_ks]
      @sklad.vyskladnit_luzka(prodano).each do |luzko|
        @objednavky_k_vyrizeni[0][:dodana_luzka] << luzko
      end
      @objednavky_k_vyrizeni[0][:pocet_ks] -= prodano
      @rozpocet += prodano * CENA_LUZKO
      if @objednavky_k_vyrizeni[0][:pocet_ks] == 0
        @objednavky_vyrizene << @objednavky_k_vyrizeni.shift
      end
    end
  end

  # IMPLEMENTUJTE
  # Za kazdou objednavku, ktera je k vyrizeni a za
  # kazdy jednotlivy cekajici nakladak odectete z firemniho rozpoctu
  # prislusnou pokutu.
  def zaplatit_pokuty
    @objednavky_k_vyrizeni.each do
      @rozpocet -= POKUTA_PRODLENI_OBJEDNAVKA
      #puts "placena pokuta za nevyrizene objednavky"
    end

    @cekajici_nakladaky[:konstrukce].each do
      @rozpocet -= POKUTA_PRODLENI_MATERIAL
      #puts "placena pokuta za kamion s konstrukci"
    end

    @cekajici_nakladaky[:elektroinstalace].each do
      @rozpocet -= POKUTA_PRODLENI_MATERIAL
      #puts "placena pokuta za kamion s elektroinstalace"
    end

    @cekajici_nakladaky[:matrace].each do
      @rozpocet -= POKUTA_PRODLENI_MATERIAL
      #puts "placena pokuta za kamion s matrace"
    end
  end

  def simuluj_den(material, objednavky)
    prijmout_material(material)
    prijmout_objednavky(objednavky)
    vyrobit_luzka
    zpracovat_objednavky
    zaplatit_pokuty
    @den += 1
  end

end

class Sklad
  attr_reader :konstrukce, :elektroinstalace, :matrace, :luzka

  def initialize(kap_konstrukce, kap_elektroinstalace, kap_matrace, kap_luzka)
    # Kapacity kolik kusu konstrukci, elektroinstalaci, matraci a luzek se vejde na sklad
    @kap_konstrukce = kap_konstrukce
    @kap_elektroinstalace = kap_elektroinstalace
    @kap_matrace = kap_matrace
    @kap_luzka = kap_luzka

    # Pocet konstrukci, elektroinstalaci a matraci ulozen na sklade
    @konstrukce = 0
    @elektroinstalace = 0
    @matrace = 0
    # Uskladnena luzka
    @luzka = []
  end

  # IMPLEMENTUJTE!
  # Odebere dany pocet kusu konstrukci ze skladu.
  # Vrati pocet odebranych kusu ze skladu.
  # Pokud bude pocet konstrukci na sklade napr. 5 a
  # parametr pocet bude 7, pak bude odebrano pouze 5
  # konstrukci.
  # Metoda vrati skutecne odebrany pocet kusu ze skladu.
  def odebrat_konstrukce(pocet)
    if pocet <= @konstrukce
      @konstrukce -= pocet
      return pocet
    elsif pocet > @konstrukce
      val = @konstrukce
      @konstrukce = 0
      return val
    end
  end

  # IMPLEMENTUJTE!
  # Logika je stejna jako u odebrat_konstrukce, ale odebira
  # material typu elektroinstalace.
  def odebrat_elektroinstalace(pocet)
    if pocet <= @elektroinstalace
      @elektroinstalace -= pocet
      return pocet
    elsif pocet > @elektroinstalace
      val = @elektroinstalace
      @elektroinstalace = 0
      return val
    end
  end

  # IMPLEMENTUJTE!
  # Logika je stejna jako u odebrat_konstrukce, ale odebira
  # material typu matrace.
  def odebrat_matrace(pocet)
    if pocet <= @matrace
      @matrace -= pocet
      return pocet
    elsif pocet > @matrace
      val = @matrace
      @matrace = 0
      return val
    end
  end

  # IMPLEMENTUJTE!
  # Metoda prida do skladu dany pocet konstrukci,
  # ale maximalne tolik kolik se jich na sklad jeste vejde.
  # Pokud bude napr. pocet = 10 a do skladu se uz vejdou
  # pouze 3 konstrukce, pak budou prijaty pouze 3.
  # Metoda vraci pocet konstrukci, ktere se podarilo prijmout
  # do skladu.
  def prijmout_konstrukce(pocet)
    if pocet + @konstrukce < @kap_konstrukce
      @konstrukce += pocet
      return pocet
    elsif @konstrukce < @kap_konstrukce and pocet + @konstrukce >= @kap_konstrukce
      volna_mista = @kap_konstrukce - @konstrukce
      if pocet > volna_mista
        @konstrukce += volna_mista
        return volna_mista
      else
        # pocet == volna_mista
        @konstrukce += pocet
        return pocet
      end
    else
      #@konstrukce == @kap_konstrukce - plny sklad
      return 0
    end
  end

  # IMPLEMENUJTE!
  # Logika je stejna jako v metode prijmout_konstrukce,
  # ale prijima elektroinstalace.
  def prijmout_elektroinstalace(pocet)
    if pocet + @elektroinstalace < @kap_elektroinstalace
      @elektroinstalace += pocet
      return pocet
    elsif @elektroinstalace < @kap_elektroinstalace and pocet + @elektroinstalace >= @kap_elektroinstalace
      volna_mista = @kap_elektroinstalace - @elektroinstalace
      if pocet > volna_mista
        @elektroinstalace += volna_mista
        return volna_mista
      else
        # pocet == volna_mista
        @elektroinstalace += pocet
        return pocet
      end
    else
      #@elektroinstalace == @kap_elektroinstalace - plny sklad
      return 0
    end
  end

  # IMPLEMENUJTE!
  # Logika je stejna jako v metode prijmout_konstrukce,
  # ale prijima matrace.
  def prijmout_matrace(pocet)
    if pocet + @matrace < @kap_matrace
      @matrace += pocet
      return pocet
    elsif @matrace < @kap_matrace and pocet + @matrace >= @kap_matrace
      volna_mista = @kap_matrace - @matrace
      if pocet > volna_mista
        @matrace += volna_mista
        return volna_mista
      else
        # pocet == volna_mista
        @matrace += pocet
        return pocet
      end
    else
      #@matrace == @kap_matrace - plny sklad
      return 0
    end
  end

  # Vraci pocet volnych mist pro uskladneni hotovych luzek.
  def volne_misto_luzka
    return @kap_luzka - @luzka.length
  end

  # Metoda prijme na sklad luzka, ale maximalne jich
  # prijme tolik, kolik se na sklad vejde.
  # Metoda vrati pole obsahujici neprijata luzka.
  # Pokud jsou prijata vsechna luzka, pak vraci nil.
  def prijmout_luzka(luzka)
    if @kap_luzka - @luzka.length >= luzka.length
      luzka.each do |l|
        @luzka << l
      end
      return nil
    else
      (@kap_luzka - @luzka.length).times do
        @luzka << luzka.shift
      end
      return luzka
    end
  end

  # IMPLEMENTUJTE!
  # Metoda vrati pole obsahujici dany pocet luzek ze skladu.
  # Luzka jsou ze skladu brana v poradi v jakem byla
  # na sklad ulozena. Tzn. prvni uskladnene luzko bude
  # vyskladneno jako prvni.
  def vyskladnit_luzka(pocet)
    if @luzka.length - pocet >= @luzka.length
      vyskladnene_luzka = []
      pocet.times do
        vyskladnene_luzka << @luzka.shift
      end
      return vyskladnene_luzka
    else
      val = @luzka
      @luzka = []
      return val
    end

  end
end

  class Luzko
    attr_reader :vyrobni_cislo, :den_vyroby

    def initialize(vyrobni_cislo, den_vyroby)
      @vyrobni_cislo = vyrobni_cislo
      @den_vyroby = den_vyroby
    end
  end

  sklad = Sklad.new(30, 50, 30, 100)
  firma = Firma.new(sklad, 1000, 30)

  File.open(NAZEV_SOUBORU_UDALOSTI, "r") do |soubor|
    konstrukce = []
    elektroinstalace = []
    matrace = []
    objednavky = []
    day_counter = 0
    soubor.each_line do |line|
      if line.strip == "DEN_SIMULACE"
        if day_counter != 0
          prijem_materialu = {:konstrukce => konstrukce, :elektroinstalace => elektroinstalace, :matrace => matrace}
          firma.simuluj_den(prijem_materialu, objednavky)
          #puts "DEN CISLO " + day_counter.to_s
          #puts "MATERIAL - " + prijem_materialu.to_s
          #puts "OBJEDNAVKY - " + objednavky.to_s
        end
        konstrukce = []
        elektroinstalace = []
        matrace = []
        objednavky = []
        day_counter += 1
      else
        str = line.strip.split(',')
        if str[0] == "PRIJEM_MATERIALU" and str[1] == "KONSTRUKCE"
          konstrukce << str[2].to_i
        end
        if str[0] == "PRIJEM_MATERIALU" and str[1] == "ELEKTROINSTALACE"
          elektroinstalace << str[2].to_i
        end
        if str[0] == "PRIJEM_MATERIALU" and str[1] == "MATRACE"
          matrace << str[2].to_i
        end
        if str[0] =~ /OBJEDNAVKA_(\d){1,4}/
          objednavky << {:kod => str[0], :pocet_ks => str[1].to_i}
        end
        #puts line
      end
      # IMPLEMENTUJTE!
      # Ctete data ze vstupniho souboru a pro kazdy den simulace zavolejte na
      # firme metodu simuluj_den, ktera ocekava dva parametry: prijem_materialu a objednavky
      #
      # Prijem materilu ocekava jako asociativni pole kde pod klici :konstrukce, :elektroinstalace a :matrace
      # jsou pole obycejna obsahujici cela cisla, ktera reprezentuji jednotlive nakladaky s danym poctem kusu prislusneho
      # materialu. Pokud v dany den neprijede nakladak s danym typem materialu, pak je pod prislusnym klicem ulozeno prazdne pole.
      #
      # Objednavky ocekava jako pole obsahujici objednavky, kde jednotlive objednavky jsou reprezentovany
      # asociativnim polem, kde je pod klicem :kod ulozen kod objednavky a pod klicem :pocet_ks objednany pocet kusu luzek.
      # Pokud v dany den neni zadna objednavka, pak je toto pole prazdne.
      #
      # PRIKLAD:
      # Pro druhy den simulace (na zaklade dodanych vstupnich dat) byla metoda simuluj_den zavolana s hodnotami parametru:
      # prijem_materialu = {:konstrukce => [10,15,100], :elektroinstalace => [50], :matrace => [30]}
      # objednavky = [{:kod => "OBJEDNAVKA_3", :pocet_ks => 20},{:kod => "OBJEDNAVKA_4", :pocet_ks => 30}]

    end
  end
  puts "Konec simulace"
  puts "Pocet dni simulace: #{firma.den}"
  puts "Rozpocet: #{firma.rozpocet}"
  puts "Nevyrizene objednavky:"
  firma.objednavky_k_vyrizeni.each do |obj|
    puts "\t#{obj[:kod]} #{obj[:pocet_ks]}"
  end
  puts "Vyrizene objednavky:"
  firma.objednavky_vyrizene.each do |obj|
    puts "\t#{obj[:kod]}"
    puts "\tDodana luzka:"
    obj[:dodana_luzka].each do |luzko|
      puts "\t\t#{luzko.vyrobni_cislo}, Vyrobeno: #{luzko.den_vyroby}. den"
    end
  end