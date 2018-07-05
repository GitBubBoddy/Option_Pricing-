#Using put call parity for calculating the put option

#Definitions:
#C is the price the the Euro option
#PV(K) is the present value of the strike price (K), discounted from the value on the expiration date(3months from Augest) at the risk-free rate 1.25%.
#S0 is the current market price or the spot price of the underlying asset

#The current strike price for the put option is 45.5
S0 = 48.89 #Current Stock Price
K = 50    #Strike Price
r = 0.0125#Interest rate
T = 0.25  #Mature date is 3 months

C1 =mean(0.990406,0.9926418,0.9868254) #Price/value of the call option computed from the mean of three call option prices
C  =0.99 #Atual call option price
#Put Call Parity Formula:  
#c + Ke^(-rT) = p + S0

PV = K*exp(-r*T)
P = C1 + PV - S0
P   #The value of the put option with the estimated call option price is $1.974978 
P = C + PV - S0
P  ##The value of the put option with the actual call option price is 1.973994