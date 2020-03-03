## Notes 
- System is per every 1 mL

## State Variables
<img src="https://tex.s2cms.ru/svg/U" alt="U" />: Number of uninfected bacteria (bacteria)

<img src="https://tex.s2cms.ru/svg/L" alt="L" />: Number of lysogens (bacteria)

<img src="https://tex.s2cms.ru/svg/P" alt="P" />: Number of phages (phages)

<img src="https://tex.s2cms.ru/svg/R" alt="R" />: Amount of resources (<img src="https://tex.s2cms.ru/svg/%5Cmu%20g" alt="\mu g" />)

<img src="https://tex.s2cms.ru/svg/A" alt="A" />: Number of arbitrium peptide copies (peptides)

<img src="https://tex.s2cms.ru/svg/Y" alt="Y" />: Number of bacteria about to be lysed (bacteria)

## Parameters 

### Growth Rate Related
<img src="https://tex.s2cms.ru/svg/V_U" alt="V_U" />: maximum uninfected per-bacterium growth rate (1/hr)

<img src="https://tex.s2cms.ru/svg/V_L" alt="V_L" />: maximum lysogen growth rate (smaller than <img src="https://tex.s2cms.ru/svg/V_U" alt="V_U" />) (1/hr)

<img src="https://tex.s2cms.ru/svg/H_U" alt="H_U" /> : concentration of resource resulting in half-maximal growth rate (<img src="https://tex.s2cms.ru/svg/%5Cmu%20g%2FmL" alt="\mu g/mL" />)

### Death Rate Related
<img src="https://tex.s2cms.ru/svg/D_b" alt="D_b" />: maximal rate of bacterial death (1/hr)

<img src="https://tex.s2cms.ru/svg/D_p" alt="D_p" />: rate of death of free phage (1/hr)

### General Phage Related
<img src="https://tex.s2cms.ru/svg/K_a" alt="K_a" />: adsorption constant <img src="https://tex.s2cms.ru/svg/(%5Cfrac%7B1%7D%7B%5Ctext%7Bbacteria%7D%20%5Ccdot%20%5Ctext%7Bphage%7D%7D)" alt="(\frac{1}{\text{bacteria} \cdot \text{phage}})" />

<img src="https://tex.s2cms.ru/svg/B" alt="B" />: burst size (phage)

<img src="https://tex.s2cms.ru/svg/T" alt="T" />: Time it takes for a lytic cycle to burst (hr)

### Lysogeny Probability Related

<img src="https://tex.s2cms.ru/svg/%5Cphi_0" alt="\phi_0" />: baseline probability of lysogeny upon infection given 0 arbitrium (unitless)

<img src="https://tex.s2cms.ru/svg/D_A" alt="D_A" />: rate of arbitrium peptide degradation (1/hr)

<img src="https://tex.s2cms.ru/svg/N_%7Barb%7D" alt="N_{arb}" />: number of arbitrium peptides released upon infection (peptides)

### Induction Related

<img src="https://tex.s2cms.ru/svg/r_0" alt="r_0" />: Baseline induction rate (unitless)

### Resource Related

<img src="https://tex.s2cms.ru/svg/e" alt="e" /> : efficiency constant; amount of resource to create a new bacterium (<img src="https://tex.s2cms.ru/svg/%5Cmu%20g" alt="\mu g" />/bacterium)

<img src="https://tex.s2cms.ru/svg/d" alt="d" />: dilution factor (unitless)

<img src="https://tex.s2cms.ru/svg/i" alt="i" />: resource infusion rate (<img src="https://tex.s2cms.ru/svg/%5Cmu%20g" alt="\mu g" />/hr)

### Parameters controlling adaptive phage responses

<img src="https://tex.s2cms.ru/svg/a_%7B%5Cphi%7D" alt="a_{\phi}" />: Parameter controlling sensitivity to arbitrium system (0 being non-sensitive and 1 being maximally sensitive)

<img src="https://tex.s2cms.ru/svg/H_%7B%5Cphi%7D" alt="H_{\phi}" />: number of arbitrium copies resulting in half-maximal arbitrium pathway activation (peptides)

<img src="https://tex.s2cms.ru/svg/a_r" alt="a_r" />: Proportion of maximal death rate above which prophages reduce their induction rate to 0. (Set to 1 to remove starvation adaptation)

## Explanation of composite variables/functions

<img src="https://tex.s2cms.ru/svg/m(x%2C%20H)" alt="m(x, H)" /> : proportion of maximal growth rate in Monod law

<img src="https://tex.s2cms.ru/svg/q(x%2C%20B)" alt="q(x, B)" />: proportion of maximal death rate
 
<img src="https://tex.s2cms.ru/svg/N_U" alt="N_U" /> : New uninfected bacteria 

<img src="https://tex.s2cms.ru/svg/N_L" alt="N_L" />: New lysogens (from growth)

<img src="https://tex.s2cms.ru/svg/I_%7BLyso%7D" alt="I_{Lyso}" />: New infections entering lysogenic cycle

<img src="https://tex.s2cms.ru/svg/I_%7BLyt%7D" alt="I_{Lyt}" />: New infections entering lytic cycle

<img src="https://tex.s2cms.ru/svg/%5Cbeta%20%3D%20%5Cfrac%7B1%7D%7BH_d%7D" alt="\beta = \frac{1}{H_d}" />: Rearranged variable in bacterial death function, set to 0 to make death rate constant  

<img src="https://tex.s2cms.ru/svg/r" alt="r" />: induction rate

<img src="https://tex.s2cms.ru/svg/X" alt="X" />: New lyses at this time point


### Adaptive composite variables
<img src="https://tex.s2cms.ru/svg/f(A)" alt="f(A)" />: monotonically increasing, concave down function representing increase in lysogeny probability due to arbitrium

<img src="https://tex.s2cms.ru/svg/%5Cphi%20%3D%20a_%7B%5Cphi%7Df(A)%20%2B%20%5Cphi_0" alt="\phi = a_{\phi}f(A) + \phi_0" />: total probability of lysogeny upon infection

<img src="https://tex.s2cms.ru/svg/r%20%3D%20(q(R%2C%20%5Cbeta)%3Ca_r)%20%5Ccdot%20r_0" alt="r = (q(R, \beta)&lt;a_r) \cdot r_0" />: induction rate

## Differentials

Quick question: What does the notation for the time delays look like?

Lost to adsorption should technically apply to all bacteria, but the results look strange.

<img src="https://tex.s2cms.ru/svg/%5Cbegin%20%7Baligned*%7D%0Am(x%2C%20H)%20%3D%20%5Cfrac%7Bx%7D%7Bx%2BH%7D%5C%5C%20%5C%5C%0Aq(x%2C%20B)%20%3D%20%5Cfrac%7B1%7D%7BxB%2B1%7D%5C%5C%20%5C%5C%0AN_U%20%3D%20%5Cunderbrace%7BV_U%20%5Ccdot%20U%20%5Ccdot%20m(R%2C%20H_U)%7D_%7B%5Ctext%7BUninfected%20growth%7D%7D%20%5C%5C%20%5C%5C%0AN_L%20%3D%20%20%5Cunderbrace%7BV_L%20%5Ccdot%20L%20%5Ccdot%20m(R%2C%20H_L)%7D_%7B%5Ctext%7BLysogen%20growth%7D%7D%20%5C%5C%20%5C%5C%0AI_%7BLyso%7D%20%3D%20%5Cunderbrace%7B%5Cphi%20%5Ccdot%20K_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7Bnew%20infections%20choosing%20lysogeny%7D%7D%5C%5C%20%5C%5C%20%0AI_%7Blyt%7D%3D%20%5Cunderbrace%7B(1-%20%5Cphi)%20%5Ccdot%20K_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7Bnew%20infections%20choosing%20lytic%20cycle%7D%7D%20%20%5C%5C%20%5C%5C%20%5C%5C%20%0AX%20%3D%20%5Cunderbrace%7BI_%7Blyt%2C%20t-T%7D%20%2B%20r%20%5Ccdot%20L_%7Bt-T%7D%7D_%7B%5Ctext%7Bnew%20lyses%20%3D%20new%20lytic%20cycle%20entries%20T%20hours%20ago%7D%7D%20%5C%5C%20%5C%5C%0A%5Cphi%20%3D%20%5Cunderbrace%7Ba_%7B%5Cphi%7Df(A)%7D_%7B%5Ctext%7Blysogeny%20due%20to%20arbitrium%7D%7D%20%2B%20%5Cunderbrace%7B%5Cphi_0%7D_%7B%5Ctext%7Bbaseline%20lysogeny%20probability%7D%7D%20%5C%5C%20%5C%5C%0Ar%20%3D%20%5Cunderbrace%7B(q(R%2C%20%5Cbeta)%3Ca_r)%7D_%7B%5Ctext%7B0%20if%20proportion%20death%20rate%7D%20%5Cgeq%20a_r%7D%7D%20%5Ccdot%20%20%5C%20%5Cunderbrace%7Br_0%7D_%7B%5Ctext%7Bbaseline%20induction%20rate%7D%7D%20%5C%5C%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdU%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7BN_U%7D_%7B%5Ctext%7BUninfected%20growth%7D%7D%20-%20%5Cunderbrace%7BD_b%20%5Ccdot%20U%20%5Ccdot%20q(R%2C%20%5Cbeta)%7D_%7B%5Ctext%7BUninfected%20bacterial%20deaths%7D%7D%20-%20%5Cunderbrace%7BK_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7BNew%20phage%20adsorptions%7D%7D%20-%20%5Cunderbrace%7Bd%20%5Ccdot%20U%7D_%7B%5Ctext%7Bdilution%7D%7D%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdL%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7BN_L%7D_%7B%5Ctext%7BLysogen%20growth%7D%7D%2B%20%5Cunderbrace%7BI_%7BLyso%7D%7D_%7B%5Ctext%7BLysogenic%20cycle%20chosen%20upon%20infection%7D%7D%20-%20%5Cunderbrace%7BD_b%20%5Ccdot%20L%20%5Ccdot%20q(R%2C%20%5Cbeta)%7D_%7B%5Ctext%7BLysogen%20deaths%7D%7D%20-%20%5Cunderbrace%7Br%20%5Ccdot%20L%7D_%7B%5Ctext%7BInductions%7D%7D%20-%20%5Cunderbrace%7Bd%20%5Ccdot%20L%7D_%7B%5Ctext%7Bdilution%7D%7D%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdP%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7BB%20%5Ccdot%20X%7D_%7B%5Ctext%7BReleased%20from%20lytic%20cycle%20or%20induction%7D%7D%20-%20%5Cunderbrace%7BK_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7BLost%20to%20adsorption%7D%7D%20-%20%5Cunderbrace%7BD_p%20%5Ccdot%20P%7D_%7B%5Ctext%7BDestruction%20of%20free%20phage%7D%7D%20-%5Cunderbrace%7Bd%20%5Ccdot%20P%7D_%7B%5Ctext%7Bdilution%7D%7D%5C%5C%20%5C%5C%0A%5Cfrac%7BdR%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7B-e%20%5Ccdot%20(N_U%20%2B%20N_L)%7D_%7B%5Ctext%7BUse%20of%20resource%20to%20grow%20new%20bacteria%7D%7D%20%2B%20%5Cunderbrace%7Bi%7D_%7B%5Ctext%7BInfusion%20of%20new%20resource%7D%7D%20-%20%5Cunderbrace%7Bd%20%5Ccdot%20R%7D_%7B%5Ctext%7Bdilution%7D%7D%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdA%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7BN_%7Barb%7D%20%5Ccdot%20(I_%7BLyso%7D%20%2B%20I_%7Blyt%7D)%7D_%7B%5Ctext%7BProduction%20of%20arbitrium%20upon%20infection%7D%7D%20-%20%5Cunderbrace%7BD_A%20%5Ccdot%20A%7D_%7B%5Ctext%7BDestruction%20of%20free%20arbitrium%7D%7D%20-%20%5Cunderbrace%7Bd%20%5Ccdot%20A%7D_%7B%5Ctext%7Bdilution%7D%7D%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdY%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7BI_%7Blyt%7D%7D_%7B%5Ctext%7BLytic%20cycle%20chosen%20upon%20initial%20infection%7D%7D%20%2B%20%5Cunderbrace%7Br%20%5Ccdot%20L%20%7D_%7B%5Ctext%7BLytic%20cycle%20initiated%20due%20to%20induction%7D%7D%20-%20%5Cunderbrace%7BI_%7Blyt%7D%7D_%7B%5Ctext%7BLysis%7D%7D-%20%5Cunderbrace%7Bd%20%5Ccdot%20Y%7D_%7B%5Ctext%7Bdilution%7D%7D%0A%5Cend%20%7Baligned*%7D" alt="\begin {aligned*}
m(x, H) = \frac{x}{x+H}\\ \\
q(x, B) = \frac{1}{xB+1}\\ \\
N_U = \underbrace{V_U \cdot U \cdot m(R, H_U)}_{\text{Uninfected growth}} \\ \\
N_L =  \underbrace{V_L \cdot L \cdot m(R, H_L)}_{\text{Lysogen growth}} \\ \\
I_{Lyso} = \underbrace{\phi \cdot K_a \cdot P \cdot U}_{\text{new infections choosing lysogeny}}\\ \\ 
I_{lyt}= \underbrace{(1- \phi) \cdot K_a \cdot P \cdot U}_{\text{new infections choosing lytic cycle}}  \\ \\ \\ 
X = \underbrace{I_{lyt, t-T} + r \cdot L_{t-T}}_{\text{new lyses = new lytic cycle entries T hours ago}} \\ \\
\phi = \underbrace{a_{\phi}f(A)}_{\text{lysogeny due to arbitrium}} + \underbrace{\phi_0}_{\text{baseline lysogeny probability}} \\ \\
r = \underbrace{(q(R, \beta)&lt;a_r)}_{\text{0 if proportion death rate} \geq a_r}} \cdot  \ \underbrace{r_0}_{\text{baseline induction rate}} \\ \\ \\
\frac{dU}{dt} = \underbrace{N_U}_{\text{Uninfected growth}} - \underbrace{D_b \cdot U \cdot q(R, \beta)}_{\text{Uninfected bacterial deaths}} - \underbrace{K_a \cdot P \cdot U}_{\text{New phage adsorptions}} - \underbrace{d \cdot U}_{\text{dilution}} \\ \\
\frac{dL}{dt} = \underbrace{N_L}_{\text{Lysogen growth}}+ \underbrace{I_{Lyso}}_{\text{Lysogenic cycle chosen upon infection}} - \underbrace{D_b \cdot L \cdot q(R, \beta)}_{\text{Lysogen deaths}} - \underbrace{r \cdot L}_{\text{Inductions}} - \underbrace{d \cdot L}_{\text{dilution}} \\ \\
\frac{dP}{dt} = \underbrace{B \cdot X}_{\text{Released from lytic cycle or induction}} - \underbrace{K_a \cdot P \cdot U}_{\text{Lost to adsorption}} - \underbrace{D_p \cdot P}_{\text{Destruction of free phage}} -\underbrace{d \cdot P}_{\text{dilution}}\\ \\
\frac{dR}{dt} = \underbrace{-e \cdot (N_U + N_L)}_{\text{Use of resource to grow new bacteria}} + \underbrace{i}_{\text{Infusion of new resource}} - \underbrace{d \cdot R}_{\text{dilution}} \\ \\
\frac{dA}{dt} = \underbrace{N_{arb} \cdot (I_{Lyso} + I_{lyt})}_{\text{Production of arbitrium upon infection}} - \underbrace{D_A \cdot A}_{\text{Destruction of free arbitrium}} - \underbrace{d \cdot A}_{\text{dilution}} \\ \\
\frac{dY}{dt} = \underbrace{I_{lyt}}_{\text{Lytic cycle chosen upon initial infection}} + \underbrace{r \cdot L }_{\text{Lytic cycle initiated due to induction}} - \underbrace{I_{lyt}}_{\text{Lysis}}- \underbrace{d \cdot Y}_{\text{dilution}}
\end {aligned*}" />

## Derivation of q
<img src="https://tex.s2cms.ru/svg/%5Cbegin%20%7Baligned*%7D%20%5C%5C%0Aq(x%2C%20H)%20%3D%201-m(x%2C%20H))%20%5C%5C%20%5C%5C%0Aq(x%2C%20H)%20%3D%201%20-%20%5Cfrac%7Bx%7D%7Bx%2BH%7D%5C%5C%20%5C%5C%0Aq(x%2C%20H)%20%3D%20%5Cfrac%7Bx%2BH%7D%7Bx%2BH%7D%20-%20%5Cfrac%7Bx%7D%7Bx%2BH%7D%20%5C%5C%20%5C%5C%0Aq(x%2C%20H)%20%3D%20%5Cfrac%7BH%7D%7Bx%2BH%7D%20%20%5C%5C%20%5C%5C%20%0AB%20%3D%20%5Cfrac%7B1%7D%7BH%7D%20%5C%5C%20%5C%5C%0Aq(x%2C%20B)%20%3D%20%5Cfrac%7B%5Cfrac%7B1%7D%7BB%7D%7D%7Bx%2B%5Cfrac%7B1%7D%7BB%7D%7D%20%5C%5C%20%5C%5C%20%5C%5C%0Aq(x%2C%20B)%20%3D%20%5Cfrac%7B%5Cfrac%7B1%7D%7BB%7D%7D%7B%5Cfrac%7BxB%20%2B%201%7D%7BB%7D%7D%20%5C%5C%20%5C%5C%20%5C%5C%0Aq(x%2C%20B)%20%3D%20%5Cfrac%7B1%7D%7BxB%20%2B%201%7D%0A%5Cend%20%7Baligned*%7D" alt="\begin {aligned*} \\
q(x, H) = 1-m(x, H)) \\ \\
q(x, H) = 1 - \frac{x}{x+H}\\ \\
q(x, H) = \frac{x+H}{x+H} - \frac{x}{x+H} \\ \\
q(x, H) = \frac{H}{x+H}  \\ \\ 
B = \frac{1}{H} \\ \\
q(x, B) = \frac{\frac{1}{B}}{x+\frac{1}{B}} \\ \\ \\
q(x, B) = \frac{\frac{1}{B}}{\frac{xB + 1}{B}} \\ \\ \\
q(x, B) = \frac{1}{xB + 1}
\end {aligned*}" />

As <img src="https://tex.s2cms.ru/svg/H%20%5Crightarrow%20%5Cinfty%2C%20B%20%5Crightarrow%200" alt="H \rightarrow \infty, B \rightarrow 0" />. If <img src="https://tex.s2cms.ru/svg/B%3D0" alt="B=0" />, <img src="https://tex.s2cms.ru/svg/q(x%2C%20B)%20%3D%201" alt="q(x, B) = 1" />, leading to a constant rate of bacterial death.
