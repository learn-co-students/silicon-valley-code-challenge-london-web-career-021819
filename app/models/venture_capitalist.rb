class VentureCapitalist
attr_reader :name, :total_worth
attr_accessor :startup, :type_of_investment
@@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|investors| investors.total_worth >= 1000000000}
  end

  def offer_contract(startup, type_of_investment, ammount_invested)
    FundingRound.new(startup, self, type_of_investment, ammount_invested)
  end

  def funding_rounds
    FundingRound.all.select {|rounds| rounds.venture_capitalist == self}
  end

  def portofolio
    funding_rounds.map {|rounds| rounds.startup}.uniq
  end

  def biggest_investment
    funding_rounds.map {|rounds| rounds.investment}.max
  end

  def invested(domain)
    domain_invested = funding_rounds.select {|rounds| rounds.startup.domain == domain}
    domain_invested.map {|round| round.investment}.inject :+
  end

end
