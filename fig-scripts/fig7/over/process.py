import statistics as stat
import pandas as pd


benchmarks = [ "dedup", "bodytrack", "blackscholes", "fluidanimate", "vips", "streamcluster", "barnes", "ocean", "ocean-cp", "radix"]
cases = ["hvm", "pvm", "pload"]

result_bench_case = {}

for bench in benchmarks:
    result_case = {}
    for case in cases:
        name = "result-" + case + "-" + bench
        lines = open(name, 'r').readlines();
        result_case[case] = [float(line) for line in lines]
    result_bench_case[bench] = result_case

print(result_bench_case)
print("\n")

result_normal = {}
for bench in benchmarks:
    result_bench = result_bench_case[bench]

    result_case = {}
    result_case["hvm"] = [ a / b - 1 for (a, b) in zip(result_bench["hvm"], result_bench["pload"]) ]
    result_case["pvm"] = [ a / b - 1 for (a, b) in zip(result_bench["pvm"], result_bench["pload"]) ]
    result_normal[bench] = result_case


print(result_normal)
print("\n")

result_final = {}
for bench in benchmarks:
    result_bench = result_normal[bench]
    result_case = {}
    result_case["HVM-o"], result_case["err2-1"] = stat.mean(result_bench["hvm"]), stat.pstdev(result_bench["hvm"])
    result_case["PVM-o"], result_case["err2-2"] = stat.mean(result_bench["pvm"]), stat.pstdev(result_bench["pvm"])

    result_final[bench] = result_case

print(result_final)
print("\n")

meanCSV = pd.DataFrame(result_final).transpose()
meanCSV.to_csv('final.csv')
