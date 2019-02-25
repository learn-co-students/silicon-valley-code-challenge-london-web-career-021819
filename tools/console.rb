require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

top_jobs = Startup.new('Top Jobs', 'Max', 'www.top-jobs.com')
apple = Startup.new('Apple', 'Steve', 'www.apple.com')
microsoft = Startup.new('Microsoft', 'Bill', 'www.microsoft.com')


james = VentureCapitalist.new('James', 900000)
russ = VentureCapitalist.new('Russ', 2000000000)

apple_russ = FundingRound.new(apple, russ, 'seed', 100000)
apple_james = FundingRound.new(apple, james, 'angel', 20000)
apple_james2 = FundingRound.new(apple, james, 'vulture', 50000)
apple_russ2 = FundingRound.new(apple, russ, 'angel', 500000)
microsoft_russ1 = FundingRound.new(microsoft, russ, 'test1', 2000000)
microsoft_russ1 = FundingRound.new(microsoft, russ, 'test2', 5000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
