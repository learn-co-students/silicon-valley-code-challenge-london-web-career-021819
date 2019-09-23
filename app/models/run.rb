require 'pry'
require_relative './funding_round.rb'
require_relative './startup.rb'
require_relative './venture_capitalist.rb'

investor1 = VentureCapitalist.new("George", 5750200)
investor2 = VentureCapitalist.new("Anna", 1200550800)
investor3 = VentureCapitalist.new("Steve", 2120300500)

startup1 = Startup.new("New_Project1", "Adam", "domain1")
startup2 = Startup.new("New_Project2", "Eve", "domain2")
startup3 = Startup.new("New_Project3", "Julie", "domain3")

funding_round1 = startup1.sign_contract(investor1, "Angel", 100000.00)
funding_round2 = startup1.sign_contract(investor2, "Pre-Seed", 2500000.00)
funding_round3 = startup1.sign_contract(investor3, "Series A", 2750000.00)

funding_round4 = startup2.sign_contract(investor2, "Angel", 1500000.00)
funding_round5 = startup2.sign_contract(investor3, "Pre-Seed", 3000000.00)

funding_round6 = startup3.sign_contract(investor3, "Angel", 500000.00)

funding_round7 = investor1.offer_contract(startup1, "Pre-Seed", 150000.00)
funding_round8 = investor1.offer_contract(startup2, "Series A", 10000.00)

funding_round9 = investor2.offer_contract(startup2, "Pre-Seed", 75000.00)
funding_round10 = investor2.offer_contract(startup3, "Pre-Seed", 375000.00)

funding_round11 = investor3.offer_contract(startup1, "Angel", 585000.00)
funding_round12 = investor3.offer_contract(startup2, "Pre-Seed", 150000.00)
funding_round13 = investor3.offer_contract(startup3, "Series A", 1750000.00)




























pry
" "
