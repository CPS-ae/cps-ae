import os
import sys
from collections import defaultdict
import statistics as stat
import pandas as pd

cg4 = defaultdict(list)
cg128 = defaultdict(list)
base4 = defaultdict(list)
base128 = defaultdict(list)

#targetDir = "process_dir"
targetDir = sys.argv[1]

for filename in os.listdir(targetDir):
    if filename.endswith(".txt"):
        path = os.path.join(targetDir, filename)
        #print(path)
        labels = filename.split('_')
        if (labels[4] == 'bg'):
            labels[3] = labels[3] + '_bg'
            labels[4] = labels[5]
            labels[5] = labels[6]
#        if (labels[5] == '1.txt' or labels[5] == '5.txt' or labels[5] == '6.txt'  ):
#        if (labels[5] == '13.txt' or labels[5] == '12.txt' or labels[5] == '11.txt'):
#            continue;
        if (labels[5] == '14.txt' or labels[5] == '13.txt'):
            continue
        print(labels)

        with open(path, 'r') as txtin:
            value = ''
            flag = False
            for line in txtin:
                if flag:
                    value = line.split(' ')[3]
                    print(value)
                    print(float(value))
                    if (value == ''):
                        print("!!!!!!!!", line)
                        print("!!!!!!!!", path)
                    break
                if ('#' in line):
                    flag = True
            if (labels[2] == '4' and labels[4] == 'false'):
                base4[labels[3]].append(value)
            elif (labels[2] == '128' and labels[4] == 'false'):
                base128[labels[3]].append(value)
            elif (labels[2] == '4' and labels[4] == 'true'):
                cg4[labels[3]].append(value)
            elif (labels[2] == '128' and labels[4] == 'true'):
                cg128[labels[3]].append(value)
            # print(base4)

cg128mean = {  }
cg4mean = {}
base128mean = {}
base4mean = {}

print(cg128)
print(base128)
print(cg4)
print(base4)

for item in cg128.items():
    print(item[1])
    value = [float(v) for v in item[1]]
    cg128mean[item[0]] = stat.mean(value)
for item in base128.items():
    value = [float(v) for v in item[1]]
    base128mean[item[0]] = stat.mean(value)
for item in cg4.items():
    value = [float(v) for v in item[1]]
    cg4mean[item[0]] = stat.mean(value)
for item in base4.items():
    value = [float(v) for v in item[1]]
    base4mean[item[0]] = stat.mean(value)


print(cg128mean)
print(base128mean)
print(cg4mean)
print(base4mean)

result128 = {}
result4 = {}
for k in cg128.keys():
    print(k, cg128mean[k], base128mean[k])
    print(k, cg4mean[k], base4mean[k])
    print("====")
    result128[k] = cg128mean[k] / base128mean[k] - 1
    result4[k] = cg4mean[k] / base4mean[k] - 1
print(result128)
print(result4)


result4new = {}
result128new = {}
result4new['DWOM'] = result4['DWOM']
result4new['DWOL'] = result4['DWOL']
result4new['MRDM'] = result4['MRDM']
result4new['MRDL'] = result4['MRDL']
result4new['MRDM_bg'] = result4['MRDM_bg']
result4new['MRDL_bg'] = result4['MRDL_bg']
result128new['DWOM'] = result128['DWOM']
result128new['DWOL'] = result128['DWOL']
result128new['MRDM'] = result128['MRDM']
result128new['MRDL'] = result128['MRDL']
result128new['MRDM_bg'] = result128['MRDM_bg']
result128new['MRDL_bg'] = result128['MRDL_bg']

result = {}
result["4 threads"]=result4new
result["128 threads"]=result128new
benchCSV = pd.DataFrame(result)
benchCSV.to_csv(targetDir + '.csv')
