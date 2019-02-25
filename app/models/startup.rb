# Build the following methods on the Startup class:

# Startup#name
#   returns a string that is the startup's name
# Startup#founder
#   returns a string that is the founder's name
# Startup#domain
#   returns a string that is the startup's domain
# Startup#pivot
#   given a string of a domain and a string of a name, change the domain and name of the startup
# Startup.all
#   should return all of the startup instances
# Startup.find_by_founder
#   given a string of a founder's name, returns the first startup   whose founder's name matches
# Startup.domains
#   should return an array of all of the different startup domains

# Startup#sign_contract
#   given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
# Startup#num_funding_rounds
#   Returns the total number of funding rounds that the startup has gotten
# Startup#total_funds
#   Returns the total sum of investments that the startup has gotten
# Startup#investors
#   Returns a unique array of all the venture capitalists that have invested in this company
# Startup#big_investors
#   Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

class Startup

  attr_reader :founder
  attr_accessor :name, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founders_name)
    self.all.find { |startup| startup.founder == founders_name }
  end

  def self.domains
    self.all.collect { |startup| startup.domain }.uniq
  end

  def name
    @name
  end

  def founder
    @founder
  end

  def domain
    @domain
  end

  def pivot(new_domain, new_name)
    @domain = new_domain
    @name = new_name
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def my_funding_rounds
    FundingRound.all.select { |fr| fr.startup.name == self.name }
  end

  def num_funding_rounds
    my_funding_rounds.count
  end

  def total_funds
    # use .reduce instead of initializing and incrementing a total variable
    my_funding_rounds.collect { |fr| fr.investment }.reduce(:+)
  end

  def investors
    my_funding_rounds.collect { |round| round.venture_capitalist }.uniq
  end

  # try refactoring to use the tres_commas_club method in venture_capitalist class:
  def big_investors
    investors.select { |inv| inv.total_worth > 1000000000 }
  end

end
