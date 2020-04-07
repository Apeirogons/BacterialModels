
# Converts parameter range to lognormal mean and sd.
lognormal_converter <- function(lower, upper){
  ln_lower = log(lower) 
  ln_upper = log(upper)
  ln_mean = (log(lower)+log(upper))/2
  ln_sd = (ln_upper-ln_mean)/2
  return(c(mu=ln_mean, sigma=ln_sd))
}
multiplier=1
parameter_generator <- function(){
params_V_U = lognormal_converter(0.5, 10)
V_U = rlnorm(1, params_V_U[1], params_V_U[2])*multiplier

params_H = lognormal_converter(15e-9, 35e-9)
H = rlnorm(1, params_H[1], params_H[2]) 

V_L = V_U/2 

params_e = lognormal_converter(5.98e-13, 5.4e-12) 
e = rlnorm(1, params_e[1], params_e[2])

params_D_b = lognormal_converter(1e-4, 1e-2)
D_b = rlnorm(1, params_D_b[1], params_D_b[2])*multiplier

eta = 0 

params_phi = lognormal_converter(1e-5, 1e-1)
phi = rlnorm(1, params_phi[1], params_phi[2])

params_r = lognormal_converter(1e-4, 1e-3)
r = rlnorm(1, params_r[1], params_r[2])*multiplier

params_K_a = lognormal_converter(4.46e-9, 6.18e-7)
K_a = rlnorm(1, params_K_a[1], params_K_a[2])*multiplier

D_p = 1e-7*multiplier

params_beta = lognormal_converter(20, 1000) 
beta = rlnorm(1, params_beta[1], params_beta[2])

params_d = lognormal_converter(1e-4, 0.35)
d = 0.0*multiplier

params_i = lognormal_converter(4.8e-10, 4.8e-9)
i = rlnorm(1, params_i[1], params_i[2])*multiplier 

R_0 = i 

# Print parameters. 
for (x in c(paste('V_U = ', V_U, sep=''), paste('V_L = ', V_L, sep=''),paste('H = ', H, sep=''),paste('e = ', e, sep=''), paste('D_b = ', D_b, sep=''),paste('eta = ', eta, sep=''),paste('phi = ', phi, sep=''),paste('r = ', r, sep=''),paste('K_a = ', K_a, sep=''),paste('D_p = ', D_p, sep=''),paste('beta = ', beta, sep=''),paste('d = ', d, sep=''),paste('i = ', i, sep=''))){
cat(paste(x,'\n'))
}
return(c(V_U=V_U, V_L=V_L, H=H, e=e, D_b = D_b, eta = eta, phi=phi, r=r, K_a=K_a, D_p = D_p, beta, d, i))
}
parameter_generator()
