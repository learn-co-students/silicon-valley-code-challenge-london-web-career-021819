class VentureCapitalist

  attr_reader :name, :total_worth

  @@all = []

  def initialize(name, total_worth=0)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.select {|vc| vc.total_worth > 1000000000}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|rounds| rounds.venture_capitalist == self}
  end

  def portfolio
    results = FundingRound.all.map {|rounds| rounds.startup}
    results.uniq
  end

  def biggest_investment
    results = FundingRound.all.map {|rounds| rounds.investment}.sort.reverse
    results[0]
  end

  def invested(domain)
    results = funding_rounds.map {|rounds| rounds.investment}
    results.inject :+
  end


end
