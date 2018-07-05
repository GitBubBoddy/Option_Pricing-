# Finding American Put price using binomial tree model
# Method#1: computing expected payoff, and discounting afterwards.

S0 = 48.89 #Current Stock Price
K = 50    #Strike Price of the Put option
r = 0.0125#Interest rate
T = 0.25  #Mature date is 3 months
sigma = 0.23 #Volitility/risk rate
n=100 #number of steps

dt=T/n #stepsize
u=exp(sigma*sqrt(dt)) #Up movement amount 
d=1/u                 #Down movement amount
p=(exp(r*dt)-d)/(u-d) #Probability of the stock price going upward

k=seq(0,n) #all numbers from 0 to n

ST=S0*u^(k)*d^(n-k) #list of all possible stock values at time T,from bottom to top

expected.payoff=sum(pmax(K-ST,0)*dbinom(k,n,p)) #expected payoff of the put option

putprice=expected.payoff*exp(-r*T) #discounted expected payoff=put price

cat("Price of the option is =", putprice) #print putprice


#Price/value of the American PUT option is = $2.767858