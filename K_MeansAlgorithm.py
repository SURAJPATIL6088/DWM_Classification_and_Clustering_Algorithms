# ## Steps to follow for k-means algorithm
# 
#  1. create the dataset ( input from user )
#  2. take input mean values
#  3. again create two lists and add the values correspong
#  4. jab tak while true ho tab tak
#  5. if value near to list 1 then add in k1 (In looop only)
#  6. if value near to list 2 then add in k2 (In looop only)
#  7. calculate the mean of lists  (In looop only)
#  8. print the lists 
#  9. check values are equal or not
#  10.if equal then print the final clusters
# 
# ##
print("K-means Algorithm")

#create the the dataset of the list
dataset = list()
n = int(input("Enter the Length of the dataset : "))

for i in range(0, n):
    e = int(input("Enter the Values in Dataset : "))
    dataset.append(e)

print("Given Dataset : ",dataset)

# in this we have two clusters then select the mean values
m1 = int(input("Enter the Mean 1 : "))
m2 = int(input("Enter the Mean 2 : "))

# create two clusters
k1 = list()
k2 = list()

while True:
    n1 = m1
    n2 = m2

    k1.clear()
    k2.clear()
    p = q = 0

    for i in range(len(dataset)):
        v1 = m1 - dataset[i]
        v2 = m2 - dataset[i]

        if(abs(v1) <= abs(v2)):
            k1.append(dataset[i])
        else:
            k2.append(dataset[i])
     
    # for calculate the mean 1   
    for i in range(len(k1)):
        p = p + k1[i]
        m1 = p/len(k1)
    
    # for calculate the mean 2
    for i in range(len(k2)):
        q = q + k2[i]
        m2 = q/len(k2)
    
    print("k1 : ", k1, "| m1 : ", m1)
    print("k2 : ", k2, "| m2 : ", m2)

    print(" ")

    if m1 == n1 and m2 == n2:
        print("Clusters Created : ")
        print("Cluster 1 : ", k1)
        print("Cluster 2 : ", k2)
        break
