require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
peeps = Startup.new(name: "Peeps", founder: "Baz", domain: "peeps-app.com")
zip = Startup.new(name: "Zip App", founder: "Mars", domain: "zip-app.com")
wonder = Startup.new(name: "Wonder", founder: "Sam", domain: "wonder-app.com")

vc_1 = VentureCapitalist.new(name: "Ron", total_worth: 2000000)
vc_2 = VentureCapitalist.new(name: "Jon", total_worth: 40000000000)
vc_3 = VentureCapitalist.new(name: "Mai", total_worth: 1500000000)

fr_peeps1 = FundingRound.new(startup: peeps, venture_capitalist: vc_1, type: "Angel", investment: 10000)
fr_peeps2 = FundingRound.new(startup: peeps, venture_capitalist: vc_2, type: "Pre-Seed", investment: 100000)
fr_peeps3 = FundingRound.new(startup: peeps, venture_capitalist: vc_3, type: "Seed", investment: 1000000)

fr_zip1 = FundingRound.new(startup: zip, venture_capitalist: vc_1, type: "Angel", investment: 10000)
fr_zip2 = FundingRound.new(startup: zip, venture_capitalist: vc_2, type: "Pre-Seed", investment: 100000)
fr_zip3 = FundingRound.new(startup: zip, venture_capitalist: vc_3, type: "Seed", investment: 1000000)

fr_wonder1 = FundingRound.new(startup: wonder, venture_capitalist: vc_1, type: "Angel", investment: 10000)
fr_wonder2 = FundingRound.new(startup: wonder, venture_capitalist: vc_2, type: "Pre-Seed", investment: 100000)
fr_wonder3 = FundingRound.new(startup: wonder, venture_capitalist: vc_3, type: "Seed", investment: 1000000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
