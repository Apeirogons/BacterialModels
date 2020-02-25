## State Variables
<img src="https://tex.s2cms.ru/svg/G" alt="G" />: Number of uninfected bacteria

<img src="https://tex.s2cms.ru/svg/L" alt="L" />: Number of lysogens 

<img src="https://tex.s2cms.ru/svg/P" alt="P" />: Number of phages

<img src="https://tex.s2cms.ru/svg/R" alt="R" />: Amount of resources

## Parameters 
<img src="https://tex.s2cms.ru/svg/K_g" alt="K_g" />: maximum per-bacterium growth rate

<img src="https://tex.s2cms.ru/svg/H_%7Bg%7D" alt="H_{g}" /> : concentration of resource resulting in half-maximal growth rate

<img src="https://tex.s2cms.ru/svg/K_d" alt="K_d" /> : rate of bacterial death

<img src="https://tex.s2cms.ru/svg/H_d" alt="H_d" />: concentration of resource resulting in half-maximal death rate 

<img src="https://tex.s2cms.ru/svg/e" alt="e" /> : efficiency constant; amount of resource to create a new bacterium

<img src="https://tex.s2cms.ru/svg/%5Cphi" alt="\phi" />: probability of lysogeny upon infection

<img src="https://tex.s2cms.ru/svg/K_a" alt="K_a" />: adsorption constant

<img src="https://tex.s2cms.ru/svg/B" alt="B" />: burst size

<img src="https://tex.s2cms.ru/svg/d" alt="d" />: dilution factor
## Explanation of composite variables/functions

<img src="https://tex.s2cms.ru/svg/u(x%2C%20K)" alt="u(x, K)" /> : common function used in Monod law

<img src="https://tex.s2cms.ru/svg/N" alt="N" /> : New uninfected bacteria

<img src="https://tex.s2cms.ru/svg/N_L" alt="N_L" />: New lysogens (from growth)

<img src="https://tex.s2cms.ru/svg/N_%7BLyso%7D" alt="N_{Lyso}" />: New conversions from uninfected to lysogens

<img src="https://tex.s2cms.ru/svg/N_%7BLyt%7D" alt="N_{Lyt}" />: New kills due to the lytic cycle

<img src="https://tex.s2cms.ru/svg/i" alt="i" /> : infusion rate; amount of resource influx per unit time

## Differentials

<img src="https://tex.s2cms.ru/svg/%5Cbegin%20%7Baligned*%7D%5C%5C%0Au(x%2C%5C%20K)%3D%5Cfrac%7Bx%7D%7Bx%2BK%7D%20%5C%5C%20%5C%5C%0AN%20%3D%20K_%7Bg%7D%20%5Ccdot%20G%20%5Ccdot%20u(R%2C%20H_%7Bg%7D)%5C%5C%20%0AN_L%20%3D%20K_g%20%5Ccdot%20L%20%5Ccdot%20u(R%2C%20H_%7Bg%7D)%5C%5C%20%0AN_%7BLyso%7D%20%3D%20%5Cphi%20%5Ccdot%20K_a%20%5Ccdot%20P%20%5Ccdot%20G%20%5C%5C%0AN_%7BLyt%7D%20%3D%20(1-%5Cphi)%20%5Ccdot%20K_a%20%5Ccdot%20P%20%5Ccdot%20G%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdG%7D%7Bdt%7D%20%3D%20N%20-%20K_d%20%5Ccdot%20G%20%5Ccdot%20(1-%20u(R%2C%20H_%7Bd%7D))%20-%20K_a%20%5Ccdot%20P%20%5Ccdot%20G%20-%20d%20%5Ccdot%20G%5C%20%5C%5C%20%5C%5C%20%0A%5Cfrac%7BdL%7D%7Bdt%7D%20%3D%20N_L%20%2B%20N_%7BLyso%7D%20-K_d%20%5Ccdot%20L%20%5Ccdot%20(1-%20u(R%2C%20H_%7Bd%7D))%20-%20r%20%5Ccdot%20L%20-%20d%20%5Ccdot%20L%5C%5C%20%5C%5C%0A%5Cfrac%7BdP%7D%7Bdt%7D%20%3D%20B%20%5Ccdot%20N_%7Blyt%7D%20%2B%20B%20%5Ccdot%20r%20%5Ccdot%20L%20-%20K_a%20%5Ccdot%20P%20%5Ccdot%20(G%2BL%2BL2)%20-%20d%20%5Ccdot%20P%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdR%7D%7Bdt%7D%20%3D%20-e%20%5Ccdot%20N%20%20%2B%20i%5C%20%0A%5Cend%20%7Baligned*%7D" alt="\begin {aligned*}\\
u(x,\ K)=\frac{x}{x+K} \\ \\
N = K_{g} \cdot G \cdot u(R, H_{g})\\ 
N_L = K_g \cdot L \cdot u(R, H_{g})\\ 
N_{Lyso} = \phi \cdot K_a \cdot P \cdot G \\
N_{Lyt} = (1-\phi) \cdot K_a \cdot P \cdot G \\ \\
\frac{dG}{dt} = N - K_d \cdot G \cdot (1- u(R, H_{d})) - K_a \cdot P \cdot G - d \cdot G\ \\ \\ 
\frac{dL}{dt} = N_L + N_{Lyso} -K_d \cdot L \cdot (1- u(R, H_{d})) - r \cdot L - d \cdot L\\ \\
\frac{dP}{dt} = B \cdot N_{lyt} + B \cdot r \cdot L - K_a \cdot P \cdot (G+L+L2) - d \cdot P \\ \\
\frac{dR}{dt} = -e \cdot N  + i\ 
\end {aligned*}" />
