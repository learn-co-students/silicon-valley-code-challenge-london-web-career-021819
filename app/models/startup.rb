# Startup class
class Startup
  @@all_startups = []

  def self.all
    @@all_startups
  end

  attr_accessor :name
  attr_reader :founder, :domain

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all_startups << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def sign_contract(venture_capitalist, type, amount)
    FundingRound.new(self, venture_capitalist, type, amount)
  end

  def personal_funds
    FundingRound.all.select { |fund| fund.startup == self }
  end

  def num_funding_rounds
    personal_funds.count
  end

  def total_funds
    personal_funds.map(&:investment).sum
  end

  def investors
    personal_funds.map(&:venture_capitalist).uniq
  end

  def big_investors
    investors.select { |x| x.class.tres_commas_club.include?(x) }
  end

  def self.find_by_founder(founders_name)
    all.find { |startup| startup.founder == founders_name }
  end

  def self.domains
    all.map(&:domain)
  end
end
