# import pandas as pd

# # read the data from csv file
# data = pd.read_csv("Book1.csv")
# print(data)


# def prob(list, target, cla):
#     ans = 1
#     for i in range(len(list)):
#         column_name = data.columns[i]
#         newdata = data.loc[(data[column_name] == list[i])]
#         count = newdata.loc[newdata["stolen"] == target].count()
#         ans = ans*(int(count[0])/cla)
#     return ans


# # decide car is stolen or not
# def getlabel(p1, p2):
#     if p1 < p2:
#         return f"{p1} < {p2}\nCar is Stolen : No"
#     else:
#         return f"{p1} > {p2}\nCar is Stolen : Yes"

# # # C1 = {yes}
# # # C2 = {no}
# # # print("C1 :", C1, "C2 :",C2, "Total :", total)

# # count the total values of yes and no
# stolen = data.value_counts(subset = "stolen")
# total = data["stolen"].count()

# yes = stolen[1]
# no = stolen[0]

# print(f"\nC1={yes}, C2={no}, Total={total}")

# # probability
# pc1 = yes/total
# pc2 = no/total

# pxc1 = prob(["red", 'suv', 'domestic'], "yes", yes)*pc1
# pxc2 = prob(["red", 'suv', 'domestic'], "no", no)*pc2
# print(getlabel(pxc1, pxc2))


import pandas as pd

data = pd.read_csv("Book1.csv") 
print(data) 

# prob function
def prob(list, target, cla):
    ans = 1
    for i in range(len(list)):
        col_name = data.columns[i]
        newdata = data.loc[(data[col_name] == list[i])]
        count = newdata.loc[newdata["stolen"] == target].count()
        ans = ans*(int(count[0])/cla)
    return ans


#compare function
def getAns(pc1, pc2):
    if pc1 < pc2:
        return f"{pc1} < {pc2} \nStolen car = No"
    else:
        return f"{pc1} > {pc2} \nStolen car = Yes"



#count the no. of yes and no' s
stolen = data.value_counts(subset = "stolen")
total = data["stolen"].count()

# no of yes and no
yes = stolen[1]
no = stolen[0]


print(f"\nC1 = {yes}, C2 = {no}, Total = {total}")

# calculate the probability of yes and no
pc1 = yes/total
pc2 = no/total

print("\nProbability of Yes And No")
print(f"Yes = {pc1}, No = {pc2}")

pcx1 = prob(["red", 'suv', 'domestic'], "yes", yes)*pc1
pcx2 = prob(["red", 'suv', 'domestic'], "no", no)*pc2


print(getAns(pcx1, pcx2))
