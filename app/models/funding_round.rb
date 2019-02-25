class FundingRound
  @@all = []
  attr_reader :startup, :venture_capitalist, :type, :investment

  def self.all
    @@all
  end

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type

    if investment < 0.0
      @investment = 0
    elsif investment >= 0.0
      @investment = (investment).to_f
    end

    self.class.all << self
  end


end
