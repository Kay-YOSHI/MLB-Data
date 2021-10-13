# MLB Data Acquisition

This repository contains R code for collecting the data on Major League Baseball (MLB), 
the Statcast pitch-by-pitch data on all regular season games for 2015-2019.
To collect the data, I utilize the R package "mlbr" (https://github.com/pontsuyu/mlbr). 
This is quite useful package to collect the MLB data. 
All you need is to specify the start and end date.

The file "Variable Definition.xlsx" contains the list of variables collected by "mlbr". 
It also includes each variable's definition 
based on the official documentation (https://baseballsavant.mlb.com/csv-docs) and 
the book "*Analyzing Baseball Data with R (2nd ed.)*" written by March, M., Albert, J. and Baumer, B. S. (2018).

To clarify the correspondence between zone No. and its location, 
I visualized the variable "zone" in the file "Zone.jpeg". 
The file "Data_Acquisition.R" also contains the R code for producing the figure.

## References

Marchi, M., Albert, J. and Baumer, B. S.: "Analyzing Baseball Data with R (2nd ed.)," Chapman and Hall/CRC (2018)
