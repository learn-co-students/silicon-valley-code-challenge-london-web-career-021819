class VentureCapitalist
  attr_reader :name, :total_worth
  @@all = []

  def initialize(name:, total_worth:)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    all.select { |venture_capitalist| venture_capitalist.total_worth > 1000000000}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup: startup, venture_capitalist: self, type: type, investment: investment)
  end

  def funding_rounds #selects all the funding rounds for this startuo
    FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map { |funding_round| funding_round.startup}
  end

  def biggest_investment
    funding_rounds.max_by { |funding_round| funding_round.investment}
  end

  def invested(domain)
    funding_rounds.find {|funding_round| funding_round.startup.domain == domain}.investment
  end

end
