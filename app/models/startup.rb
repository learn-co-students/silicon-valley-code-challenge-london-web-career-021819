class Startup
attr_reader :name, :founder, :domain
attr_accessor :startup, :type_of_investment
@@all = []
@@funding_rounds = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot=(domain, name)
    @domain = domain
    @name = name
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(founder)
    self.all.find {|startup| startup.founder == founder}
  end

  def self.domains
    self.all.map {|project| project.domain}.uniq
  end

  def sign_contract(venture_capitalist, type_of_investment, ammount)
    FundingRound.new(self, venture_capitalist, type_of_investment, ammount)
  end

  def funding_rounds
    FundingRound.all.select {|rounds| rounds.startup == self}
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    funding_rounds.map {|rounds| rounds.investment}.inject :+
  end

  def investors
    funding_rounds.map {|rounds| rounds.venture_capitalist}.uniq
  end

  def big_investors
    investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end

end
