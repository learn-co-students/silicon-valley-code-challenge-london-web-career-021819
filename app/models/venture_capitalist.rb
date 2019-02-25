# VentureCapitalist#offer_contract
# given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
#VentureCapitalist#funding_rounds
# returns an array of all funding rounds for that venture capitalist
# VentureCapitalist#portfolio
# Returns a unique list of all startups this venture capitalist has funded
# VentureCapitalist#biggest_investment
# returns the largest funding round given by this venture capitalist


class VentureCapitalist
attr_reader :name
attr_accessor :total_worth
@@all = []

def self.all
  @@all
end

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.tres_commas_club
    self.all.select {|venturecaps| venturecaps.total_worth > 1000000000}
  end

  def offer_contract(startup, type, investment)
    contract = FundingRound.new(startup, self, type, investment)
  end

    def funding_rounds
      FundingRound.all.select {|fr| fr.venture_capitalist.name == self.name}
    end

  def num_funding_rounds
    funding_rounds.length
    end

    def portfolio
      funding_rounds.collect {|fr| fr.startup.name}.uniq
    end

    def biggest_investment
        investment_array = funding_rounds.collect {|fr| fr.investment}.sort
        investment_array.last
    end

    def invested(domain)
      domain_array = funding_rounds.select {|fr| fr.startup.domain == domain}
      domain_array.collect {|fr| fr.investment}.reduce( :+ )
    end
  end






# VentureCapitalist#invested
# given a domain string, returns the total amount invested in that domain
