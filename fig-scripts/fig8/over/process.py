#!/usr/bin/python3
import statistics as stat
import pandas as pd


benchmarks = [ "ocean-cp" ]
cases = ["hvm", "pvm", "pload"]

result_bench_case = {}

for bench in benchmarks:
    result_case = {}
    result_case["#threads"] = [4, 8, 16, 32, 64 ,128]
    for case in cases:
        name = "result-" + case + "-" + bench
        lines = open(name, 'r').readlines();
        result_case[case] = [float(line) for line in lines]
    print(result_case)
    benchCSV = pd.DataFrame(result_case)
    benchCSV.to_csv(bench + '_4_to_128.csv', index=False)

#print(result_bench_case)
#print("\n")
#
#result_normal = {}
#for bench in benchmarks:
#    result_bench = result_bench_case[bench]
#
#    result_case = {}
#    result_case["hvm"] = [ a / b - 1 for (a, b) in zip(result_bench["hvm"], result_bench["pload"]) ]
#    result_case["pvm"] = [ a / b - 1 for (a, b) in zip(result_bench["pvm"], result_bench["pload"]) ]
#    result_normal[bench] = result_case
#
#
#print(result_normal)
#print("\n")
#
#result_final = {}
#for bench in benchmarks:
#    result_bench = result_normal[bench]
#    result_case = {}
#    result_case["hvm-mean"], result_case["hvm-std"] = stat.mean(result_bench["hvm"]), stat.pstdev(result_bench["hvm"])
#    result_case["pvm-mean"], result_case["pvm-std"] = stat.mean(result_bench["pvm"]), stat.pstdev(result_bench["pvm"])
#
#    result_final[bench] = result_case
#
#print(result_final)
#print("\n")
#
#meanCSV = pd.DataFrame(result_final).transpose()
#meanCSV.to_csv('final.csv')
