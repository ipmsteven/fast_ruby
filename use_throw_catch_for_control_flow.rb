require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('fast') do
    catch(:Object) do
      if Object.respond_to?(:haha)
        Object.haha
      else
        throw(:Object, 'haha')
      end
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
#fast     81012 i/100ms
#slow     26976 i/100ms
#-------------------------------------------------
#fast  1642871.3 (±7.7%) i/s -    8182212 in   5.019510s
#slow   350661.6 (±4.6%) i/s -    1753440 in   5.011233s
