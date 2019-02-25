class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name, total_worth = 0.0)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_comma_club
        all.select{|vc| vc.total_worth > 999999.99}
    end

    def offer_contract(startup, investment_type, amount)
        FundingRound.new(startup, self, investment_type, amount)
    end


    def funding_rounds
        FundingRound.all.select{|round| round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|round| round.startup}
    end

    def biggest_investment
        invested = 0
        big_round = 0
        funding_rounds.each do |round|
            if round.investment > invested
                invested = round.investment
                big_round = round
            end
        end
        big_round
    end

    def invested(domain)
        domain_rounds = funding_rounds.select{|round| round.startup.domain == domain}
        domain_rounds.map{|round| round.investment}.inject(0, :+)
    end

end

# Build out the following methods on the VentureCapitalist class
# VentureCapitalist#name
# returns a string that is the venture capitalist's name
# VentureCapitalist#total_worth
# returns a number that is the total worth of this investor (e.g., think of it as how much money they have)
# VentureCapitalist.all
# returns an array of all venture capitalists
# VentureCapitalist.tres_commas_club
# returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)

# Associations and Aggregate Methods

# VentureCapitalist
# VentureCapitalist#offer_contract
# given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
# VentureCapitalist#funding_rounds
# returns an array of all funding rounds for that venture capitalist
# VentureCapitalist#portfolio
# Returns a unique list of all startups this venture capitalist has funded
# VentureCapitalist#biggest_investment
# returns the largest funding round given by this venture capitalist
# VentureCapitalist#invested
# given a domain string, returns the total amount invested in that domain