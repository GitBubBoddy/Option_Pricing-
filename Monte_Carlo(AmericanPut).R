# Using Monte Carlo Simulation to find option prices


S0 = 48.89 #Current Stock Price
K = 50    #Strike Price of the Put option
r = 0.0125#Interest rate
T = 0.25  #Mature date is 3 months
sigma = 0.23 #Volitility/risk rate
n=100 #number of steps  

dt=T/n #stepsize
u=exp(sigma*sqrt(dt)) #Stock price upward movement
d=1/u                 #Downward moment
p=(exp(r*dt)-d)/(u-d) #Probability of that stock price going up

k=seq(0,n) #all numbers from 0 to n

samplesize=100000 #number of simulations 
# for each simulation, we assign a random number between 0 and n according 
# to binomial distribution.
ups<-rbinom(samplesize,n,p)   

ST<- S0 * u^ups * d^(n-ups) #for each samplesize&random number, we compute the stock price at maturity

payoff=pmax(K-ST,0) #payoff of eutro PUT option at maturity

option.price=mean(payoff)*exp(-r*T)

cat("The option price is = ", option.price ) #print the option price


#The American PUT option price is = $2.745457