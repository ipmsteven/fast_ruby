require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    (1..100).flat_map do
      #do somethig
    end
  end
  x.report('slow') do
    (1..100).map do
      #do something
    end.flatten(1)
  end
end

#Calculating -------------------------------------
#fast    101778 i/100ms
#slow      6360 i/100ms
#-------------------------------------------------
#fast  2682319.4 (±8.1%) i/s -   13332918 in   5.017603s
#slow    68343.1 (±2.8%) i/s -     343440 in   5.029125s
