#install.packages('deSolve')
require('deSolve')
library("deSolve")

# most initial parameters are up here, except infusion rate (since it's interesting to change)

Vmax = 0.1
e = 1e-1
Kd = 2
C = 0.0001 
K_transfer = 0.10
K_untransfer = 0.0001

# functions for ODE solving here

monod <- function(S, Ks){ # since it gets called a lot 
  return (S/(Ks+S))
}

clamp <- function(x, lower, upper){ # It's possible for a small approximation error to create a negative value, which causes issues
  if (x < lower){return(lower)}
  else if (x>upper){return(upper)}
  else{return(x)}
  
}

f <- function(t, y, params){ # Main ODE system
  N = y[1]
  R = y[2]
  S = y[3]
  i = params[1]
  
  RN = R#/(N+S)
  
  dNdt <- Vmax * monod(RN,Kd)*N - K_transfer*(1-monod(RN,Kd))*N + K_untransfer*S*monod(RN,Kd)
  dRdt <- -e*Vmax*monod(RN,Kd)*N +i+ C*(N+R)
  dSdt <- K_transfer*(1-monod(RN,Kd))*N - 0.01*S - K_untransfer*S*monod(RN,Kd)
  
  dNdt <- clamp(dNdt, lower=-N, upper=99999)
  dRdt <- clamp(dRdt, lower=-R, upper=99999)
  dSdt <- clamp(dSdt, lower=-S, upper=99999)
  
  temp <- c(dNdt, dRdt, dSdt)
  L = list(temp)
  
  return(list(temp))
}

# Playing with the model here. 
out = data.frame()

# Let the population grow to its normal equilibrium size
times <- seq(0,to=1000,by=0.1)
initials <- c(N=1, R=10, S=0)
out_1 <- as.data.frame(ode(func=f,y=initials,parms = c(i=0.1),times=times))
out <- rbind(out, out_1)

# Give the population some new resources
L = length(out$time)
times <- seq(out$time[L],to=out$time[L]+1000,by=0.1)
initials <- c(N=out$N[L], R=out$R[L]+20, S = out$S[L])
out_1 <- as.data.frame(ode(func=f,y=initials,parms = c(i=0.1),times=times))
out <- rbind(out, out_1)

# Remove the constant infusion of resources
L = length(out$time)
times <- seq(out$time[L],to=out$time[L]+1000,by=0.1)
initials <- c(N=out$N[L], R=out$R[L], S = out$S[L])
out_1 <- as.data.frame(ode(func=f,y=initials,parms = c(i=0.0),times=times))
out <- rbind(out, out_1)

# Bring the population back
L = length(out$time)
times <- seq(out$time[L],to=out$time[L]+1000,by=0.1)
initials <- c(N=out$N[L], R=out$R[L], S = out$S[L])
out_1 <- as.data.frame(ode(func=f,y=initials,parms = c(i=0.1),times=times))
out <- rbind(out, out_1)

# Plot our populations over time (I can't make a nice legend right now; RED is total bacteria, BLUE is stationary phase, GREEN is growth phase)
plot(out$time,out$S+out$N, type='l', col='red', main='Bacteria', xlab = 'Time', ylab = 'Number')
lines(out$time,out$N, type='l', col='green')
lines(out$time, out$S, type='l', col='blue')

plot(out$time,out$R, type='l', col='red', main='Resource', xlab = 'Time', ylab = 'Amount')