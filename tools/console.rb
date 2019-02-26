require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


# Startup
tesco = Startup.new("Tesco", "Laura Darwen", "www.tesco.com")
waitrose = Startup.new("Waitrose", "Aimee Chatfield", "www.waitrose.com")
monzo = Startup.new("Monzo", "Edward Royle", "www.monzo.com")

#Startup#pivot
# tesco.pivot("www.test.com", "test_name")

#Startup.find_by_founder
# Startup.find_by_founder("Laura Darwen") = returns instance

# Venture Capitalist
sandra = VentureCapitalist.new("Sandra", 9000.87)
nico = VentureCapitalist.new("Nicolas", 1127844.98)
harry = VentureCapitalist.new("Harry", 99145000000.56)
max = VentureCapitalist.new("Max", 999999999999.34)

# Funding_Round
round1 = FundingRound.new(monzo, max, "Angel", 876578.65)
round2 = FundingRound.new(tesco, nico, "Pre-Seed", 246368.52)
round3 = FundingRound.new(tesco, nico, "Seed", 678246368.52)
round4 = FundingRound.new(tesco, nico, "Series A", 999000888999.09)

# Startup#sign_contract
#tesco.sign_contract(sandra, "Angel", 4567777.56)

# Startup#num_funding_rounds
# tesco.num_funding_rounds - expect to equal 2

# VentureCapitalist#offer_contract

#VentureCapitalist#invested
nico.invested("www.tesco.com")

binding.pry
"pry pry pry"
