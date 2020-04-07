from scipy.optimize import curve_fit
# import matplotlib.pyplot as plt

def hill(m, k):
    return m/(m+k) # h set to 1.0

fitted_k, _ = curve_fit(hill, [0,1,2,3,4,5],[0, 0.375, 0.55, 0.65, 0.64, 0.70]) # visually estimated from the figure 2C. The exact values probably don't matter much.

print('Fitted k:' + str(fitted_k))

# Import matplotlib, and use this if you want to visually inspect the fit.
# plt.plot([hill(x, fitted_k) for x in range(10)])
# plt.scatter([0,1,2,3,4,5],[0, 0.32, 0.55, 0.65, 0.64, 0.70])
# plt.show()