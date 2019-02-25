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

  def tres_commas_club
    @@all.select {|vent| vent.total_worth > 1000000000}
  end

  def offer_contract(startup, type, invested)
    FundingRound.new(startup, self, type, invested)
  end

  def funding_rounds
    FundingRound.all.select{|round| round.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map{|round| round.startup}.uniq
  end

  def biggest_investment
    maximum = 0
    max_round = nil
    funding_rounds.each do |round|
      if round.investment > maximum
        maximum = round.investment
        max_round = round
      end
    end
    max_round
  end

  def invested(domain)
    domains = FundingRound.all.select{|round| round.startup.domain == domain}
    total = 0
    domains.each do |round|
      total += round.investment
    end
    total
  end

end
