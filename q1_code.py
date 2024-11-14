import sys
import pandas as pd

reference_file = sys.argv[1]
arguments = list()

with open(reference_file, 'r') as file:
    for line in file:
        line = line.strip()
        arguments.append(line)

column_header = []

with sys.stdin as reading_file, open(sys.argv[2], "w") as output:
    count = 0
    for line in reading_file:
        line = line.strip()
        items = line.split("\t")
        
        if count == 0:
            column_header = items
        else:
            if any(item in arguments for item in items):
                output.write(line + "\n")
        
        count += 1

df = pd.read_csv(sys.argv[2], sep="\t", header=None)
df.columns = column_header 

df.to_csv(sys.argv[2], index=False, sep="\t")
