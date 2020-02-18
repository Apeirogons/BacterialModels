## State Variables
$$G$$: Number of growth phase bacteria

$$S$$: Number of stationary phase bacteria

$$R$$: Amount of resources

## Parameters 
$$K_g$$: maximum per-bacterium growth rate

$$H_{g}$$ : concentration of resource resulting in half-maximal growth rate

$$K_{gs}$$: rate of conversion from growth to stationary phase

$$H_{gs}$$ : concentration of resource resulting in half-maximal transfer rate from growth to stationary

$$K_{sg}$$: rate of conversion from stationary to growth phase

$$H_{sg}$$ : concentration of resource resulting in half-maximal transfer rate from stationary to growth

$$K_d$$ : rate of stationary phase bacterial death due to starvation

$$e$$ : efficiency constant; amount of resource to create a new bacterium


## Explanation of composite variables
$$u(x, K)$$ : common function used in Monod law

$$N$$ : New growth phase bacteria

$$T_{gs}$$ : Transfers from growth to stationary phase

$$T_{sg}$$ : Transfers from stationary to growth phase

$$i$$ : infusion rate; amount of resource influx per unit time

## Differentials

$$\begin {aligned*}\\
u(x,\ K)=\frac{x}{x+K} \\ \\
N = K_{g} \cdot G \cdot u(R, H_{g})\\
T_{gs} = K_{gs}\cdot G \cdot (1- u(R, H_{gs})) \\
T_{sg} = K_{sg}\cdot S \cdot u (R,H_{sg})\\ \\
\frac{dG}{dt} = N - T_{gs} + T_{sg} \\ \\
\frac{dS}{dt} = T_{gs} - T_{sg} - K_{d} \cdot S \\ \\
\frac{dR}{dt} = -e \cdot N  + i\ 
\end {aligned*}$$
