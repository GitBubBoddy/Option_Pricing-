# Finding American Call price using binomial tree model
# Method#1: computing expected payoff, and discounting afterwards.

S0 = 48.89 #Current Stock Price
K = 52.5 #Strike Price
r = 0.0125#Risk Free Interest Rate
T = 0.25  #Day of Maturity is 3months 
sigma = 0.23  #The Volitility/Risk rate in percentage 
n=100 #number of steps

dt=T/n #stepsize
u=exp(sigma*sqrt(dt)) #Stock Price with an up movement at each time step
d=1/u                 #Stock Price with an down movement at each time step
p=(exp(r*dt)-d)/(u-d) #The probability of the stock price sgoing up

k=seq(0,n) #all numbers from 0 to n

ST=S0*u^(k)*d^(n-k) #list of all possible stock values at time T,from bottom to top

expected.payoff=sum(pmax(ST-K,0)*dbinom(k,n,p)) #expected payoff of call

callprice=expected.payoff*exp(-r*T) #discounted expected payoff=call price

cat("Price of the option is =", callprice) #print callprice

#Price/value of the CALL option is = $0.990406
