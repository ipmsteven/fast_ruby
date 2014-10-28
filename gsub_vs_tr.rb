require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    'slug from title'.tr(' ', '-')
  end
  x.report('slow') do
    'slug from title'.gsub(' ', '-')
  end
end

#Calculating -------------------------------------
#fast     82969 i/100ms
#slow     29624 i/100ms
#-------------------------------------------------
#fast  1852717.6 (±4.5%) i/s -    9292528 in   5.028025s
#slow   368432.1 (±4.5%) i/s -    1866312 in   5.076678s
