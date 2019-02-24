require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Startups
freedit = Startup.new('Freedit', 'Alex', 'Tech')
treb = Startup.new('Trebuie', 'Dan', 'Food')
jare = Startup.new('Jaredith', 'Jan', 'Beverage')
hool = Startup.new('Hooligan', 'Ana', 'Clothing')

# Capitalists
gates = VentureCapitalist.new('Bill', 32_000_000_000.00)
apple = VentureCapitalist.new('Apple', 987_000_000_000.00)
pope = VentureCapitalist.new('Vatican', 87_000_999_000_000.00)
bbking = VentureCapitalist.new('BB-King', 50_000_000.00)
brap = VentureCapitalist.new('Dero', 200_000_000.00)
drap = VentureCapitalist.new('Sony', 97_000_060_000.00)
grap = VentureCapitalist.new('Pioneer', 7_003_999_000_000.00)
steve = VentureCapitalist.new('Vai', 340_000_000.00)

# Funding rounds
fund001 = freedit.sign_contract(pope, 'Angel', 2_009_000.50)
fund002 = freedit.sign_contract(pope, 'Seed', 4_000_009.45)
fund003 = freedit.sign_contract(bbking, 'Seed', 4_000_009.45)
fund004 = freedit.sign_contract(bbking, 'Angel', 4_000_009.45)
fund005 = freedit.sign_contract(gates, 'Angel', 23_009_000.50)
fund006 = freedit.sign_contract(gates, 'Angel', 2_009_000.50)
fund007 = hool.sign_contract(pope, 'Angel', 2_003_009_000.50)
fund008 = hool.sign_contract(apple, 'Seed', 32_009_000.50)
fund009 = jare.sign_contract(apple, 'Angel', 78_333_678.99)
fund010 = jare.sign_contract(apple, 'Angel', 2_112_009_000.50)

# Offer contract
apple.offer_contract(treb, 'Seed', 4_000_000.42)
apple.offer_contract(freedit, 'Angel', 5_000_000.42)
apple.offer_contract(freedit, 'Angel', 3_050_000.42)
apple.offer_contract(hool, 'Angel', 300_000.42)

binding.pry
0 # leave this here to ensure binding.pry isn't the last line
