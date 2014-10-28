require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    {}.each_key {}
  end

  x.report('slow') do
    {}.keys.each {}
  end
end

#Calculating -------------------------------------
#fast    127496 i/100ms
#slow    109618 i/100ms
#-------------------------------------------------
#fast  6541459.0 (±8.8%) i/s -   32383984 in   5.007046s
#slow  5087812.5 (±4.3%) i/s -   25431376 in   5.009357s
