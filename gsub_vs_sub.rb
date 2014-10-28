require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    'http://rubyconf.com'.sub('http://','https://')
  end
  x.report('slow') do
    'http://rubyconf.com'.gsub('http://','https://')
  end
end

#Calculating -------------------------------------
#fast     60899 i/100ms
#slow     34404 i/100ms
#-------------------------------------------------
#fast  1087665.0 (±3.2%) i/s -    5480910 in   5.044814s
#slow   449032.8 (±3.5%) i/s -    2270664 in   5.063372s
