#!/usr/bin/python3
import statistics as stat
import pandas as pd


benchmarks = [ "streamcluster", "ocean-ncp" ]
cases = ["hvm", "pvm", "native"]

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

