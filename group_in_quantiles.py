import sys
import pandas as pd

nums_comp = sys.argv[1]

data_array = []

for line in sys.stdin:
    data_array.append(int(line))

df = pd.DataFrame(data_array, columns=["value"])

label = [f"q{i}" for i in range(1,int(nums_comp)+1)]

quartiles, bin_edge = pd.qcut(data_array, int(nums_comp), labels=label, retbins=True)

df["quartile"] = quartiles

new_dict = {}
for i in range(len(bin_edge) - 1):
    key = f"q{i + 1}"
    value = [float(bin_edge[i]), float(bin_edge[i + 1])]
    new_dict[key] = value

new_range = []
for i in df["quartile"]:
    key = str(i)
    new_range.append(new_dict[key])

df["range"] = new_range

df.to_csv("distributed_quantiles.tsv", sep="\t", header=None, index=False)
