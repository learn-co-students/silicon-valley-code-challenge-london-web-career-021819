class VentureCapitalist

  @@all = []
  attr_accessor :name, :total_worth

  def self.all
    @@all
  end

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    self.class.all << self
  end

  def self.tres_commas_club
    self.all.select {|venture_capitalist| venture_capitalist.total_worth >= 10**9}
  end


  def offer_contract(startup,type,investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    funding_rounds = []
    FundingRound.all.each do |funding_round|
      funding_rounds << funding_round if funding_round.venture_capitalist == self
    end
    funding_rounds
  end

  def portfolio
    portfolio = []
    funding_rounds.each do
      |funding_round| portfolio << funding_round.startup
    end
    portfolio.uniq
  end

  def biggest_investment
    max_investment = 0
    funding_rounds.each do |funding_round|
      while max_investment < funding_round.investment
        max_investment = funding_round.investment
      end
    end
    funding_rounds.find {|funding_round| funding_round.investment == max_investment}
  end

  def invested(domain)
    total = 0
    funding_rounds.each do |funding_round|
      total += funding_round.investment if funding_round.startup.domain == domain
    end
    total 
  end

end
