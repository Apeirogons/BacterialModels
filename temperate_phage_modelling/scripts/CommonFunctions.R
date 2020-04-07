library(deSolve)

m <- function(R, H){ # Common Monod function
  return (R/(R+H))
}

q <- function(R, eta){ # Death function
  return (1/(R*eta + 1))
}


hill = function(N, K){ # Hill function used in MOI model.
  return (N/(N + K))
}

phi_moi <- function(K_a, P, K){ # K is parameter for the Hill function
  total = 0
  lambda = K_a*P
  for(N in 1:20){
    p = dpois(N, lambda = lambda)
    pi = hill(N, K)
    total = total + p * pi
  }
  return (total/(1-dpois(0, lambda=lambda)))}

f <- function(t, y, params){ # Main system for basic model
  U = y['U']
  R = y['R']
  P = y['P']
  L = y['L']
  A = y['A']
   
  moi=params['MOI']
  if(moi){
  phi = phi_moi(K_a, P, K)}
  
  N_U = V_U*U*m(R, H)
  N_L = V_L*L*m(R, H)
  I_Lyso = phi*K_a*P*U
  I_Lyt = (1-phi)*K_a*P*U
  
  dUdt = N_U - D_b*U*q(R, beta) - K_a*P*U - d*U
  dLdt = N_L + I_Lyso - D_b*L*q(R,beta) - r*L*m(R,H) - d*L
  dPdt = beta*r*L + beta*I_Lyt - K_a*P*(U+L) - D_p*P - d*P
  dRdt = -e*(N_U+N_L) + i - d*R
  
  return(list(c(dUdt, dRdt, dPdt, dLdt)))
}