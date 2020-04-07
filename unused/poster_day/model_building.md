The purpose of these modeling efforts were to produce a framework through which lysis-lysogeny decisions could be studied. To do this, the model included terms that attempted to explain several biological phenomena.

# **Basic Model**

This model considers a well-mixed system of bacteria and phage in an environment with some amount of resources.

## **State Variables**
A system to model lysis-lysogeny decisions would not be possible without **phages**, as well as hosts for the phages, that being bacteria. Since the lysogenic cycle can convert **uninfected bacteria** to **lysogens** (state, <img src="https://tex.s2cms.ru/svg/L" alt="L" />), both these variables must be tracked as well. All of these state variables are implicitly concentrations. The choice of tracking resources is described in the section on the Monod function.

I use bacteria (<img src="https://tex.s2cms.ru/svg/B" alt="B" />) to conceptually explain both lysogens and uninfected bacteria, as they are assumed to have similar laws governing their growth and interactions with phages unless otherwise stated.

<img src="https://tex.s2cms.ru/svg/U" alt="U" />: Concentration of uninfected bacteria (bacteria/mL)

<img src="https://tex.s2cms.ru/svg/L" alt="L" />: Concentration of lysogens (bacteria/mL)

<img src="https://tex.s2cms.ru/svg/P" alt="P" />: Concentration of phages (phages/mL)

<img src="https://tex.s2cms.ru/svg/R" alt="R" />: Concentration of growth rate-limiting resource (<img src="https://tex.s2cms.ru/svg/%5Cmu%20g%2FmL" alt="\mu g/mL" />)


## **Resource-dependent bacterial growth**

### Assumptions
**Bacterial growth rates should be a monotonically increasing function of resources.** (<img src="https://tex.s2cms.ru/svg/%5Cfrac%7BdB%7D%7BdR%7D%20%5Cgeq%200" alt="\frac{dB}{dR} \geq 0" />). This is because bacteria grow more slowly under conditions of starvation. Based on this observation, it seems that as resources decrease, bacteria should grow more slowly. To track this, we need to also track the **resource** (<img src="https://tex.s2cms.ru/svg/R" alt="R" />) concentration in the environment as a state variable. This resource represents the rate-limiting resource for bacterial growth.

**There should exist a maximal bacterial growth rate (<img src="https://tex.s2cms.ru/svg/V" alt="V" />), which is achieved when resource levels are high.** (as <img src="https://tex.s2cms.ru/svg/R%20%5Crightarrow%20%5Cinfty%2C%20%20%5Cfrac%7BdB%7D%7BdR%7D%20%5Crightarrow%20V" alt="R \rightarrow \infty,  \frac{dB}{dR} \rightarrow V" />). This is because the rate of bacterial growth cannot increase indefinitely as extracellular resources increase. Additionally, lysogens grow more slowly than uninfected bacteria, so the lysogen growth rate should be lower than the uninfected growth rate. 

**Bacterial resource utilization should be proportional to the bacterial growth rate.** (<img src="https://tex.s2cms.ru/svg/%5Cfrac%7BdR%7D%7Bdt%7D%20%5Cpropto%20%5Ctext%7Bbacterial%20growth%7D" alt="\frac{dR}{dt} \propto \text{bacterial growth}" />) This is because bacteria clearly require some minimum amount of resources from the environment to grow a new bacterium.

## Introducing the Monod growth law
**One growth function satisfying these assumptions is the empirically derived Monod bacterial growth function.** 

<img src="https://tex.s2cms.ru/svg/m(R%2C%20H)%20%3D%20%5Cfrac%7BR%7D%7BR%2BH%7D%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdB%7D%7Bdt%7D%20%3D%20V%20%5Ccdot%20m(R%2C%20H)%20%5Ccdot%20B%20%5C%5C%20%5C%5C%20%0A%5Cfrac%7BdR%7D%7Bdt%7D%20%3D%20-e%20%5Ccdot%20V%20%5Ccdot%20m(R%2C%20H)%20%5Ccdot%20B" alt="m(R, H) = \frac{R}{R+H} \\ \\
\frac{dB}{dt} = V \cdot m(R, H) \cdot B \\ \\ 
\frac{dR}{dt} = -e \cdot V \cdot m(R, H) \cdot B" />

Firstly, let us observe the form of <img src="https://tex.s2cms.ru/svg/m" alt="m" />. This function is concave down, is bounded between 0 and 1, and is equal to 0 when <img src="https://tex.s2cms.ru/svg/R%3D0" alt="R=0" />. Looking at <img src="https://tex.s2cms.ru/svg/%5Cfrac%7BdB%7D%7Bdt%7D" alt="\frac{dB}{dt}" />, it is clear that this function represents the proportion of the maximal growth rate achieved at a given resource concentration. It also uses the maximal growth rate which was discussed earlier. 

Next, let us observe the form of <img src="https://tex.s2cms.ru/svg/%5Cfrac%7BdR%7D%7Bdt%7D" alt="\frac{dR}{dt}" />. This function is saying that the total resource utilization is equal to the bacterial growth rate multiplied by the efficiency constant **<img src="https://tex.s2cms.ru/svg/e" alt="e" />**, which represents the amount of resources used to form a new bacterium. However, this means that the model does not capture any baseline resource utilization by bacteria independent of bacterial growth; this was omitted for stability considerations.
 
If unperturbed, the growth function produces a sigmoid-shaped bacterial growth curve with respect to time, which is expected. However, population saturation is due to the growth rate vanishing to zero as resources are used, and thus, the Monod model cannot capture bacterial death due to starvation.

### New Parameters
<img src="https://tex.s2cms.ru/svg/V_U" alt="V_U" />: maximum uninfected growth rate (1/hr)

<img src="https://tex.s2cms.ru/svg/V_L" alt="V_L" />: maximum lysogen growth rate (1/hr)

<img src="https://tex.s2cms.ru/svg/H" alt="H" />: concentration of resource resulting in half-maximal growth rate in all bacteria (<img src="https://tex.s2cms.ru/svg/%5Cmu%20g%2FmL" alt="\mu g/mL" />)

<img src="https://tex.s2cms.ru/svg/e" alt="e" /> : efficiency constant; amount of resource to create a new bacterium (<img src="https://tex.s2cms.ru/svg/%5Cmu%20g" alt="\mu g" />/bacterium)

### Composite Variables/Functions
<img src="https://tex.s2cms.ru/svg/m(R%2C%20H)%20%3D%20%5Cunderbrace%7B%5Cfrac%7BR%7D%7BR%2BH%7D%7D_%7B%5Ctext%7BProportion%20of%20maximal%20growth%20rate%7D%7D%5C%5C%20%5C%5C%0AN_U%20%3D%20%5Cunderbrace%7BV_U%20%5Ccdot%20U%20%5Ccdot%20m(R%2C%20H)%7D_%7B%5Ctext%7BUninfected%20growth%20%7D%7D%20%5C%5C%20%5C%5C%0AN_L%20%3D%20%20%5Cunderbrace%7BV_L%20%5Ccdot%20L%20%5Ccdot%20m(R%2C%20H)%7D_%7B%5Ctext%7BLysogen%20growth%7D%7D%20%5C%5C%20%5C%5C" alt="m(R, H) = \underbrace{\frac{R}{R+H}}_{\text{Proportion of maximal growth rate}}\\ \\
N_U = \underbrace{V_U \cdot U \cdot m(R, H)}_{\text{Uninfected growth }} \\ \\
N_L =  \underbrace{V_L \cdot L \cdot m(R, H)}_{\text{Lysogen growth}} \\ \\" />

### Contributions to the Differentials
<img src="https://tex.s2cms.ru/svg/%0A%20%5Cunderbrace%7B-e%20%5Ccdot%20(N_U%20%2B%20N_L)%7D_%7B%5Ctext%7BUse%20of%20resource%20to%20grow%20new%20bacteria%2C%20component%20of%7D%20%5Cfrac%7BdR%7D%7Bdt%7D%7D%7D" alt="
 \underbrace{-e \cdot (N_U + N_L)}_{\text{Use of resource to grow new bacteria, component of} \frac{dR}{dt}}}" />

<img src="https://tex.s2cms.ru/svg/%20%0A%20%5Cunderbrace%7B%2BN_U%7D_%7B%5Ctext%7Bcomponent%20of%7D%20%5Cfrac%7BdU%7D%7Bdt%7D%7D%20%5C%5C%20%5C%5C%0A%5Cunderbrace%7B%2BN_L%7D_%7B%5Ctext%7Bcomponent%20of%7D%20%5Cfrac%7BdL%7D%7Bdt%7D%7D%20" alt=" 
 \underbrace{+N_U}_{\text{component of} \frac{dU}{dt}} \\ \\
\underbrace{+N_L}_{\text{component of} \frac{dL}{dt}} " />


## **Bacterial Death**

### Assumptions
**Bacteria should have a natural death rate, which monotonically decreases with the resource concentration.** In an ecosystem, bacteria can die in many ways unrelated to phages, but it is likely that resource deprivation would decrease this rate of death as they would be less likely to be able to adapt to their environment with low energy. 

A convenient function for a bacterial death function related to resource deprivation might be related to bacterial growth in the Monod growth function, due to the link between bacterial death and resource concentration.
However, instead of the growth rate increasing with increased resource, we have the death rate decreasing with increased resource.

### Reformulating a Death Function

We would like to represent the proportion of the maximal death rate achieved with 1-m (as this is bounded between 0 and 1, and decreases the death rate with increasing resource). However, we may reformulate this death equation to assume constant rates of bacterial death if required.

<img src="https://tex.s2cms.ru/svg/%5Cbegin%20%7Baligned*%7D%20%5C%20q(R%2C%20H)%20%3D%201-m(R%2C%20H))%20%5C%5C%20q(R%2C%20H)%20%3D%201%20-%20%5Cfrac%7BR%7D%7BR%2BH%7D%5C%5C%20%20q(x%2C%20H)%20%3D%20%5Cfrac%7BH%7D%7BR%2BH%7D%20%5C%5C%20%5Ceta%20%3D%20%5Cfrac%7B1%7D%7BH%7D%20%5C%5C%20q(x%2C%20%5Ceta)%20%3D%20%5Cfrac%7B%5Cfrac%7B1%7D%7B%5Ceta%7D%7D%7Bx%2B%5Cfrac%7B1%7D%7B%5Ceta%7D%7D%20%5C%5C%20%5C%20q(R%2C%20%5Ceta)%20%3D%20%5Cfrac%7B%5Cfrac%7B1%7D%7B%5Ceta%7D%7D%7B%5Cfrac%7BR%5Ceta%20%2B%201%7D%7B%5Ceta%7D%7D%20%5C%5C%20%5C%20q(R%2C%20%5Ceta)%20%3D%20%5Cfrac%7B1%7D%7BR%5Ceta%20%2B%201%7D%20%5Cend%20%7Baligned*%7D" alt="\begin {aligned*} \ q(R, H) = 1-m(R, H)) \\ q(R, H) = 1 - \frac{R}{R+H}\\  q(x, H) = \frac{H}{R+H} \\ \eta = \frac{1}{H} \\ q(x, \eta) = \frac{\frac{1}{\eta}}{x+\frac{1}{\eta}} \\ \ q(R, \eta) = \frac{\frac{1}{\eta}}{\frac{R\eta + 1}{\eta}} \\ \ q(R, \eta) = \frac{1}{R\eta + 1} \end {aligned*}" />

As <img src="https://tex.s2cms.ru/svg/H%20%5Crightarrow%20%5Cinfty%2C%20%5Ceta%20%5Crightarrow%200" alt="H \rightarrow \infty, \eta \rightarrow 0" />. If <img src="https://tex.s2cms.ru/svg/%5Ceta%3D0" alt="\eta=0" />, <img src="https://tex.s2cms.ru/svg/q(x%2C%20%5Ceta)%20%3D%201" alt="q(x, \eta) = 1" />, leading to a constant rate of bacterial death. 

### New Parameters
<img src="https://tex.s2cms.ru/svg/D_b" alt="D_b" />: maximal rate of bacterial death (1/hr)

<img src="https://tex.s2cms.ru/svg/%5Ceta" alt="\eta" />: Rearranged parameter in bacterial death function, set to 0 to make death rate constant  

### Composite Variables/Functions
<img src="https://tex.s2cms.ru/svg/%20q(R%2C%20%5Ceta)%20%3D%20%5Cunderbrace%7B%5Cfrac%7B1%7D%7BR%5Ceta%20%2B%201%7D%7D_%7B%5Ctext%7Bproportion%20of%20maximal%20death%20rate%20achieved%7D%7D" alt=" q(R, \eta) = \underbrace{\frac{1}{R\eta + 1}}_{\text{proportion of maximal death rate achieved}}" />

### Contributions to the Differentials
<img src="https://tex.s2cms.ru/svg/%20%5Cunderbrace%7B-D_b%20%5Ccdot%20L%20%5Ccdot%20q(R%2C%20%5Ceta)%7D_%7B%5Ctext%7Blysogen%20deaths%20unrelated%20to%20phage%2C%20component%20of%7D%20%5Cfrac%7BdL%7D%7Bdt%7D%7D%20%5C%5C%20%5C%5C%0A%5Cunderbrace%7B-D_b%20%5Ccdot%20U%20%5Ccdot%20q(R%2C%20%5Ceta)%7D_%7B%5Ctext%7Buninfected%20deaths%20unrelated%20to%20phage%2C%20component%20of%7D%20%5Cfrac%7BdU%7D%7Bdt%7D%7D" alt=" \underbrace{-D_b \cdot L \cdot q(R, \eta)}_{\text{lysogen deaths unrelated to phage, component of} \frac{dL}{dt}} \\ \\
\underbrace{-D_b \cdot U \cdot q(R, \eta)}_{\text{uninfected deaths unrelated to phage, component of} \frac{dU}{dt}}" />

## **Adding Simple Phages**

### Assumptions
**Phage-bacteria binding should follow the law of mass action.** The binding between phages and bacteria is a chemical process, which would be modeled in chemistry using this law. Briefly, this states that the binding rate should be directly proportional to both the phage concentration and the bacterial concentration, and assumes that phages and bacteria are interacting due to chance (both of which I believe are reasonable assessments). 

**All phage adsorptions to uninfected bacteria lead to infections.** This assumes that each adsorption to an uninfected bacterium leads to an infection, with no failed infections. This is unrealistic (for example, restriction enzyme systems may lead to failed infections, among others), but has been left out for simplicity. However, one could model this by assuming a constant rate of infection failure. Additionally, phages adsorbed in this way are removed from the free phage compartment. 

**Free phages are degraded at a constant rate independent of adsorption to bacteria.** For example, they may be adsorbed to other things in the environment, or by exposure to UV radiation. 

**Bacteria entering the lytic cycle instantly die, producing a constant number of phages.** These are both unrealistic assumptions made for the sake of simplicity. The lytic cycle takes time to produce phages and to lyse the cell, and the number of phages produced per bacterium is not constant. The time delay may be modeled using a time-delay differential equation (where the number of bacteria lysing at time t is equal to the number of bacteria entering a lytic cycle at time <img src="https://tex.s2cms.ru/svg/t-(%5Ctext%7Blysis%20time%7D" alt="t-(\text{lysis time}" />.) The number of phages produced per bacterium is modeled as the average burst size. In reality, the number of phages produced likely depends on how many phages can be made before the cell lyses due to lysin (or other lysis-causing protein) production, which depends on how readily bacterial resources can be mobilized. A more accurate approach might be modeling this as a probability distribution, but since this model does not take into account stochastic effects, we would be calculating the number of new phages at each time point using the expected value of the distribution anyway. 

### New Parameters
<img src="https://tex.s2cms.ru/svg/K_a" alt="K_a" />: adsorption constant <img src="https://tex.s2cms.ru/svg/(%5Cfrac%7B1%7D%7B%5Ctext%7Bbacteria%7D%20%5Ccdot%20%5Ctext%7Bphage%7D%7D)" alt="(\frac{1}{\text{bacteria} \cdot \text{phage}})" />

<img src="https://tex.s2cms.ru/svg/D_p" alt="D_p" />: rate of death of free phage (1/hr)

<img src="https://tex.s2cms.ru/svg/%5Cbeta" alt="\beta" />: burst size (phage)

### Composite Variables

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7BI_%7Blyt%7D%7D_%7B%5Ctext%7BNumber%20of%20new%20lytic%20infections%7D%7D%20" alt="\underbrace{I_{lyt}}_{\text{Number of new lytic infections}} " />

How this value is obtained will be explained in the next section.

### Contributions to the Differentials
<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-K_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7BBacteria%20lost%20to%20infection%20due%20to%20phage%20adsorptions%2C%20component%20of%20%7D%5Cfrac%7BdU%7D%7Bdt%7D%7D" alt="\underbrace{-K_a \cdot P \cdot U}_{\text{Bacteria lost to infection due to phage adsorptions, component of }\frac{dU}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-K_a%20%5Ccdot%20P%20%5Ccdot%20(U%2BL)%7D_%7B%5Ctext%7BLoss%20of%20free%20phage%20due%20to%20adsorption%2C%20component%20of%20%7D%5Cfrac%7BdP%7D%7Bdt%7D%7D" alt="\underbrace{-K_a \cdot P \cdot (U+L)}_{\text{Loss of free phage due to adsorption, component of }\frac{dP}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-D_p%20%5Ccdot%20P%7D_%7B%5Ctext%7BFree%20phage%20deaths%2C%20component%20of%20%7D%5Cfrac%7BdP%7D%7Bdt%7D%7D" alt="\underbrace{-D_p \cdot P}_{\text{Free phage deaths, component of }\frac{dP}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B%2B%5Cbeta%20%5Ccdot%20I_%7Blyt%7D%7D_%7B%5Ctext%7BFree%20phages%20released%20from%20lytic%20cycle%20choice%2C%20component%20of%20%7D%5Cfrac%7BdP%7D%7Bdt%7D%7D%7D" alt="\underbrace{+\beta \cdot I_{lyt}}_{\text{Free phages released from lytic cycle choice, component of }\frac{dP}{dt}}}" />


## **Adding Temperate Dynamics**

### Assumptions 
**Upon infecting an uninfected bacterium, phages choose between lysis and lysogeny**. There is evidence to suggest that this is true; this choice can be modeled in several ways described later. However, as a simple model, one could model this as a constant probability of lysogeny upon infection.

**Upon infection by a phage choosing lysogeny, an infected bacterium becomes a lysogen.**

**Phages may adsorb to lysogens at a similar rate compared to uninfected bacteria, but phage adsorptions to lysogens do not lead to lysis.** This assumption may be realistic for some kinds of superinfection inhibition, but not others. In phage <img src="https://tex.s2cms.ru/svg/%5Clambda" alt="\lambda" />, the mechanism of superinfection inhibition is the binding of a repressor protein (associated with lysogeny) to the virulence-controlling operator. Therefore, phages may freely enter the cell, but the lysogenic state will be retained (as the repressor proteins will already exist inside of a lysogenic bacterium). However, in some other phages, superinfection resistance may be due to removing receptors allowing for other phages to enter, which would lead to different mechanics. 

**Lysogens may spontaneously induce a lytic cycle.** Most literature shows that lysogens have a low spontaneous induction rate, which may be incorporated into a simple model. However, it has also been shown that induction rates decrease during starvation and increase due to DNA damage, which may be incorporated at a later point. 

### New Parameters

<img src="https://tex.s2cms.ru/svg/%5Cphi" alt="\phi" />: probability of lysogeny upon infection (unitless)

<img src="https://tex.s2cms.ru/svg/r" alt="r" />: induction rate (unitless)

### Composite Variables
<img src="https://tex.s2cms.ru/svg/I_%7BLyso%7D%20%3D%20%5Cunderbrace%7B%5Cphi%20%5Ccdot%20K_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7Bnew%20infections%20choosing%20lysogeny%7D%7D%20%5C%5C%20%5C%5C%0AI_%7BLyt%7D%20%3D%20%5Cunderbrace%7B(1-%5Cphi)%20%5Ccdot%20K_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7Bnew%20infections%20choosing%20lytic%20cycle%7D%7D" alt="I_{Lyso} = \underbrace{\phi \cdot K_a \cdot P \cdot U}_{\text{new infections choosing lysogeny}} \\ \\
I_{Lyt} = \underbrace{(1-\phi) \cdot K_a \cdot P \cdot U}_{\text{new infections choosing lytic cycle}}" />

### Contributions to the Differentials
<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B%2BI_%7BLyso%7D%7D_%7B%5Ctext%7Bnew%20infections%20choosing%20lysogeny%2C%20component%20of%20%7D%5Cfrac%7BdL%7D%7Bdt%7D%7D" alt="\underbrace{+I_{Lyso}}_{\text{new infections choosing lysogeny, component of }\frac{dL}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-rL%7D%7D_%7B%5Ctext%7Blysogen%20loss%20to%20induction%2C%20component%20of%20%7D%5Cfrac%7BdL%7D%7Bdt%7D%7D" alt="\underbrace{-rL}}_{\text{lysogen loss to induction, component of }\frac{dL}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B%2B%5Cbeta%20(rL%20%2B%20I_%7Blyt%7D)%7D_%7B%5Ctext%7Brelease%20of%20free%20phage%20due%20to%20lytic%20cycle%20(induction%20%2B%20initial%20choice)%2C%20component%20of%20%7D%5Cfrac%7BdP%7D%7Bdt%7D%7D" alt="\underbrace{+\beta (rL + I_{lyt})}_{\text{release of free phage due to lytic cycle (induction + initial choice), component of }\frac{dP}{dt}}" />


## **Ecosystem Maintenance**

### Assumptions
**The ecosystem is maintained by a constant infusion of resources.** In some cases, this might be true (for example, if the rate-limiting resource is energy obtained from sunlight). This is a fairly simple assumption that may be realistic. 

**Each free component of the ecosystem may be subject to dilution over time.** This has been done in other models to model bacteria growing in a chemostat, but might also be realistic in other ecosystems where dilution may occur (for example, marine ecosystems). 

### New Parameters
<img src="https://tex.s2cms.ru/svg/i" alt="i" />: resource infusion rate (<img src="https://tex.s2cms.ru/svg/%5Cmu%20g" alt="\mu g" />/hr)

<img src="https://tex.s2cms.ru/svg/d" alt="d" />: dilution rate

### Contributions to the Differentials
<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-d%20%5Ccdot%20U%7D_%7B%5Ctext%7Buninfected%20dilution%2C%20component%20of%20%7D%5Cfrac%7BdU%7D%7Bdt%7D%7D" alt="\underbrace{-d \cdot U}_{\text{uninfected dilution, component of }\frac{dU}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-d%20%5Ccdot%20L%7D_%7B%5Ctext%7Blysogen%20dilution%2C%20component%20of%20%7D%5Cfrac%7BdL%7D%7Bdt%7D%7D" alt="\underbrace{-d \cdot L}_{\text{lysogen dilution, component of }\frac{dL}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-d%20%5Ccdot%20P%7D_%7B%5Ctext%7Bphage%20dilution%2C%20component%20of%20%7D%5Cfrac%7BdP%7D%7Bdt%7D%7D" alt="\underbrace{-d \cdot P}_{\text{phage dilution, component of }\frac{dP}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-d%20%5Ccdot%20R%7D_%7B%5Ctext%7Bresource%20dilution%2C%20component%20of%20%7D%5Cfrac%7BdR%7D%7Bdt%7D%7D" alt="\underbrace{-d \cdot R}_{\text{resource dilution, component of }\frac{dR}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B%2B%20i%7D_%7B%5Ctext%7Bresource%20infusion%2C%20component%20of%20%7D%5Cfrac%7BdR%7D%7Bdt%7D%7D" alt="\underbrace{+ i}_{\text{resource infusion, component of }\frac{dR}{dt}}" />

## **Basic Model differentials**
<img src="https://tex.s2cms.ru/svg/%5Cbegin%20%7Baligned*%7D%0Am(R%2C%20H)%20%3D%20%5Cfrac%7BR%7D%7BR%2BH%7D%5C%5C%20%5C%5C%0Aq(R%2C%20%5Ceta)%20%3D%20%5Cfrac%7B1%7D%7BR%5Ceta%2B1%7D%5C%5C%20%5C%5C%0AN_U%20%3D%20%5Cunderbrace%7BV_U%20%5Ccdot%20U%20%5Ccdot%20m(R%2C%20H)%7D_%7B%5Ctext%7BUninfected%20growth%7D%7D%20%5C%5C%20%5C%5C%0AN_L%20%3D%20%20%5Cunderbrace%7BV_L%20%5Ccdot%20L%20%5Ccdot%20m(R%2C%20H)%7D_%7B%5Ctext%7BLysogen%20growth%7D%7D%20%5C%5C%20%5C%5C%0AI_%7BLyso%7D%20%3D%20%5Cunderbrace%7B%5Cphi%20%5Ccdot%20K_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7Bnew%20infections%20choosing%20lysogeny%7D%7D%5C%5C%20%5C%5C%20%0AI_%7Blyt%7D%3D%20%5Cunderbrace%7B(1-%20%5Cphi)%20%5Ccdot%20K_a%20%5Ccdot%20P%20%5Ccdot%20U%7D_%7B%5Ctext%7Bnew%20infections%20choosing%20lytic%20cycle%7D%7D%20%20%5C%5C%20%5C%5C%20%5C%5C%20%0A%5Cfrac%7BdU%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7BN_U%7D_%7B%5Ctext%7BUninfected%20growth%7D%7D%20-%20%5Cunderbrace%7BD_b%20%5Ccdot%20U%20%5Ccdot%20q(R%2C%20%5Cbeta)%7D_%7B%5Ctext%7BUninfected%20bacterial%20deaths%7D%7D%20-%20%5Cunderbrace%7BK_a%20%5Ccdot%20P%20%5Ccdot%20(U%7D_%7B%5Ctext%7BNew%20phage%20adsorptions%7D%7D%20-%20%5Cunderbrace%7Bd%20%5Ccdot%20U%7D_%7B%5Ctext%7Bdilution%7D%7D%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdL%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7BN_L%7D_%7B%5Ctext%7BLysogen%20growth%7D%7D%2B%20%5Cunderbrace%7BI_%7BLyso%7D%7D_%7B%5Ctext%7BLysogenic%20cycle%20chosen%20upon%20infection%7D%7D%20-%20%5Cunderbrace%7BD_b%20%5Ccdot%20L%20%5Ccdot%20q(R%2C%20%5Cbeta)%7D_%7B%5Ctext%7BLysogen%20deaths%7D%7D%20-%20%5Cunderbrace%7Br%20%5Ccdot%20L%7D_%7B%5Ctext%7BInductions%7D%7D%20-%20%5Cunderbrace%7Bd%20%5Ccdot%20L%7D_%7B%5Ctext%7Bdilution%7D%7D%20%5C%5C%20%5C%5C%0A%5Cfrac%7BdP%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7B%5Cbeta%20%5Ccdot%20r%20%5Ccdot%20L%7D_%7B%5Ctext%7BReleased%20from%20induction%7D%7D%20%2B%20%5Cunderbrace%7B%5Cbeta%20%5Ccdot%20I_%7Blyt%7D%7D_%7B%5Ctext%7BReleased%20from%20lytic%20cycle%20choice%7D%7D%20-%20%5Cunderbrace%7BK_a%20%5Ccdot%20P%20%5Ccdot%20(U%2BL)%7D_%7B%5Ctext%7BLost%20to%20adsorption%7D%7D%20-%20%5Cunderbrace%7BD_p%20%5Ccdot%20P%7D_%7B%5Ctext%7BDestruction%20of%20free%20phage%7D%7D%20-%5Cunderbrace%7Bd%20%5Ccdot%20P%7D_%7B%5Ctext%7Bdilution%7D%7D%5C%5C%20%5C%5C%0A%5Cfrac%7BdR%7D%7Bdt%7D%20%3D%20%5Cunderbrace%7B-e%20%5Ccdot%20(N_U%20%2B%20N_L)%7D_%7B%5Ctext%7BUse%20of%20resource%20to%20grow%20new%20bacteria%7D%7D%20%2B%20%5Cunderbrace%7Bi%7D_%7B%5Ctext%7BInfusion%20of%20new%20resource%7D%7D%20-%20%5Cunderbrace%7Bd%20%5Ccdot%20R%7D_%7B%5Ctext%7Bdilution%7D%7D%20%5C%5C%20%5C%5C%0A%5Cend%20%7Baligned*%7D" alt="\begin {aligned*}
m(R, H) = \frac{R}{R+H}\\ \\
q(R, \eta) = \frac{1}{R\eta+1}\\ \\
N_U = \underbrace{V_U \cdot U \cdot m(R, H)}_{\text{Uninfected growth}} \\ \\
N_L =  \underbrace{V_L \cdot L \cdot m(R, H)}_{\text{Lysogen growth}} \\ \\
I_{Lyso} = \underbrace{\phi \cdot K_a \cdot P \cdot U}_{\text{new infections choosing lysogeny}}\\ \\ 
I_{lyt}= \underbrace{(1- \phi) \cdot K_a \cdot P \cdot U}_{\text{new infections choosing lytic cycle}}  \\ \\ \\ 
\frac{dU}{dt} = \underbrace{N_U}_{\text{Uninfected growth}} - \underbrace{D_b \cdot U \cdot q(R, \beta)}_{\text{Uninfected bacterial deaths}} - \underbrace{K_a \cdot P \cdot (U}_{\text{New phage adsorptions}} - \underbrace{d \cdot U}_{\text{dilution}} \\ \\
\frac{dL}{dt} = \underbrace{N_L}_{\text{Lysogen growth}}+ \underbrace{I_{Lyso}}_{\text{Lysogenic cycle chosen upon infection}} - \underbrace{D_b \cdot L \cdot q(R, \beta)}_{\text{Lysogen deaths}} - \underbrace{r \cdot L}_{\text{Inductions}} - \underbrace{d \cdot L}_{\text{dilution}} \\ \\
\frac{dP}{dt} = \underbrace{\beta \cdot r \cdot L}_{\text{Released from induction}} + \underbrace{\beta \cdot I_{lyt}}_{\text{Released from lytic cycle choice}} - \underbrace{K_a \cdot P \cdot (U+L)}_{\text{Lost to adsorption}} - \underbrace{D_p \cdot P}_{\text{Destruction of free phage}} -\underbrace{d \cdot P}_{\text{dilution}}\\ \\
\frac{dR}{dt} = \underbrace{-e \cdot (N_U + N_L)}_{\text{Use of resource to grow new bacteria}} + \underbrace{i}_{\text{Infusion of new resource}} - \underbrace{d \cdot R}_{\text{dilution}} \\ \\
\end {aligned*}" />

# **Adaptively Changing the Probability of Lysogeny**
## **Multiplicity of Infection**

### Assumptions
**The probability of lysogeny in phage <img src="https://tex.s2cms.ru/svg/%5Clambda" alt="\lambda" /> is known to increase when the bacterium is infected by multiple phages at once.** One reasonable assumption to model this is that the number of phages infecting a bacterium is Poisson distributed with mean equal to <img src="https://tex.s2cms.ru/svg/K_a%20%5Ccdot%20P" alt="K_a \cdot P" />. This way, the interpretation of the Poisson distribution 
is the probability that one given bacteria will be infected with N coinfecting phages. 



### Reworked Composite Variables/Functions

<img src="https://tex.s2cms.ru/svg/%5Cpi(N)" alt="\pi(N)" />: The probability of lysogeny as a function of the number of coinfecting phages. 

<img src="https://tex.s2cms.ru/svg/p(%5Clambda%2C%20N)%20%3D%20%5Cunderbrace%7B%5Cfrac%7B%7Be%5E%7B%20-%20%5Clambda%20%7D%20%5Clambda%20%5EN%7D%7D%7B%7BN!%7D%7D%7D_%7B%5Ctext%7Bpdf%20of%20Poisson%20distribution%7D%7D" alt="p(\lambda, N) = \underbrace{\frac{{e^{ - \lambda } \lambda ^N}}{{N!}}}_{\text{pdf of Poisson distribution}}" />

<img src="https://tex.s2cms.ru/svg/%5Clambda%20%3D%20%5Cunderbrace%7BK_a%20%5Ccdot%20P%7D_%7B%5Ctext%7Bmean%20of%20the%20Poisson%20distribution%7D%7D" alt="\lambda = \underbrace{K_a \cdot P}_{\text{mean of the Poisson distribution}}" />

<img src="https://tex.s2cms.ru/svg/%5Cphi%20%3D%20%5Cunderbrace%7B%5Cfrac%7B%5Csum_%7BN%3D1%7D%5E%7B%5Cinfty%7D%7Bp(%5Clambda%2C%20N)%20%5Ccdot%20%5Cpi(N)%7D%7D%7B%5Csum_%7BN%3D1%7D%5E%7B%5Cinfty%7Dp(%5Clambda%2C%20N)%20%7D%7D_%7B%5Ctext%7Bprobability%20of%20lysogeny%20given%20infection%7D%7D" alt="\phi = \underbrace{\frac{\sum_{N=1}^{\infty}{p(\lambda, N) \cdot \pi(N)}}{\sum_{N=1}^{\infty}p(\lambda, N) }}_{\text{probability of lysogeny given infection}}" />

which is equivalent to 

<img src="https://tex.s2cms.ru/svg/%5Cphi%20%3D%20%5Cunderbrace%7B%5Cfrac%7B%5Csum_%7BN%3D1%7D%5E%7B%5Cinfty%7D%7Bp(%5Clambda%2C%20N)%20%5Ccdot%20%5Cpi(N)%7D%7D%7B1-p(%5Clambda%2C%200)%7D%7D_%7B%5Ctext%7Bprobability%20of%20lysogeny%20given%20infection%7D%7D" alt="\phi = \underbrace{\frac{\sum_{N=1}^{\infty}{p(\lambda, N) \cdot \pi(N)}}{1-p(\lambda, 0)}}_{\text{probability of lysogeny given infection}}" />

The derivation of <img src="https://tex.s2cms.ru/svg/I_%7BLyso%7D" alt="I_{Lyso}" /> is not immediately obvious. As stated before, the Poisson term calculates the probability that one given bacterium will be infected with N coinfecting phages. Then, <img src="https://tex.s2cms.ru/svg/%5Cphi" alt="\phi" /> may be calculated as the weighted average of <img src="https://tex.s2cms.ru/svg/%5Cpi(N)" alt="\pi(N)" />, with the weights being the probability that an infected bacterium will be infected by N coinfecting phages.

The Poisson distribution theoretically allows for any number of coinfecting phages, but the impact of larger numbers of coinfecting phages becomes vanishingly small and may be ignored. (In practice, we calculate each summation term up to N=5, then calculate the probability that N > 5 and use that as a final term in the summation). The calculation of <img src="https://tex.s2cms.ru/svg/I_%7Blyt%7D" alt="I_{lyt}" /> follows analogous reasoning.

This new <img src="https://tex.s2cms.ru/svg/%5Cphi" alt="\phi" /> can be used in place of the original parameter <img src="https://tex.s2cms.ru/svg/%5Cphi" alt="\phi" /> in the basic model.

## **Quorum Sensing**

A quorum-sensing system (the arbitrium system) has been found to increase the probability of lysogeny in phages using this system in the presence of the arbitrium peptide. 

### New State Variable
<img src="https://tex.s2cms.ru/svg/A" alt="A" />: the extracellular concentration of the quorum-sensing peptide

### Assumptions
**The probability of lysogeny is a monotonically increasing function of arbitrium concentration, and is bounded between 0 and 1.** Binding of the arbitrium receptor leads to the downregulation of an operator favoring lytic activity, so from a biological standpoint, it seems unlikely that increasing arbitrium would actually decrease lysogenic activity at any point. A convenient function here might be yet another Monod-type function for simplicity, as the exact functional form of the system is not yet known. 

**There is a baseline probability of lysogeny independent of arbitrium concentration.** This is supported by the paper. This lends itself to a functional form equal to a constant baseline, plus some monotonically increasing function of arbitrium (due to the activation of the arbitrium system).

**Each cell produces a constant number of arbitrium peptides upon lysogenic infection.** The peptides are produced upon lysogenic infection, but the number is not constant. Similarly to the burst size, we will assume that each cell produces the average number of peptides.  

**The arbitrium peptides have a constant rate of degradation.** Peptide degradation may occur at a high or low rate, but it is likely that many factors that might cause phage degradation may also contribute to peptide degradation.

### New Parameters
<img src="https://tex.s2cms.ru/svg/%5Cphi_0" alt="\phi_0" />: Baseline probability of lysogeny given 0 arbitrium.

<img src="https://tex.s2cms.ru/svg/H_a" alt="H_a" />: Arbitrium concentration resulting in half-maximal increase in probability of lysogeny due to arbitrium system

<img src="https://tex.s2cms.ru/svg/n_a" alt="n_a" />: Number of arbitrium peptides released per lysogenic infection

<img src="https://tex.s2cms.ru/svg/D_a" alt="D_a" />: rate of arbitrium degradation

### Reworked Composite Functions/Variables
<img src="https://tex.s2cms.ru/svg/f(A)%3D%20%5Cunderbrace%7B%5Cfrac%7BA%7D%7BH_a%2BA%7D%7D_%7B%5Ctext%7Bproportion%20of%20maximal%20arbitrium%20system%20activation%7D%7D" alt="f(A)= \underbrace{\frac{A}{H_a+A}}_{\text{proportion of maximal arbitrium system activation}}" />

<img src="https://tex.s2cms.ru/svg/%20%5Cphi%20%3D%20%5Cunderbrace%7B%5Cphi_0%20%2B%20f(A)%20%5Ccdot%20(1-%5Cphi_0)%7D_%7B%5Ctext%7Bsum%20of%20lysogeny%20due%20to%20baseline%20and%20arbitrium%7D%7D" alt=" \phi = \underbrace{\phi_0 + f(A) \cdot (1-\phi_0)}_{\text{sum of lysogeny due to baseline and arbitrium}}" />

To ensure that <img src="https://tex.s2cms.ru/svg/%5Cphi" alt="\phi" /> remained between 0 and 1, the maximal increase in probability of lysogeny due to the arbitrium system was assumed to be <img src="https://tex.s2cms.ru/svg/1-%5Cphi_0" alt="1-\phi_0" /> (thus, as <img src="https://tex.s2cms.ru/svg/A%20%5Crightarrow%20%5Cinfty%2C%20%5Cphi%20%5Crightarrow%201" alt="A \rightarrow \infty, \phi \rightarrow 1" />), for any baseline probability between 0 and 1. 

This value of <img src="https://tex.s2cms.ru/svg/%5Cphi" alt="\phi" /> may be used in place of the constant <img src="https://tex.s2cms.ru/svg/%5Cphi" alt="\phi" /> in the basic model.

### Contributions to the Differentials
<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7Bn_a%20%5Ccdot%20I_%7Blyso%7D%7D_%7B%5Ctext%7Bnumber%20of%20new%20arbitrium%20copies%2C%20component%20of%20%7D%5Cfrac%7BdA%7D%7Bdt%7D%7D" alt="\underbrace{n_a \cdot I_{lyso}}_{\text{number of new arbitrium copies, component of }\frac{dA}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-D_a%20%5Ccdot%20A%7D_%7B%5Ctext%7Barbitrium%20degradation%2C%20component%20of%20%7D%5Cfrac%7BdA%7D%7Bdt%7D%7D" alt="\underbrace{-D_a \cdot A}_{\text{arbitrium degradation, component of }\frac{dA}{dt}}" />

<img src="https://tex.s2cms.ru/svg/%5Cunderbrace%7B-d%20%5Ccdot%20A%7D_%7B%5Ctext%7Barbitrium%20dilution%2C%20component%20of%20%7D%5Cfrac%7BdA%7D%7Bdt%7D%7D" alt="\underbrace{-d \cdot A}_{\text{arbitrium dilution, component of }\frac{dA}{dt}}" />


