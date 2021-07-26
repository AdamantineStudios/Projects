require_relative "quicksort"
require_relative "hrabisort"
require_relative "insertion_sort"
require 'benchmark'


config_arr = [[10,50000],[40,10000],[160,2000],[640,200],[2560, 20], [10240,5]]

File.open("ratios.txt","w") do |lineratios|
  lineratios.puts "# m         K1              K2              K3              insert            quick"

  File.open("times.txt","w") do |timeline|
    timeline.puts "# m         K1              K2              K3              insert            quick"



    config_arr.each do |array|
      test_array = []
      m = array[0]
      n = array[1]
      length = n-1

      n.times do |i|
        hh_array = []
        m.times do
          hh_array << rand(0..length)
        end
        test_array << hh_array

      end

      x = test_array
      y = test_array
      z = test_array
      g = test_array
      h = test_array

      t_hrabisort = Benchmark.realtime do
        x.each do |array|
          array.hrabisort!
        end
      end

      t_hrabisort_k2 = Benchmark.realtime do
        y.each do |array|
          array.hrabisort!(2)
        end
      end

      t_hrabisort_k3 = Benchmark.realtime do
        z.each do |array|
          array.hrabisort!(3)
        end
      end

      t_insertion_sort = Benchmark.realtime do
        g.each do |array|
          array.insertion_sort!
        end
      end

      t_quicksort = Benchmark.realtime do
        h.each do |array|
          array.quicksort!
        end
      end





      puts "----------Pole: #{n}----prvky:---#{m}------------------"

      puts "Hrabisort ktype 1 cas: #{t_hrabisort.to_f/n}"
      puts "Hrabisort ktype 1 pomer:#{(t_hrabisort.to_f/n)/(m*Math.log(m))}"
      puts "Hrabisort ktype 2 cas: #{t_hrabisort_k2.to_f/n}"
      puts "Hrabisort ktype 2 pomer:#{(t_hrabisort_k2.to_f/n)/(m*Math.log(m))}"
      puts "Hrabisort ktype 3 cas: #{t_hrabisort_k3.to_f/n}"
      puts "Hrabisort ktype 3 pomer:#{(t_hrabisort_k3.to_f/n)/(m*Math.log(m))}"
      puts "Insertionsort cas: #{t_insertion_sort.to_f/n}"
      puts "Insertionsort pomer: #{(t_insertion_sort.to_f/n)/(m*Math.log(m))}"
      puts "Quicksort cas: #{t_quicksort.to_f/n}"
      puts "Quicksort pomer: #{(t_quicksort.to_f/n)/(m*Math.log(m))}"


      timeline.puts"#{m}    #{(t_hrabisort.to_f/n)}      #{t_hrabisort_k2.to_f/n}      #{t_hrabisort_k3.to_f/n}      #{t_insertion_sort.to_f/n}      #{t_quicksort.to_f/n}"
      lineratios.puts"#{m}    #{(t_hrabisort.to_f/n)/(m*Math.log(m))}      #{(t_hrabisort_k2.to_f/n)/(m*Math.log(m))} #{(t_hrabisort_k3.to_f/n)/(m*Math.log(m))} #{(t_insertion_sort.to_f/n)/(m*Math.log(m))} #{(t_quicksort.to_f/n)/(m*Math.log(m))} "

    end
  end
end
