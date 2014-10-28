require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    (1..100).to_a.reverse_each do
      #do somethig
    end
  end
  x.report('slow') do
    (1..100).to_a.reverse.each do
      #do something
    end
  end
end

#Calculating -------------------------------------
#fast     10211 i/100ms
#slow      9946 i/100ms
#-------------------------------------------------
#fast   108707.8 (±5.1%) i/s -     551394 in   5.087264s
#slow   106691.8 (±3.4%) i/s -     537084 in   5.040267s
