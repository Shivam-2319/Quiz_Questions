## Question 2 Plotting a group of lines

The standard input file is q2_data.tsv which when using linux command ```cat q2_data.tsv|head``` will give you an outlook of the data:<br>
```
-1118	1.27553239271999	Cl1
-1117	1.27696343296042	Cl1
-1116	1.27829211888462	Cl1
-1115	1.27953030556019	Cl1
-1114	1.28067189848055	Cl1
-1113	1.28170721322425	Cl1
-1112	1.28264434797129	Cl1
-1111	1.28348705960928	Cl1
-1110	1.28422232426115	Cl1
-1109	1.28485247954583	Cl1
```
The main aim is to plot the x and y values for different categories in the 3rd column using ggplot. The working of the code is simple we first read the standard input file and assign column names to them<br>
While using ggplot in the aes argument with x and y axis color was set to the third column , and rest of the labels and output file were given are arguments to the code

To obtain the desired plot:

```
cat q2_data.tsv |Rscript q2_code.r "different_clusters.png" "Relative from center [bp]" "Enrichment over Mean" "MNase fragment profile"
```

## Quiz Question 3
This objective of this code is to generalize the merging of multiple files on the first column values, all you have to do it to change the file names in the data/list_q3.tsv file<br>

In this example there are 2 files to be merged ,path to these files are stored in data/list_q3.tsv<br>

To see the contents of data/list_q3.tsv use ``` cat data/list_q3.tsv``` and you will see this output:<br>

data/q3_first.tsv<br>
data/q3_second.tsv<br>

To have a small glimpse at the individual files use ```head data/q3_first.tsv``` and ```head data/q3_second.tsv```.<br>

To run the code for this particular example we have used output file as join_output.tsv but you can write the desired output name.<br>

``` 
Rscript join_list_of_files.R data/list_q3.tsv > join_output.tsv
```

A little detail about the code , for initializing we have taken the 1st file and stored in the merged_data . Since the files have no column names , col_names have been set to false and default 'V1','V2" and so on will be assigned<br>

Now rest of the file list except the first one is iterated using for loop and the current_data is merged with the merged_data using inner_join(function) which takes the two files and by as arguments and later the merged_data was written to a stdout which was stored in join_output.tsv<br>


# Question 4 Quantile distribution

The standard input file is q4_data.tsv which when using linux command ```head q4_data.tsv``` will give you this output:<br>
```
43
25
27
40
2
26
12
95
66
39
```
So the workflow is to cat the input file shown above to our group_in_quantiles.py file which will take the number of quantiles input from the user in the form of argument vector<br>


The code will save the result to a output file "distributed_quantiles.tsv" , in this repo the file "distributed_quantiles.tsv" is the distribution of the input file data into 5 quantiles<br>

code for this file is 

```
cat q4_data.tsv |python3 group_in_quantiles.py 5
```
The python code is structured in such a way that it can take numbers according to user's desire and label the data with quantiles <br>

The logic behind the code is simple , the lines from standard input are read one by one and is stored in a list first and then a pandas dataframe is made out of this list.<br>

Using the ```qcut``` function of pandas we get 2 arrays as output one is the quantiles and other is the edge values of those quantiles.<br>

The quantiles array was made a new column of the same data frame. In the 2nd step the labels were also generalized according to user input using a list comprehension code.<br>

Finally i constructed a dictionary with the quartiles and their respective range, using a for loop this was also generalized because in the edge values list their will always be n+1 values , n being the input by user<br>

Accessing the quantiles column one by one their respective range was stored in a new list since list are ordered. Finally a range column was added to the dataframe with the values from this new list<br>

While saving index and header were set to None recreate the required output
