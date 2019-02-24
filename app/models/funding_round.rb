# FundingRound class
class FundingRound
  attr_accessor :type, :investment
  attr_reader :startup, :venture_capitalist

  @@all_fundings = []

  def self.all
    @@all_fundings
  end

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.abs
    self.class.all << self
  end
end
