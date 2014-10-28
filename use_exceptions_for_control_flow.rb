require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    if Object.respond_to?(:haha)
      haha
    else
      self
    end
  end
  x.report('slow') do
    begin
      Object.haha
    rescue NoMethodError
      self
    end
  end
end

#Calculating -------------------------------------
#fast    125599 i/100ms
#slow     25144 i/100ms
#-------------------------------------------------
#fast  4974667.2 (±5.0%) i/s -   24868602 in   5.013627s
#slow   352212.3 (±3.9%) i/s -    1760080 in   5.005178s
