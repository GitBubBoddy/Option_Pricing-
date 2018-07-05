# Using Monte Carlo Simulation to find option prices

S0 = 48.89 #Current Stock Price
K = 52.5 #Strike Price of the Euro call
r = 0.0125       #interest rate
T = 0.25         #maturity date
sigma = 0.23 #volatility
n=100 #number of steps  

dt=T/n #stepsize
u=exp(sigma*sqrt(dt)) #Up movement
d=1/u                 #Down movement
p=(exp(r*dt)-d)/(u-d) #THe probability of the stock price going up

k=seq(0,n) #all numbers from 0 to n

samplesize=100000  #number of simulations 
# for each simulation, we assign a random number between 0 and n according 
# to binomial distribution.
ups<-rbinom(samplesize,n,p)   

ST<- S0 * u^ups * d^(n-ups) #for each samplesize&random number, we compute the stock price at maturity

payoff=pmax(ST-K,0) #payoff of American call option at maturity

option.price=mean(payoff)*exp(-r*T)#Compute the mean of the payoff with different random numbers

cat("The option price is = ", option.price ) #print the option price


#The American CALL option price/value is =  $0.9868254