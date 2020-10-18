import json

data = {}
for x in range(21, 109):
    #print("We're on time %d" % (x))
    data[x] = '{ "id" :"' +str(21 +((x -21)//3) *3)+ '","pitch" : "'+str(pow(2, (x%3)/12)) +'"}'
    json_data = json.dumps(data)
print(json_data)
