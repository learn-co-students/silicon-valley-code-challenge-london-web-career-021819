
class VentureCapitalist

  attr_accessor :name, :total_worth

  @@capitalists = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@capitalists << self
  end

  def self.all
    @@capitalists
  end

  def self.tres_commas_club
    VentureCapitalist.all.select do |capitalist|
      capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup, venture_capitalist, type, investment)
    FundingRound.new(startup, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capilist == self
    end
  end

  def portfolio
    funding_rounds.map do |port|
      portfolio.startups
  end
end

  # def biggest_investment
  #



end
