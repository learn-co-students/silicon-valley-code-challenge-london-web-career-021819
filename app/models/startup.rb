#Startup#sign_contract
# given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
## Startup#num_funding_rounds
# Returns the total number of funding rounds that the startup has gotten
# Startup#total_funds
# Returns the total sum of investments that the startup has gotten
# Startup#investors
# Returns a unique array of all the venture capitalists that have invested in this company
# Startup#big_investors
# Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club


class Startup
  attr_reader :founder
  attr_accessor :domain, :name
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end


  def pivot(new_domain, new_name)
    @name = new_name
    @domain = new_domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(name)
    self.all.find {|startup| startup.founder == name}
  end
  def self.domains

    self.all.collect {|startup| startup.domain}.uniq
  end


    def sign_contract(venture_capitalist, type, investment)
      contract = FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
      FundingRound.all.select {|fr| fr.startup.name == self.name}.length
      end

      def total_funds
        funding_rounds_array = FundingRound.all.select {|fr| fr.startup.name == self.name}
        sum = funding_rounds_array.collect {|round| round.investment}.reduce( :+ )
      end


    def investors
      funding_rounds_array = FundingRound.all.select {|fr| fr.startup.name == self.name}
      investors = funding_rounds_array.collect {|round| round.venture_capitalist}
    end

    def big_investors
      big_array = investors.select {|investor| investor.total_worth > 1000000000}
    end

    def big_investors_names
      big_investors.collect {|investor| investor.name}
    end

end
