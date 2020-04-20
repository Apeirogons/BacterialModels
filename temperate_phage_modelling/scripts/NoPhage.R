source("CommonFunctions.R")
library("deSolve")
library("ggplot2")

# Parameters. Not all are used for this case of no phages.
V_U = 1.17793286293584
V_L = 0.588966431467919
H = 1.68640368735332e-08
e = 2.50233552196634e-12
D_b = 0.000895670740218448
eta = 0
phi = 0.000679589262920104
r = 0.000368269601201291
K_a = 5.56388967713043e-08
D_p = 1e-07
beta = 465.06704432923
d = 0
i = 5.51147180174923e-10


out = data.frame()

# Let the population grow to its normal equilibrium size
times <- seq(0,to=10000,by=1)

# The important part here is P = 0, which allows the uninfected bacteria to grow without phage.
# Growing the population to an initial equilibrium.
R_0 = i
initials <- c(U=1, R=R_0, P=0, L=0)
out_1 = as.data.frame(ode(func=f, y=initials, parms =c(MOI=0),times = times))
out <- rbind(out, out_1)

ggplot(out, aes(time))+geom_line(aes(y=U/1000, color='Bacteria'), color='RED') +labs(title='Bacterial Concentration vs Time', x='Time (hr)', y='Bacterial Concentration (x 1000 bacteria/mL)') +theme_bw()  
ggplot(out, aes(time))+geom_line(aes(y=R*1e+9, color='Resource'), color='PURPLE') +labs(title='Resource Concentration vs Time', x='Time (hr)', y='Glucose Concentration (ng/mL)') + coord_trans(y="log10")+ theme_bw() 

print('Integrated Bacteria: ')
print(out$U[length(out$U)])
print('Theoretical Equilibrium Bacteria: ')
print(i/(e*D_b))

print('Integrated Resource: ')
print(out$R[length(out$R)])
print('Theoretical Equilibrium Resource: ')
print(toString(H*D_b/(V_U-D_b)))

# Resource shock.
times <- seq(times[length(times)],to=times[length(times)]+5000,by=1)

initials <- c(U=out$U[length(out$U)], R=out$R[length(out$R)]+5e-7, P=0, L=0)
out_1 = as.data.frame(ode(func=f, y=initials, parms =c(MOI=0),times = times))
out <- rbind(out, out_1)

ggplot(out, aes(time))+geom_line(aes(y=U/1000, color='Bacteria'), color='RED') +labs(title='Bacterial Concentration vs Time', x='Time (hr)', y='Bacterial Concentration (x 1000 bacteria/mL)') +theme_bw()  
ggplot(out, aes(time))+geom_line(aes(y=R*1e+9, color='Resource'),  color='PURPLE') +labs(title='Resource Concentration vs Time', x='Time (hr)', y='Glucose Concentration (ng/mL)') + coord_trans(y="log10")+ theme_bw() 

# Reduced infusion.
i = i/2
times <- seq(times[length(times)],to=times[length(times)]+10000,by=1)

initials <- c(U=out$U[length(out$U)], R=out$R[length(out$R)], P=0, L=0)
out_1 = as.data.frame(ode(func=f, y=initials, parms =c(MOI=0),times = times))
out <- rbind(out, out_1)

ggplot(out, aes(time))+geom_line(aes(y=U/1000, color='Bacteria'), color='RED') +labs(title='Bacterial Concentration vs Time', x='Time (hr)', y='Bacterial Concentration (x 1000 bacteria/mL)') +theme_bw()  
ggplot(out, aes(time))+geom_line(aes(y=R*1e+9, color='Resource'),  color='PURPLE') +labs(title='Resource Concentration vs Time', x='Time (hr)', y='Glucose Concentration (ng/mL)') + coord_trans(y="log10")+ theme_bw() 

# Zoom on t=1000 for resource and bacteria.
ggplot(out[0:1000,], aes(time))+geom_line(aes(y=U/1000, color='Bacteria'), color='RED') +labs(title='Bacterial Concentration vs Time', x='Time (hr)', y='Bacterial Concentration (x 1000 bacteria/mL)') +theme_bw()  
ggplot(out[0:1000,], aes(time))+geom_line(aes(y=R*1e+9, color='Resource'), color='PURPLE') +labs(title='Resource Concentration vs Time', x='Time (hr)', y='Glucose Concentration (ng/mL)') + coord_trans(y="log10")+ theme_bw() 

# Zoom on t=10000 for resource and bacteria.
ggplot(out[9995:10010,], aes(time))+geom_line(aes(y=U/1000, color='Bacteria'), color='RED') +labs(title='Bacterial Concentration vs Time', x='Time (hr)', y='Bacterial Concentration (x 1000 bacteria/mL)') +theme_bw()  
ggplot(out[9995:10010,], aes(time))+geom_line(aes(y=R*1e+9, color='Resource'),  color='PURPLE') +labs(title='Resource Concentration vs Time', x='Time (hr)', y='Glucose Concentration (ng/mL)') + coord_trans(y="log10")+ theme_bw() 


