class Startup

  attr_reader :name, :domain
  attr_accessor :founder_name

  @@all = []

  def initialize(name, founder_name, domain)
    @name = name
    @founder_name = founder_name
    @domain = domain
    @@all << self
  end

  def pivot=(domain, name) #setter method
    @domain = domain
    @name = name
  end

  def pivot(domain, name) #getter method
    @domain = domain
    @name = name
  end

  def self.all
      @@all
  end

  def self.find_by_founder(founder_name)
    Startup.all.find {|startup| startup.founder_name == founder_name}
  end
  #returns the instance of startup which matches the founder name which is passed in

  def self.domains
    Startup.all.map {|startup| startup.domain}
  end

  def sign_contract(venture_capitalist, type, investment )
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select {|rounds| rounds.startup == self}.count
  end

  def total_funds
    results = FundingRound.all.map {|rounds| rounds.investment}
    results.inject {|sum, n| sum+n}
  end

  def investors
    results = FundingRound.all.map {|rounds| rounds.venture_capitalist}
    results.uniq
  end

  def big_investors
    investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end


end
