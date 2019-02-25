class Startup
  attr_accessor :name, :domain
  attr_reader :founder

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

  def self.find_by_founder(founder)
    @@all.find {|startup| startup.founder == founder}
  end

  def self.domains
    @@all.map {|startup| startup.domain}
  end

  def sign_contract(venture_capitalist, type, invested)
    FundingRound.new(self,venture_capitalist, type, invested)
  end

  def all_rounds
    FundingRound.all.select{|round| round.startup == self}
  end

  def num_funding_rounds
    all_rounds.count
  end

  def total_funds
    total = 0
    all_rounds.each {|round| total += round.investment}
    total
  end

  def investors
    all_rounds.map{|round| round.venture_capitalist}.uniq
  end

  def big_investors
    investors.select do|investor|
      if investor.total_worth > 1000000000
        investor
      end
    end
  end

end
