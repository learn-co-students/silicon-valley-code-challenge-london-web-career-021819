require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new('st1', 'fez1', 'www.s1.com')
s2 = Startup.new('st2', 'fez2', 'www.s2.com')

vc1 = VentureCapitalist.new('richboiz', 10000000000)
vc2 = VentureCapitalist.new('poorboiz', 5000)

f1 = FundingRound.new(s1, vc1, 'first', 10000000)
f2 = FundingRound.new(s2, vc2, 'second', 1000)

f3 = FundingRound.new(s1, vc1, 'second', 20000000)
f4 = FundingRound.new(s2, vc1, 'third', 2000)

f5 = FundingRound.new(s1, vc2, 'third', 3000000)
f6 = FundingRound.new(s2, vc2, 'fourth', 300)


binding.pry
0
