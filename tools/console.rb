require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("queers_with_gears", "Schazbot", "cycling")
s2 = Startup.new("dykes_on_bikes", "Hunter", "cycling")
s3 = Startup.new("grind_n_bearing", "Hunterbot", "coffee")
s4 = Startup.new("no_gears_all_ideas", "Hunter", "cycling")


vc1 = VentureCapitalist.new("Deborah Meaden", 20000000000)
vc2 = VentureCapitalist.new("Theo Pathetis", 400000000)
vc3 = VentureCapitalist.new("Richard Branson", 4000000000)
vc4 = VentureCapitalist.new("Duncan Bannatyne", 800000000)

fr1 = FundingRound.new(s1, vc2, "Angel", 2000)
fr2 = FundingRound.new(s2, vc1, "Series A", 4000)
fr3 = FundingRound.new(s2, vc1, "Series C", 100000)
fr4 = FundingRound.new(s4, vc3, "Seed", 2000)
fr5 = FundingRound.new(s3, vc1, "Series C", 100000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
