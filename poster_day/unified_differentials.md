## Notes 
- System is per every 1 mL

## State Variables
$$U$$: Number of uninfected bacteria (bacteria)

$$L$$: Number of lysogens (bacteria)

$$P$$: Number of phages (phages)

$$R$$: Amount of resources ($$\mu g$$)

$$A$$: Number of arbitrium peptide copies (peptides)

$$Y$$: Number of bacteria about to be lysed (bacteria)

## Parameters 

### Growth Rate Related
$$V_U$$: maximum uninfected per-bacterium growth rate (1/hr)

$$V_L$$: maximum lysogen growth rate (smaller than $$V_U$$) (1/hr)

$$H_U$$ : concentration of resource resulting in half-maximal growth rate ($$\mu g/mL$$)

### Death Rate Related
$$D_b$$: maximal rate of bacterial death (1/hr)

$$D_p$$: rate of death of free phage (1/hr)

### General Phage Related
$$K_a$$: adsorption constant $$(\frac{1}{\text{bacteria} \cdot \text{phage}})$$

$$B$$: burst size (phage)

$$T$$: Time it takes for a lytic cycle to burst (hr)

### Lysogeny Probability Related

$$\phi_0$$: baseline probability of lysogeny upon infection given 0 arbitrium (unitless)

$$D_A$$: rate of arbitrium peptide degradation (1/hr)

$$N_{arb}$$: number of arbitrium peptides released upon infection (peptides)

### Induction Related

$$r_0$$: Baseline induction rate (unitless)

### Resource Related

$$e$$ : efficiency constant; amount of resource to create a new bacterium ($$\mu g$$/bacterium)

$$d$$: dilution factor (unitless)

$$i$$: resource infusion rate ($$\mu g$$/hr)

### Parameters controlling adaptive phage responses

$$a_{\phi}$$: Parameter controlling sensitivity to arbitrium system (0 being non-sensitive and 1 being maximally sensitive)

$$H_{\phi}$$: number of arbitrium copies resulting in half-maximal arbitrium pathway activation (peptides)

$$a_r$$: Proportion of maximal death rate above which prophages reduce their induction rate to 0. (Set to 1 to remove starvation adaptation)

## Explanation of composite variables/functions

$$m(x, H)$$ : proportion of maximal growth rate in Monod law

$$q(x, B)$$: proportion of maximal death rate
 
$$N_U$$ : New uninfected bacteria 

$$N_L$$: New lysogens (from growth)

$$I_{Lyso}$$: New infections entering lysogenic cycle

$$I_{Lyt}$$: New infections entering lytic cycle

$$\beta = \frac{1}{H_d}$$: Rearranged variable in bacterial death function, set to 0 to make death rate constant  

$$r$$: induction rate

$$X$$: New lyses at this time point


### Adaptive composite variables
$$f(A)$$: monotonically increasing, concave down function representing increase in lysogeny probability due to arbitrium

$$\phi = a_{\phi}f(A) + \phi_0$$: total probability of lysogeny upon infection

$$r = (q(R, \beta)<a_r) \cdot r_0$$: induction rate

## Differentials

Quick question: What does the notation for the time delays look like?

Lost to adsorption should technically apply to all bacteria, but the results look strange.

$$\begin {aligned*}
m(x, H) = \frac{x}{x+H}\\ \\
q(x, B) = \frac{1}{xB+1}\\ \\
N_U = \underbrace{V_U \cdot U \cdot m(R, H_U)}_{\text{Uninfected growth}} \\ \\
N_L =  \underbrace{V_L \cdot L \cdot m(R, H_L)}_{\text{Lysogen growth}} \\ \\
I_{Lyso} = \underbrace{\phi \cdot K_a \cdot P \cdot U}_{\text{new infections choosing lysogeny}}\\ \\ 
I_{lyt}= \underbrace{(1- \phi) \cdot K_a \cdot P \cdot U}_{\text{new infections choosing lytic cycle}}  \\ \\ \\ 
X = \underbrace{I_{lyt, t-T} + r \cdot L_{t-T}}_{\text{new lyses = new lytic cycle entries T hours ago}} \\ \\
\phi = \underbrace{a_{\phi}f(A)}_{\text{lysogeny due to arbitrium}} + \underbrace{\phi_0}_{\text{baseline lysogeny probability}} \\ \\
r = \underbrace{(q(R, \beta)<a_r)}_{\text{0 if proportion death rate} \geq a_r}} \cdot  \ \underbrace{r_0}_{\text{baseline induction rate}} \\ \\ \\
\frac{dU}{dt} = \underbrace{N_U}_{\text{Uninfected growth}} - \underbrace{D_b \cdot U \cdot q(R, \beta)}_{\text{Uninfected bacterial deaths}} - \underbrace{K_a \cdot P \cdot U}_{\text{New phage adsorptions}} - \underbrace{d \cdot U}_{\text{dilution}} \\ \\
\frac{dL}{dt} = \underbrace{N_L}_{\text{Lysogen growth}}+ \underbrace{I_{Lyso}}_{\text{Lysogenic cycle chosen upon infection}} - \underbrace{D_b \cdot L \cdot q(R, \beta)}_{\text{Lysogen deaths}} - \underbrace{r \cdot L}_{\text{Inductions}} - \underbrace{d \cdot L}_{\text{dilution}} \\ \\
\frac{dP}{dt} = \underbrace{B \cdot X}_{\text{Released from lytic cycle or induction}} - \underbrace{K_a \cdot P \cdot U}_{\text{Lost to adsorption}} - \underbrace{D_p \cdot P}_{\text{Destruction of free phage}} -\underbrace{d \cdot P}_{\text{dilution}}\\ \\
\frac{dR}{dt} = \underbrace{-e \cdot (N_U + N_L)}_{\text{Use of resource to grow new bacteria}} + \underbrace{i}_{\text{Infusion of new resource}} - \underbrace{d \cdot R}_{\text{dilution}} \\ \\
\frac{dA}{dt} = \underbrace{N_{arb} \cdot (I_{Lyso} + I_{lyt})}_{\text{Production of arbitrium upon infection}} - \underbrace{D_A \cdot A}_{\text{Destruction of free arbitrium}} - \underbrace{d \cdot A}_{\text{dilution}} \\ \\
\frac{dY}{dt} = \underbrace{I_{lyt}}_{\text{Lytic cycle chosen upon initial infection}} + \underbrace{r \cdot L }_{\text{Lytic cycle initiated due to induction}} - \underbrace{I_{lyt}}_{\text{Lysis}}- \underbrace{d \cdot Y}_{\text{dilution}}
\end {aligned*}$$

## Derivation of q
$$\begin {aligned*} \\
q(x, H) = 1-m(x, H)) \\ \\
q(x, H) = 1 - \frac{x}{x+H}\\ \\
q(x, H) = \frac{x+H}{x+H} - \frac{x}{x+H} \\ \\
q(x, H) = \frac{H}{x+H}  \\ \\ 
B = \frac{1}{H} \\ \\
q(x, B) = \frac{\frac{1}{B}}{x+\frac{1}{B}} \\ \\ \\
q(x, B) = \frac{\frac{1}{B}}{\frac{xB + 1}{B}} \\ \\ \\
q(x, B) = \frac{1}{xB + 1}
\end {aligned*}$$

As $$H \rightarrow \infty, B \rightarrow 0$$. If $$B=0$$, $$q(x, B) = 1$$, leading to a constant rate of bacterial death.
