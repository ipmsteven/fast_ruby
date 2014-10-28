require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    {:ruby => :conf}.fetch(:ruby) {[1,2,3]}
  end
  x.report('slow') do
    {:ruby => :conf}.fetch(:ruby, [1,2,3])
  end
end

#Calculating -------------------------------------
#fast     79356 i/100ms
#slow     77899 i/100ms
#-------------------------------------------------
#fast  1615952.1 (±6.3%) i/s -    8094312 in   5.030815s
#slow  1516178.9 (±5.7%) i/s -    7556203 in   5.001066s
