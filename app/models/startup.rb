class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    Startup.all.find {|x| x.founder == founder_name}
  end

  def domain
    Startup.all.map {|x| x.domain}
  end

  def sign_contract(startup, venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select {|x| x.startup == self}.count
  end

  def startup
    FundingRound.all.select {|x| x.startup == self}
  end

  def total_funds
    startup.map {|x| x.investment}.inject(:+)
  end

  def investors
    startup.map {|x| x.venture_capitalist}.uniq
  end

  def big_investors
    investors.select {|x| VentureCapitalist.tres_commas_club.include?(x)}
  end

end
