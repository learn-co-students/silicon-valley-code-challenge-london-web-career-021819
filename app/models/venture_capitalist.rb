# Build out the following methods on the VentureCapitalist class:
# VentureCapitalist#name
#   returns a string that is the venture capitalist's name
# VentureCapitalist#total_worth
#   returns a number that is the total worth of this investor (e.g., think of it as how much money they have)
# VentureCapitalist.all
#   returns an array of all venture capitalists
# VentureCapitalist.tres_commas_club
#   returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)

# VentureCapitalist#offer_contract
  # given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
# VentureCapitalist#funding_rounds
#   returns an array of all funding rounds for that venture capitalist
# VentureCapitalist#portfolio
#   Returns a unique list of all startups this venture capitalist has funded
# VentureCapitalist#biggest_investment
#   returns the largest funding round given by this venture capitalist
# VentureCapitalist#invested
#   given a domain string, returns the total amount invested in that domain

class VentureCapitalist

  attr_reader :name
  attr_accessor :total_worth

  @@all = []

  def initialize(name, worth)
    @name = name
    @total_worth = worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select { |person| person.total_worth > 1000000000 }
  end

  def name
    @name
  end

  def total_worth
    @total_worth
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |round|  round.venture_capitalist == self }
  end

  def portfolio
    funding_rounds.collect { |round| round.startup }.uniq
  end

  def biggest_investment
    highest = funding_rounds.collect { |round| round.investment }.max
    funding_rounds.find { |round| round.investment == highest }
  end

  def invested(domain_name)
    domain_rounds = funding_rounds.select { |round| round.startup.domain == domain_name }
    domain_rounds.collect { |fr| fr.investment }.reduce(:+)
  end

end
