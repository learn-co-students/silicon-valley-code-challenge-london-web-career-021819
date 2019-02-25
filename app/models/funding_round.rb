class FundingRound
  attr_reader :startup, :vc, :type
  attr_accessor :investment

  @@funding_rounds = []

  def initialize(startup, vc, type, investment)
    @startup = startup
    @vc = vc
    @type = type
    @investment = investment.to_f
    @@funding_rounds << self
  end

  def self.all
    @@funding_rounds
  end
end
