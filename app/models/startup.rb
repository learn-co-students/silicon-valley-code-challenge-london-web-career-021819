class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@startups = []

  def initialize(name, founder, domain)
    @name =name
    @founder = founder
    @domain = domain
    @@startups << self
  end

  def self.all
    @@startups
  end

  def self.find_by_founder(founder)
    self.all.find {|startup| startup.founder == founder}
  end

  def self.domains
    self.all.collect{|startup| startup.domain}
  end

  def sign_contract(vc, type, investment)
    FundingRound.new(self, vc, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.startup == self}
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    funding_rounds.inject(0) {|sum, fr| sum + fr.investment}
  end

  def investors
    funding_rounds.collect {|fr| fr.vc}.uniq
  end

  def big_investors
    funding_rounds.collect {|fr| fr.vc if VentureCapitalist.tres_commas_club.include?(fr.vc)}.compact.uniq
  end
end
