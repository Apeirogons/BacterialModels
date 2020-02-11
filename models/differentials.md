
## Differential Equations

<img src="https://tex.s2cms.ru/svg/%20%5Cbegin%20%7Baligned*%7D%0A%20G%20%3D%20V_%7Bmax%7D%5Ccdot%20N%20%5Ccdot%20u(R%2C%20K_%7Bg%7D)%20%5C%5C%0A%20T_%7Bs%7D%20%3D%20K_%7BT%7D%5Ccdot%20N%20%5Ccdot%20(1-%20u(R%2C%20K_%7Bg%7D))%20%5C%5C%0A%20T_n%20%3D%20K_R%5Ccdot%20S%20%5Ccdot%20u%20(R%2CK_g)%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdN%7D%7Bdt%7D%20%3D%20G%20-%20T_s%20%2B%20T_n%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdR%7D%7Bdt%7D%20%3D%20-e%20%5Ccdot%20G%20%2B%20C%20%5Ccdot%20(N%2BR)%20%2B%20i%5C%5C%20%5C%5C%20%0A%5Cfrac%7BdS%7D%7Bdt%7D%20%3D%20T_s%20-%20T_n%20-%20K_d%20%5Ccdot%20S%20%5C%5C%20%5C%5C%0Au(x%2C%5C%20K)%3D%5Cfrac%7Bx%7D%7Bx%2BK%7D%0A%5Cend%20%7Baligned*%7D" alt=" \begin {aligned*}
 G = V_{max}\cdot N \cdot u(R, K_{g}) \\
 T_{s} = K_{T}\cdot N \cdot (1- u(R, K_{g})) \\
 T_n = K_R\cdot S \cdot u (R,K_g) \\ \\
\frac{dN}{dt} = G - T_s + T_n \\ \\
\frac{dR}{dt} = -e \cdot G + C \cdot (N+R) + i\\ \\ 
\frac{dS}{dt} = T_s - T_n - K_d \cdot S \\ \\
u(x,\ K)=\frac{x}{x+K}
\end {aligned*}" />

### Base variables 
<img src="https://tex.s2cms.ru/svg/%20V_%7Bmax%7D" alt=" V_{max}" />: maximum per-bacterium growth rate 

<img src="https://tex.s2cms.ru/svg/%20K_g%20" alt=" K_g " />: concentration of resource resulting in half-maximal growth rate

<img src="https://tex.s2cms.ru/svg/%20K_t%20" alt=" K_t " />: Rate constant for conversion from growth to stationary phase

<img src="https://tex.s2cms.ru/svg/%20K_R%20" alt=" K_R " />: Rate constant for conversion from stationary to growth phase

<img src="https://tex.s2cms.ru/svg/%20K_d%20" alt=" K_d " />: Rate constant for stationary phase bacterial death due to starvation

<img src="https://tex.s2cms.ru/svg/%20e%20" alt=" e " />: efficiency constant; amount of resource to create a new bacterium

<img src="https://tex.s2cms.ru/svg/%20C%20" alt=" C " />: constant resource consumption per bacterium

<img src="https://tex.s2cms.ru/svg/%20i%20" alt=" i " />: infusion rate; amount of resource influx per unit time

### Explanation of composite variables
<img src="https://tex.s2cms.ru/svg/%20u(x%2C%20K)%20" alt=" u(x, K) " />: common function used in Monod law

<img src="https://tex.s2cms.ru/svg/%20G%20" alt=" G " />: New growth phase bacteria

<img src="https://tex.s2cms.ru/svg/%20T_s%20" alt=" T_s " />: Transfers from growth to stationary phase

<img src="https://tex.s2cms.ru/svg/%20T_n%20" alt=" T_n " />: Transfers from stationary to growth phase