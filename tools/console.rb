require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Lo", "Michael", "domain")
startup2 = Startup.new("LoCo", "Sophie", "domamain")

venture_capitalist1 = VentureCapitalist.new("Elouise", 122000)
venture_capitalist2 = VentureCapitalist.new("Eric", 1800)

funding_round1 = FundingRound.new(startup1, venture_capitalist2, "offshore", 200000)
funding_round2 = FundingRound.new(startup2, venture_capitalist1, "investment", 1000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
