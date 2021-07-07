class VentureCapitalist

  attr_accessor :name, :total_worth

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
    tcc = VentureCapitalist.all.select {|x| x.total_worth > 1000000000}
    tcc.map {|x| x.name}
  end

  def offer_contract(startup, venture_capitalist, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|x| x.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map {|x| x.startup}
  end

  def biggest_investment
    funding_rounds.max {|x| x.investment}
  end

  def invested(domain_name)
    total = 0
    funding_rounds.each do |funding_round|
      total += funding_round.investment
        if funding_round.startup.domain == domain_name
        end
      total
    end
  end

end
