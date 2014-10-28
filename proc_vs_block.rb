require 'benchmark/ips'

def slow(&block)
  block.call
end

def fast
  yield
end

Benchmark.ips do |x|
  x.report('fast') { fast{} }
  x.report('slow') { slow{} }
end

#Calculating -------------------------------------
#fast    127902 i/100ms
#slow     66015 i/100ms
#-------------------------------------------------
#fast  6167021.2 (±5.9%) i/s -   30696480 in   5.001110s
#slow  1127653.1 (±4.6%) i/s -    5677290 in   5.045766s

Benchmark.ips do |x|
  x.report('fast') do
    (1..100).map(&:to_s)
  end
  x.report('slow') do
    (1..100).map { |i| i.to_s }
  end
end

# Wired? because ruby optimized sym.to_proc since ruby1.9
#Calculating -------------------------------------
#fast      5906 i/100ms
#slow      5059 i/100ms
#-------------------------------------------------
#fast    61952.0 (±2.4%) i/s -     313018 in   5.055735s
#slow    52726.1 (±3.2%) i/s -     268127 in   5.090979s
