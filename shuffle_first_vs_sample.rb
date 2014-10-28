require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    [1,2,3].sample
  end

  x.report('slow') do
    [1,2,3].shuffle.first
  end
end

#Calculating -------------------------------------
#fast    124132 i/100ms
#slow    109891 i/100ms
#-------------------------------------------------
#fast  5208985.6 (±5.8%) i/s -   25943588 in   5.000811s
#slow  3536529.2 (±4.4%) i/s -   17692451 in   5.013693s
