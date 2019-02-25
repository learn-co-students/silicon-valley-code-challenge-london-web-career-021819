class VentureCapitalist
  attr_reader :name
  attr_accessor :total_worth

  @@venture_capitalists = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth.to_f
    @@venture_capitalists << self
  end

  def self.all
    @@venture_capitalists
  end

  def self.tres_commas_club
    self.all.select {|vc| vc.total_worth > 1000000000}
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.vc == self}
  end

  def portfolio
    funding_rounds.collect {|fr| fr.startup}.uniq
  end

  def biggest_investment
    funding_rounds.max { |a, b| a.investment <=> b.investment }
  end

  def invested(domain)
    rounds = funding_rounds.select {|fr| fr.startup.domain == domain}
    investments = rounds.collect {|fr| fr.investment}
    investments.sum
  end
end
