source("CommonFunctions.R")
library("deSolve")
library("ggplot2")

# Parameters

V_U = 9.70811565391988
V_L = 4.85405782695994
H = 2.61282045823487e-08
e = 1.92130926216615e-12
D_b = 0.000882324657372326
eta = 0
phi = 2.75977117953779e-05
r = 0.000204917256949115
K_a = 4.3387866900946e-07
D_p = 1e-07
beta = 56.2842234065185
d = 0
i = 1.14742384250382e-09

out = data.frame()

# Take a snapshot of the infection at the beginning
times <- seq(0,to=100,by=1)

R_0 = i
initials <- c(U=1, R=R_0, P=1, L=0)
out_1 = as.data.frame(ode(func=f, y=initials, parms =c(MOI=0),times = times))
out <- rbind(out, out_1)

ggplot(out, aes(time))+geom_line(aes(y=U/1000, color='Uninfected')) + geom_line(aes(y=L/1000, color='Lysogens'))+labs(title='Uninfected, Lysogen, and Phage Concentration vs Time', x='Time (hr)', y='Bacterial Concentration (x 1000 bacteria/mL)') +theme_bw() + geom_line(aes(y=P/1e+5,color="Phage"))+scale_y_continuous(sec.axis = sec_axis(~., name = "Phage Concentration (x 100000 phage/mL)")) 
#ggplot(out, aes(time))+geom_line(aes(y=P/1e+5, color='Phage'),color='GREEN') + labs(title='Phage Concentration vs Time', x='Time (hr)', y='Concentration (x 1e+5 phage/mL)') +theme_bw()
ggplot(out, aes(time))+geom_line(aes(y=R*1e+9, color='Resource'), color='PURPLE') +labs(title='Resource Concentration vs Time', x='Time (hr)', y='Glucose Concentration (ng/mL)') + coord_trans(y="log10")+ theme_bw() 
ggplot(out, aes(time))+geom_line(aes(y=log(P/(U+L),10), color='VMR'), color='SLATEGRAY') +labs(title='Log VMR vs Time', x='Time (hr)', y='Log10 VMR (Log10 (phage/bacteria))')+ theme_bw() 

# Take a snapshot of the infection at the equilibrium
times <- seq(0,to=3000,by=1)

initials <- c(U=1, R=R_0, P=1, L=0)
out_1 = as.data.frame(ode(func=f, y=initials, parms =c(MOI=0),times = times))
out <- rbind(out, out_1)

ggplot(out, aes(time))+geom_line(aes(y=U/1000, color='Uninfected')) + geom_line(aes(y=L/1000, color='Lysogens'))+labs(title='Uninfected, Lysogen, and Phage Concentration vs Time', x='Time (hr)', y='Bacterial Concentration (x 1000 bacteria/mL)') +theme_bw() + geom_line(aes(y=P/1e+3,color="Phage"))+scale_y_continuous(sec.axis = sec_axis(~., name = "Phage Concentration (x 1000 phage/mL)")) 
#ggplot(out, aes(time))+geom_line(aes(y=P/1e+5, color='Phage'),color='GREEN') + labs(title='Phage Concentration vs Time', x='Time (hr)', y='Concentration (x 1e+5 phage/mL)') +theme_bw()
ggplot(out, aes(time))+geom_line(aes(y=R*1e+9, color='Resource'), color='PURPLE') +labs(title='Resource Concentration vs Time', x='Time (hr)', y='Glucose Concentration (ng/mL)') + coord_trans(y="log10")+ theme_bw() 
ggplot(out, aes(time))+geom_line(aes(y=log(P/(U+L),10), color='VMR'), color='SLATEGRAY') +labs(title='Log VMR vs Time', x='Time (hr)', y='Log10 VMR (Log10 (phage/bacteria))')+ theme_bw() 

# Compare actual lysogen to lysogen estimate
print(out$L[length(out$L)])
print(i/(e*(D_b + r)))

# Compare actual phage to phage estimate
print(out$P[length(out$P)])
print(i*beta*r/(K_a*i + D_p*e*(D_b + r)))

# Compare actual resource to resource estimate
print(out$R[length(out$R)])
print(-H*(D_b + r)/(D_b - V_L + r))

# Compare actual VMR to VMR estimate
print(out$P[length(out$P)]/(out$U[length(out$U)]+out$L[length(out$L)]))
print(beta*r*e*(D_b + r)/(K_a*i + D_p*e*(D_b + r)))

# Show that the uninfected bacteria concentration is essentially 0
print(out$U[length(out$U)])
