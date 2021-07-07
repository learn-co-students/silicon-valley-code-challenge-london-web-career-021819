require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("stu", "founder1", "domain1")
startup2 = Startup.new("sofia", "founder2", "domain2")
startup3 = Startup.new("dan", "founder3", "domain3")

venture_capitalist1 = VentureCapitalist.new("alex", 1000000001)
venture_capitalist2 = VentureCapitalist.new("kian", 1500)
venture_capitalist3 = VentureCapitalist.new("sal", 2000)

fundinground1 = FundingRound.new(startup1, venture_capitalist1, "Angel", 10000)
fundinground2 = FundingRound.new(startup2, venture_capitalist2, "Seed", 15000)
fundinground3 = FundingRound.new(startup3, venture_capitalist3, "Series A", 20000)


binding.pry
0
