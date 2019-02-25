class Startup

  attr_accessor :name
  attr_reader :founder, :domain
  @@all = []
  def initialize(name:, founder:, domain:)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain:, name:)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    all.find {|startup| startup.founder == founder}
  end

  def self.domains
    all.map { |startup| startup.domain}
  end

  def sign_contract(venture_capitalist:, type:, investment:)
    FundingRound.new(startup: self, venture_capitalist: venture_capitalist, type: type, investment: investment)
  end

  def funding_rounds #selects all the funding rounds for this startuo
    FundingRound.all.select { |funding_round| funding_round.startup == self}
  end

  def num_funding_rounds
    funding_rounds.length
  end

  def total_funds
    totalfunds = 0
    funding_rounds.each {|funding_round| totalfunds += funding_round.investment}
    totalfunds
  end

  def investors
     funding_rounds.map { |funding_round| funding_round.venture_capitalist}.uniq
   end

   def big_investors
     investors.select { |investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end

end
