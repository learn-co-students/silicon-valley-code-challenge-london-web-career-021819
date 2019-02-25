require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("Al's Business", "Al", "AlsBusiness.com")
startup2 = Startup.new("Pal's Business", "Pal", "PalsBusiness.com")
startup3 = Startup.new("Cal's Business", "Cal", "CalsBusiness.com")

vc1 = VentureCapitalist.new('Rich Jo', 1000000)
vc2 = VentureCapitalist.new('Rich Po', 100000)
vc3 = VentureCapitalist.new('Rich Lo', 1234567)

round1 = FundingRound.new(startup1, vc1, 'Seed', 100)
round2 = FundingRound.new(startup2, vc2, 'Angel', 100)
round3 = FundingRound.new(startup3, vc3, 'Series A', 100)

startup1.sign_contract(vc2, 'Series B', 400)
vc3.offer_contract(startup2, 'Pre-Seed', 1000)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line