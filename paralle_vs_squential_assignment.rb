require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    a = 1
    b = 2
  end

  x.report('slow') do
    a, b = 1, 2
  end
end

#Calculating -------------------------------------
#fast    138242 i/100ms
#slow    131565 i/100ms
#-------------------------------------------------
#fast  9054338.6 (±10.7%) i/s -   44513924 in   5.007639s
#slow  6618442.7 (±6.7%) i/s -   32891250 in   5.002414s
