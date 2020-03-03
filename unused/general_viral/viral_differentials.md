## State Variables
$$G$$: Number of uninfected bacteria

$$L$$: Number of lysogens 

$$P$$: Number of phages

$$R$$: Amount of resources

## Parameters 
$$K_g$$: maximum per-bacterium growth rate

$$H_{g}$$ : concentration of resource resulting in half-maximal growth rate

$$K_d$$ : rate of bacterial death

$$H_d$$: concentration of resource resulting in half-maximal death rate 

$$e$$ : efficiency constant; amount of resource to create a new bacterium

$$\phi$$: probability of lysogeny upon infection

$$K_a$$: adsorption constant

$$B$$: burst size

$$d$$: dilution factor
## Explanation of composite variables/functions

$$u(x, K)$$ : common function used in Monod law

$$N$$ : New uninfected bacteria

$$N_L$$: New lysogens (from growth)

$$N_{Lyso}$$: New conversions from uninfected to lysogens

$$N_{Lyt}$$: New kills due to the lytic cycle

$$i$$ : infusion rate; amount of resource influx per unit time

## Differentials

$$\begin {aligned*}\\
u(x,\ K)=\frac{x}{x+K} \\ \\
N = K_{g} \cdot G \cdot u(R, H_{g})\\ 
N_L = K_g \cdot L \cdot u(R, H_{g})\\ 
N_{Lyso} = \phi \cdot K_a \cdot P \cdot G \\
N_{Lyt} = (1-\phi) \cdot K_a \cdot P \cdot G \\ \\
\frac{dG}{dt} = N - K_d \cdot G \cdot (1- u(R, H_{d})) - K_a \cdot P \cdot G - d \cdot G\ \\ \\ 
\frac{dL}{dt} = N_L + N_{Lyso} -K_d \cdot L \cdot (1- u(R, H_{d})) - r \cdot L - d \cdot L\\ \\
\frac{dP}{dt} = B \cdot N_{lyt} + B \cdot r \cdot L - K_a \cdot P \cdot (G+L+L2) - d \cdot P \\ \\
\frac{dR}{dt} = -e \cdot N  + i\ 
\end {aligned*}$$
