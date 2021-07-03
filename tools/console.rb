require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Grid", "Khang", "Khangs Domain")
startup2 = Startup.new("Coolio", "Tom", "Toms Domain")
startup3 = Startup.new("Diswat", "Alex", "Alexs Domain")
startup4 = Startup.new("QueeCat", "Tom", "Toms Domain")

vc1 = VentureCapitalist.new("Max", 10000)
vc2 = VentureCapitalist.new("Julien", 100000)
vc3 = VentureCapitalist.new("Richard", 10**10)

funding_round1 = FundingRound.new(startup1, vc1, "Angel", 500)
funding_round2 = FundingRound.new(startup1, vc2, "Angel", 1000)
funding_round3 = FundingRound.new(startup1, vc3, "Angel", 1000)
funding_round4 = FundingRound.new(startup2, vc1, "Series A", 700)
funding_round5 = FundingRound.new(startup2, vc2, "Series A", 300)
funding_round6 = FundingRound.new(startup2, vc3, "Series A", 100)
funding_round7 = FundingRound.new(startup3, vc1, "Series B", 700)
funding_round8 = FundingRound.new(startup3, vc2, "Series B", 300)
funding_round9 = FundingRound.new(startup3, vc3, "Series B", 100)
funding_round10 = FundingRound.new(startup4, vc3, "Series B", 100)
funding_round10 = FundingRound.new(startup4, vc3, "Series B", 1000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
