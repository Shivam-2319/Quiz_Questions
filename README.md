# Question 4 Quantile distribution

The standard input file is q4_data.tsv which when using linux command ```head q4_data.tsv``` will give you this output:<br>
43<br>
25<br>
27<br>
40<br>
2<br>
26<br>
12<br>
95<br>
66<br>
39<br>

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
