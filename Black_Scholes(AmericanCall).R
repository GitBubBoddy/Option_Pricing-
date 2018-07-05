# Black-Scholes-Formula

bscallprice<-function(S0,K,T,r,sigma){
  d2<-(log(S0/K)+(r-sigma^2 /2)*T)/(sigma*sqrt(T))
  d1<-d2+sigma*sqrt(T)
  S0*pnorm(d1)-K*exp(-r*T)*pnorm(d2)
}


#initialize parameters
S0 = 48.89 #Current Stock Price
K = 52.5 #Strike Price
r = 0.0125#Risk Free Interest Rate
T = 0.25  #Day of Maturity is 3months 
sigma = 0.23 #The Volitility/Risk rate in percentage

cat("The price of the option is", bscallprice(S0,K,T,r,sigma))



#The price/value of the American Call option is $0.9926418