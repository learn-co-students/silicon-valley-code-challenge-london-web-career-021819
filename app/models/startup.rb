class Startup
  @@all = []
  attr_accessor :name
  attr_reader :founder, :domain

  def self.all
    @@all
  end

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    self.class.all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end


  def self.find_by_founder(founder_name)
    self.all.find {|startup| startup.founder == founder_name}
  end

  def self.domains
    self.all.map {|startup| startup.domain}.uniq
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    num_funding_rounds = 0
    FundingRound.all.each do |funding_round|
      num_funding_rounds += 1 if funding_round.startup == self
    end
    return num_funding_rounds
  end

  def total_funds
    sum = 0
    FundingRound.all.each do |funding_round|
      sum += funding_round.investment if funding_round.startup == self
    end
    return sum
  end

  def investors
    investors = []
    FundingRound.all.each do |funding_round|
      investors << funding_round.venture_capitalist if funding_round.startup == self
    end
    investors.uniq
  end

  def big_investors
    investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}.uniq
  end


end
