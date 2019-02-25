require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("minnows", "me", "tech")
s2 = Startup.new("giants", "Johnny", "catering")
s3 = Startup.new("fun", "Francis", "entertainment")
s4 = Startup.new("the best", "Johnny", "sports")
s5 = Startup.new("not bad", "Francis", "sports")


vc1 = VentureCapitalist.new("Bob", 50)
vc2 = VentureCapitalist.new("Margaret", 25000000000000)
vc3 = VentureCapitalist.new("Scrooge McDuck", 1000000001)

fr1 = FundingRound.new(s1, vc1, "Angel", 32)
fr2 = FundingRound.new(s2, vc2, "Seed", 12000000000)
fr3 = FundingRound.new(s3, vc3, "Series A", 3000000)
fr4 = FundingRound.new(s1, vc2, "Angel", 10)
fr5 = FundingRound.new(s2, vc3, "Series B", 1000000000)
fr6 = FundingRound.new(s3, vc1, "Series C", 33000000)
fr7 = FundingRound.new(s2, vc2, "Series C", 300)
fr8 = FundingRound.new(s2, vc1, "Angel", 10)
fr9 = FundingRound.new(s4, vc2, "Angel", 150000)
fr10 = FundingRound.new(s5, vc2, "Angel", 250000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line
