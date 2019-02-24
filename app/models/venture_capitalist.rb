# VentureCapitalist class
class VentureCapitalist
  @@all_capitalists = []

  attr_accessor :total_worth, :club
  attr_reader :name

  def self.all
    @@all_capitalists
  end

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    self.class.all << self
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select { |fund| fund.venture_capitalist == self }
  end

  def portfolio
    funding_rounds.map(&:startup).uniq
  end

  def biggest_investment
    funding_rounds.select { |fund| fund.investment == max_investment }
  end

  def invested(domain)
    invested_by_domain(domain).map(&:investment).sum
  end

  def self.tres_commas_club
    all.select { |cap| cap.total_worth > 1_000_000_000 }
  end

  private

  def max_investment
    funding_rounds.map(&:investment).max
  end

  def invested_by_domain(domain)
    funding_rounds.select { |fund| fund.startup.domain == domain }
  end
end
