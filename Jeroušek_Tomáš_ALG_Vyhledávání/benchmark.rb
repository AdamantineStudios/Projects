require "benchmark"
require_relative "binary_search_tree.rb"
require_relative "sorted_array.rb"
require_relative "unsorted_array.rb"




preferences = [[10, 50000], [50, 10000], [100, 5000], [500, 1000], [1000, 20], [5000, 10]]

namerene_hodnoty =
    {
        10 =>
            {
                :unsorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :sorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_doby_10ti_hledani_interps => nil,
                        :prumer_doby_10ti_hledani_interps => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :binary_search_tree =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    }
            },

        50 =>
            {
                :unsorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :sorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_doby_10ti_hledani_interps => nil,
                        :prumer_doby_10ti_hledani_interps => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :binary_search_tree =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    }
            },

        100 =>
            {
                :unsorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :sorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_doby_10ti_hledani_interps => nil,
                        :prumer_doby_10ti_hledani_interps => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :binary_search_tree =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    }
            },

        500 =>
            {
                :unsorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :sorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_doby_10ti_hledani_interps => nil,
                        :prumer_doby_10ti_hledani_interps => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :binary_search_tree =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    }
            },

        1000 =>
            {
                :unsorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :sorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_doby_10ti_hledani_interps => nil,
                        :prumer_doby_10ti_hledani_interps => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :binary_search_tree =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    }
            },

        5000 =>
            {
                :unsorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :sorted_array =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_doby_10ti_hledani_interps => nil,
                        :prumer_doby_10ti_hledani_interps => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    },

                :binary_search_tree =>
                    {
                        :median_doby_10ti_vkladani => nil,
                        :median_doby_10ti_hledani => nil,
                        :median_doby_10ti_mazani => nil,

                        :prumer_doby_10ti_vkladani => nil,
                        :prumer_doby_10ti_hledani => nil,
                        :prumer_doby_10ti_mazani => nil,

                        :median_poctu_prvku_po_vkladani => nil,
                        :median_poctu_prvku_po_smazani => nil,

                        :prumer_poctu_prvku_po_vkladani => nil,
                        :prumer_poctu_prvku_po_smazani => nil
                    }
            }
    }



def generuj_prvky(preferences)
  # [[ [...m], ...n ], ...6 ]
  nesetrizena_pole = []

  preferences.each_with_index do |preference, index|
    m = preference[0]
    n = preference[1]
    nesetrizena_pole[index] = []

    n.times do |i|
      nesetrizena_pole[index][i] = []

      m.times do |j|
        nesetrizena_pole[index][i] << rand(m - 1)
      end
    end
  end

  nesetrizena_pole
end




def generuj_instance(ceho, kolik)
  pole_instanci = []

  kolik.times do |i|
    if ceho == "unsorted_array"
      pole_instanci << UnsortedArray.new
    end

    if ceho == "sorted_array"
      pole_instanci << SortedArray.new
    end

    if ceho == "binary_search_tree"
      pole_instanci << BinarySearchTree.new
    end
  end

  pole_instanci
end




def zmer_dobu_operace(operace, m, n, pole_instanci, pole_prvku, i_n)
  vysledky = []
  pocet_prvku = []
  suma = 0

  doba_trvani = Benchmark.realtime do
    n.times do |j|
      vlozene_prvky = {}
      pocet_prvku[j] = 0

      m.times do |k|
        if operace == "vkladani"
          pole_instanci[j].insert(pole_prvku[i_n][j][k])

          unless vlozene_prvky.has_key?(pole_prvku[i_n][j][k])
            vlozene_prvky[pole_prvku[i_n][j][k]] = nil
            pocet_prvku[j] += 1
          end
        end

        if operace == "hledani"
          pole_instanci[j].find(pole_prvku[i_n][j][k])
        end

        if operace == "hledani_binarys"
          pole_instanci[j].binary_search(pole_prvku[i_n][j][k])
        end

        if operace == "hledani_interps"
          pole_instanci[j].interpolation_search(pole_prvku[i_n][j][k])
        end

        if operace == "mazani"
          if pole_instanci[j].delete(pole_prvku[i_n][j][k])
            pocet_prvku[j] += 1
          end
        end
      end

      suma += pocet_prvku[j]
    end
  end

  vysledky[0] = doba_trvani


  if (pocet_prvku.length / 2) % 2 == 0
    pocet_prvku.sort
    vysledky[1] = (pocet_prvku[pocet_prvku.length / 2] + pocet_prvku[pocet_prvku.length / 2 + 1]) / 2
  else
    pocet_prvku.sort
    vysledky[1] = [pocet_prvku.length / 2]
  end


  vysledky[2] = suma / pocet_prvku.length

  vysledky
end




def vyhodnot_jedno_m(m, datova_struktura, typ_promenne_1, typ_promenne_2, matematicka_operace, desetkrat, namerene_hodnoty)

  # Pro výpočet mediánu
  if matematicka_operace == :median
    # Pro výpočet doby
    cisla = desetkrat[datova_struktura][typ_promenne_2].sort if typ_promenne_2 == :doba_vkladani || typ_promenne_2 == :doba_hledani || typ_promenne_2 == :doba_hledani_interps || typ_promenne_2 == :doba_mazani

    # Pro výpočet počtu prvků
    cisla = desetkrat[datova_struktura][:median][typ_promenne_2].sort if typ_promenne_2 != :doba_vkladani && typ_promenne_2 != :doba_hledani && typ_promenne_2 != :doba_hledani_interps && typ_promenne_2 != :doba_mazani

    if cisla.length % 2 == 0
      namerene_hodnoty[m][datova_struktura][typ_promenne_1] = (cisla[cisla.length / 2] + cisla[cisla.length / 2 + 1]) / 2
    else
      namerene_hodnoty[m][datova_struktura][typ_promenne_1] = cisla[cisla.length / 2]
    end

    # Pro výpočet průměru
  elsif matematicka_operace == :prumer

    # Pro výpočet doby
    if typ_promenne_2 == :doba_vkladani || typ_promenne_2 == :doba_hledani || typ_promenne_2 == :doba_hledani_interps || typ_promenne_2 == :doba_mazani
      cisla = desetkrat[datova_struktura][typ_promenne_2]

      upraveny_typ_promenne_2 = typ_promenne_2.to_s
      upraveny_typ_promenne_2[3] = "y"
      upraveny_typ_promenne_2 = ("suma_" + upraveny_typ_promenne_2).to_sym
      suma = desetkrat[datova_struktura][upraveny_typ_promenne_2]

      namerene_hodnoty[m][datova_struktura][typ_promenne_1] = suma / cisla.length

      # Pro výpočet počtu prvků
    else
      cisla = desetkrat[datova_struktura][:prumer][typ_promenne_2]

      upraveny_typ_promenne_2 = typ_promenne_2.to_s
      upraveny_typ_promenne_2 = ("suma_" + upraveny_typ_promenne_2).to_sym
      suma = desetkrat[datova_struktura][:prumer][upraveny_typ_promenne_2]

      namerene_hodnoty[m][datova_struktura][typ_promenne_1] = suma / cisla.length
    end
  end

  namerene_hodnoty
end



def add_spaces_until(n_mezer, delka_retezce)
  mezery = ""

  (n_mezer - delka_retezce).times do
    mezery += " "
  end

  mezery
end




def vytvor_radek(m, n, matematicka_operace, namerene_hodnoty, typ)
  row = m.to_s
  row += add_spaces_until(12, m.to_s.length)

  if typ == :vypocet_doby
    # INSERT
    mat_op = (matematicka_operace.to_s + "_doby_10ti_vkladani").to_sym

    # UnsortedArray
    vypocet = ((namerene_hodnoty[m][:unsorted_array][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("UA_insert".length + 10, vypocet.to_s.length)

    # SortedArray
    vypocet = ((namerene_hodnoty[m][:sorted_array][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("SA_insert".length + 10, vypocet.to_s.length)

    # BinarySearchTree
    vypocet = ((namerene_hodnoty[m][:binary_search_tree][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("BST_insert".length + 10, vypocet.to_s.length)


    # FIND
    mat_op = (matematicka_operace.to_s + "_doby_10ti_hledani").to_sym
    mat_op_2 = (matematicka_operace.to_s + "_doby_10ti_hledani_interps").to_sym

    # UnsortedArray
    vypocet = ((namerene_hodnoty[m][:unsorted_array][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("UA_search".length + 10, vypocet.to_s.length)

    # SortedArray - via binary search
    vypocet = ((namerene_hodnoty[m][:sorted_array][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("SA_binarys".length + 10, vypocet.to_s.length)

    # SortedArray - via interpolation search
    vypocet = ((namerene_hodnoty[m][:sorted_array][mat_op_2] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("SA_interps".length + 10, vypocet.to_s.length)

    # BinarySearchTree
    vypocet = ((namerene_hodnoty[m][:binary_search_tree][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("BST_search".length + 10, vypocet.to_s.length)


    # DELETE
    mat_op = (matematicka_operace.to_s + "_doby_10ti_mazani").to_sym

    # UnsortedArray
    vypocet = ((namerene_hodnoty[m][:unsorted_array][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("UA_delete".length + 10, vypocet.to_s.length)

    # SortedArray
    vypocet = ((namerene_hodnoty[m][:sorted_array][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("SA_delete".length + 10, vypocet.to_s.length)

    # BinarySearchTree
    vypocet = ((namerene_hodnoty[m][:binary_search_tree][mat_op] / n) / m).round(10)
    row += vypocet.to_s
    row += add_spaces_until("BST_delete".length + 10, vypocet.to_s.length)

  elsif typ == :prepis_poctu_prvku
    # INSERT
    mat_op = (matematicka_operace.to_s + "_poctu_prvku_po_vkladani").to_sym

    # UnsortedArray
    vypocet = namerene_hodnoty[m][:unsorted_array][mat_op]
    row += vypocet.to_s
    row += add_spaces_until("UA_insert".length + 10, vypocet.to_s.length)

    # SortedArray
    vypocet = namerene_hodnoty[m][:sorted_array][mat_op]
    row += vypocet.to_s
    row += add_spaces_until("SA_insert".length + 10, vypocet.to_s.length)

    # BinarySearchTree
    vypocet = namerene_hodnoty[m][:binary_search_tree][mat_op]
    row += vypocet.to_s
    row += add_spaces_until("BST_insert".length + 10, vypocet.to_s.length)

    # DELETE
    mat_op = (matematicka_operace.to_s + "_poctu_prvku_po_smazani").to_sym

    # UnsortedArray
    vypocet = namerene_hodnoty[m][:unsorted_array][mat_op]
    row += vypocet.to_s
    row += add_spaces_until("UA_delete".length + 10, vypocet.to_s.length)

    # SortedArray
    vypocet = namerene_hodnoty[m][:sorted_array][mat_op]
    row += vypocet.to_s
    row += add_spaces_until("SA_delete".length + 10, vypocet.to_s.length)

    # BinarySearchTree
    vypocet = namerene_hodnoty[m][:binary_search_tree][mat_op]
    row += vypocet.to_s
    row += add_spaces_until("BST_delete".length + 10, vypocet.to_s.length)
  end

  row
end




def zapis_do_souboru(preferences, namerene_hodnoty)
  times_med = File.open("times_med.txt","w")
  times_med.puts "#m          UA_insert          SA_insert          BST_insert          UA_search          SA_binarys          SA_interps          BST_search          UA_delete          SA_delete          BST_delete"

  times_avg = File.open("times_avg.txt","w")
  times_avg.puts "#m          UA_insert          SA_insert          BST_insert          UA_search          SA_binarys          SA_interps          BST_search          UA_delete          SA_delete          BST_delete"

  counts = File.open("counts.txt","w")
  counts.puts "#m          UA_insert          SA_insert          BST_insert          UA_delete          SA_delete          BST_delete"


  preferences.each do |preference|
    m = preference[0]
    n = preference[1]


    times_med.puts vytvor_radek(m, n, :median, namerene_hodnoty, :vypocet_doby)

    times_avg.puts vytvor_radek(m, n, :prumer, namerene_hodnoty, :vypocet_doby)

    counts.puts vytvor_radek(m, n,:median, namerene_hodnoty, :prepis_poctu_prvku)
  end

  times_med.close
  times_avg.close
  counts.close
end




preferences.each_with_index do |preference, i_n|
  m = preference[0]
  n = preference[1]

  desetkrat =
      {
          :unsorted_array =>
              {
                  :median =>
                      {
                          :vkladani => [], :mazani => []
                      },

                  :prumer =>
                      {
                          :vkladani => [], :mazani => [], :suma_vkladani => 0, :suma_mazani => 0
                      },

                  :doba_vkladani => [],
                  :doba_hledani => [],
                  :doba_mazani => [],

                  :suma_doby_vkladani => 0,
                  :suma_doby_hledani => 0,
                  :suma_doby_mazani => 0
              },

          :sorted_array =>
              {
                  :median =>
                      {
                          :vkladani => [], :mazani => []
                      },

                  :prumer =>
                      {
                          :vkladani => [], :mazani => [], :suma_vkladani => 0, :suma_mazani => 0
                      },

                  :doba_vkladani => [],
                  :doba_hledani => [],
                  :doba_hledani_interps => [],
                  :doba_mazani => [],

                  :suma_doby_vkladani => 0,
                  :suma_doby_hledani => 0,
                  :suma_doby_hledani_interps => 0,
                  :suma_doby_mazani => 0
              },

          :binary_search_tree =>
              {
                  :median =>
                      {
                          :vkladani => [], :mazani => []
                      },

                  :prumer =>
                      {
                          :vkladani => [], :mazani => [], :suma_vkladani => 0, :suma_mazani => 0
                      },

                  :doba_vkladani => [],
                  :doba_hledani => [],
                  :doba_mazani => [],

                  :suma_doby_vkladani => 0,
                  :suma_doby_hledani => 0,
                  :suma_doby_mazani => 0
              },
      }

  vysledky = [[], [], [], []]

  10.times do |i|

    instance_unsorted_array = generuj_instance("unsorted_array", n)
    instance_sorted_array = generuj_instance("sorted_array", n)
    instance_binary_seach_tree = generuj_instance("binary_search_tree", n)

    vkladane_prvky = generuj_prvky(preferences)
    hledane_prvky = generuj_prvky(preferences)
    mazane_prvky = generuj_prvky(preferences)


    vysledky[0] = zmer_dobu_operace("vkladani", m, n, instance_unsorted_array, vkladane_prvky, i_n)
    vysledky[1] = zmer_dobu_operace("vkladani", m, n, instance_sorted_array, vkladane_prvky, i_n)
    vysledky[2] = zmer_dobu_operace("vkladani", m, n, instance_binary_seach_tree, vkladane_prvky, i_n)

    desetkrat[:unsorted_array][:doba_vkladani] << vysledky[0][0]
    desetkrat[:unsorted_array][:suma_doby_vkladani] += vysledky[0][0]
    desetkrat[:unsorted_array][:median][:vkladani] << vysledky[0][1]
    desetkrat[:unsorted_array][:prumer][:vkladani] << vysledky[0][2]
    desetkrat[:unsorted_array][:prumer][:suma_vkladani] += vysledky[0][2]

    desetkrat[:sorted_array][:doba_vkladani] << vysledky[1][0]
    desetkrat[:sorted_array][:suma_doby_vkladani] += vysledky[1][0]
    desetkrat[:sorted_array][:median][:vkladani] << vysledky[1][1]
    desetkrat[:sorted_array][:prumer][:vkladani] << vysledky[1][2]
    desetkrat[:sorted_array][:prumer][:suma_vkladani] += vysledky[1][2]

    desetkrat[:binary_search_tree][:doba_vkladani] << vysledky[2][0]
    desetkrat[:binary_search_tree][:suma_doby_vkladani] += vysledky[2][0]
    desetkrat[:binary_search_tree][:median][:vkladani] << vysledky[2][1]
    desetkrat[:binary_search_tree][:prumer][:vkladani] << vysledky[2][2]
    desetkrat[:binary_search_tree][:prumer][:suma_vkladani] += vysledky[2][2]



    vysledky[0] = zmer_dobu_operace("hledani", m, n, instance_unsorted_array, hledane_prvky, i_n)
    vysledky[1] = zmer_dobu_operace("hledani_binarys", m, n, instance_sorted_array, hledane_prvky, i_n)
    vysledky[2] = zmer_dobu_operace("hledani", m, n, instance_binary_seach_tree, hledane_prvky, i_n)
    vysledky[3] = zmer_dobu_operace("hledani_interps", m, n, instance_sorted_array, hledane_prvky, i_n)

    desetkrat[:unsorted_array][:doba_hledani] << vysledky[0][0]
    desetkrat[:unsorted_array][:suma_doby_hledani] += vysledky[0][0]

    desetkrat[:sorted_array][:doba_hledani] << vysledky[1][0]
    desetkrat[:sorted_array][:suma_doby_hledani] += vysledky[1][0]

    desetkrat[:binary_search_tree][:doba_hledani] << vysledky[2][0]
    desetkrat[:binary_search_tree][:suma_doby_hledani] += vysledky[2][0]

    desetkrat[:sorted_array][:doba_hledani_interps] << vysledky[3][0]
    desetkrat[:sorted_array][:suma_doby_hledani_interps] += vysledky[3][0]



    vysledky[0] = zmer_dobu_operace("mazani", m, n, instance_unsorted_array, mazane_prvky, i_n)
    vysledky[1] = zmer_dobu_operace("mazani", m, n, instance_sorted_array, mazane_prvky, i_n)
    vysledky[2] = zmer_dobu_operace("mazani", m, n, instance_binary_seach_tree, mazane_prvky, i_n)

    desetkrat[:unsorted_array][:doba_mazani] << vysledky[0][0]
    desetkrat[:unsorted_array][:suma_doby_mazani] += vysledky[0][0]
    desetkrat[:unsorted_array][:median][:mazani] << vysledky[0][1]
    desetkrat[:unsorted_array][:prumer][:mazani] << vysledky[0][2]
    desetkrat[:unsorted_array][:prumer][:suma_mazani] += vysledky[0][2]

    desetkrat[:sorted_array][:doba_mazani] << vysledky[1][0]
    desetkrat[:sorted_array][:suma_doby_mazani] += vysledky[1][0]
    desetkrat[:sorted_array][:median][:mazani] << vysledky[1][1]
    desetkrat[:sorted_array][:prumer][:mazani] << vysledky[1][2]
    desetkrat[:sorted_array][:prumer][:suma_mazani] += vysledky[1][2]

    desetkrat[:binary_search_tree][:doba_mazani] << vysledky[2][0]
    desetkrat[:binary_search_tree][:suma_doby_mazani] += vysledky[2][0]
    desetkrat[:binary_search_tree][:median][:mazani] << vysledky[2][1]
    desetkrat[:binary_search_tree][:prumer][:mazani] << vysledky[2][2]
    desetkrat[:binary_search_tree][:prumer][:suma_mazani] += vysledky[2][2]
  end

# Vyhodnocení 1ho m ze 6 z výsledků 10ti opakování každé operace
# Vkládání - doba provedení operace
# Medián
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :median_doby_10ti_vkladani, :doba_vkladani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :median_doby_10ti_vkladani, :doba_vkladani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :median_doby_10ti_vkladani, :doba_vkladani, :median, desetkrat, namerene_hodnoty)

# Průměr
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :prumer_doby_10ti_vkladani, :doba_vkladani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :prumer_doby_10ti_vkladani, :doba_vkladani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :prumer_doby_10ti_vkladani, :doba_vkladani, :prumer, desetkrat, namerene_hodnoty)


# Hledání - doba provedení operace
# Medián
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :median_doby_10ti_hledani, :doba_hledani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :median_doby_10ti_hledani, :doba_hledani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :median_doby_10ti_hledani_interps, :doba_hledani_interps, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :median_doby_10ti_hledani, :doba_hledani, :median, desetkrat, namerene_hodnoty)

# Průměr
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :prumer_doby_10ti_hledani, :doba_hledani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :prumer_doby_10ti_hledani, :doba_hledani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :prumer_doby_10ti_hledani_interps, :doba_hledani_interps, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :prumer_doby_10ti_hledani, :doba_hledani, :prumer, desetkrat, namerene_hodnoty)


# Mazání - doba provedení operace
# Medián
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :median_doby_10ti_mazani, :doba_mazani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :median_doby_10ti_mazani,:doba_mazani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :median_doby_10ti_mazani, :doba_mazani, :median, desetkrat, namerene_hodnoty)

# Průměr
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :prumer_doby_10ti_mazani, :doba_mazani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :prumer_doby_10ti_mazani, :doba_mazani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :prumer_doby_10ti_mazani, :doba_mazani, :prumer, desetkrat, namerene_hodnoty)


# Vkládání - počet prvků
# Medián
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :median_poctu_prvku_po_vkladani, :vkladani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :median_poctu_prvku_po_vkladani, :vkladani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :median_poctu_prvku_po_vkladani, :vkladani, :median, desetkrat, namerene_hodnoty)

# Průměr
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :prumer_poctu_prvku_po_vkladani, :vkladani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :prumer_poctu_prvku_po_vkladani, :vkladani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :prumer_poctu_prvku_po_vkladani, :vkladani, :prumer, desetkrat, namerene_hodnoty)


# Mazání - počet prvků
# Medián
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :median_poctu_prvku_po_smazani, :mazani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :median_poctu_prvku_po_smazani, :mazani, :median, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :median_poctu_prvku_po_smazani, :mazani, :median, desetkrat, namerene_hodnoty)

# Průměr
  namerene_hodnoty = vyhodnot_jedno_m(m, :unsorted_array, :prumer_poctu_prvku_po_smazani, :mazani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :sorted_array, :prumer_poctu_prvku_po_smazani, :mazani, :prumer, desetkrat, namerene_hodnoty)
  namerene_hodnoty = vyhodnot_jedno_m(m, :binary_search_tree, :prumer_poctu_prvku_po_smazani, :mazani, :prumer, desetkrat, namerene_hodnoty)
  p namerene_hodnoty
end


zapis_do_souboru(preferences, namerene_hodnoty)