class Startup
    attr_reader :founder, :name, :domain
    attr_accessor
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founders_name)
        all.find{|startup| startup.founder == founders_name}
    end

    def self.domains
        all.map{|startup| startup.domain}
    end

    def sign_contract(vc, investment_type, amount)
        FundingRound.new(self, vc, investment_type, amount)        
    end

    def my_rounds
        FundingRound.all.select{|round| round.startup == self}
    end

    def num_funding_rounds
        my_rounds.length
    end

    def total_sum
        my_rounds.map{|round| round.investment}.inject(0, :+)
    end

    def investors
        my_rounds.map{|round| round.venture_capitalist}.uniq
    end

    def big_investors
        investors.select{|investor| investor.total_worth > 999999.99}
    end

end

# Build the following methods on the Startup class
# Startup#name
# returns a string that is the startup's name
# Startup#founder
# returns a string that is the founder's name
# Once a startup is created, the founder cannot be changed.
# Startup#domain
# returns a string that is the startup's domain
# Once a startup is created, the domain cannot be changed.
# Startup#pivot
# given a string of a domain and a string of a name, change the domain and name of the startup
# Startup.all
# should return all of the startup instances
# Startup.find_by_founder
# given a string of a founder's name, returns the first startup whose founder's name matches
# Startup.domains
# should return an array of all of the different startup domains

# Associations and Aggregate Methods

# Startup
# Startup#sign_contract
# given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
# Startup#num_funding_rounds
# Returns the total number of funding rounds that the startup has gotten
# Startup#total_funds
# Returns the total sum of investments that the startup has gotten
# Startup#investors
# Returns a unique array of all the venture capitalists that have invested in this company
# Startup#big_investors
# Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
