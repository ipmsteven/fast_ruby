require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    [1,2,3].inject({}) do |h, e|
      h.merge!(e => e)
    end
  end

  x.report('slow') do
    [1,2,3].inject({}) do |h, e|
      h.merge!(e => e)
    end
  end
end

#Calculating -------------------------------------
#fast     29506 i/100ms
#slow     29436 i/100ms
#-------------------------------------------------
#fast   365342.9 (±4.2%) i/s -    1829372 in   5.016446s
#slow   367751.2 (±4.4%) i/s -    1854468 in   5.052928s

Benchmark.ips do |x|
  x.report('fast') do
    [1,2,3].each_with_object({}) do |e, h|
      h[e]= e
    end
  end

  x.report('slow') do
    [1,2,3].each_with_object({}) do |e, h|
      h.merge!(e => e)
    end
  end
end

#Calculating -------------------------------------
#fast     57344 i/100ms
#slow     24775 i/100ms
#-------------------------------------------------
#fast   870198.8 (±9.9%) i/s -    4300800 in   5.047485s
#slow   364597.2 (±10.7%) i/s -    1808575 in   5.034240s
