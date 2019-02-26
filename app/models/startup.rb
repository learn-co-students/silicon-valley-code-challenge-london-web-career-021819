
class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@startups = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@startups << self
  end

  def pivot(name, string)
    @name = name
    @string = string
  end

  def self.all
    @@startups
  end

  def self.find_by_founder(founders_name)
    self.all.find do |start|
      start.founder == founder_name
  end
end

  def self.domains
    self.all.map do |dom|
      dom.domain
  end
end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select do |f|
      f.startup == self.size
    end
  end

  def startup
    FundingRound.all.select do |start|
      start.startup == self
    end
  end


  def investors
    startup.map do |investors|
      investors.venture_capitalists.uniq
    end
  end

  def big_investors
    investors.select do |investor|
      VentureCapitalist.tres_commas_club.include?(investor)
    end
  end


end
