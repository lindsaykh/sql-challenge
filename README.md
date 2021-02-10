# sql-challenge

The schema and query .sql files in the data folder allow for the creation of a database and tables
and analysis of the data, respectively. csv files that are part of the database are included in the
data folder.

The schema and query files were made in Postgresql. A png file named "ERD" describes the data in the
database and the relationships between tables. 

The schema creates tables and copies data from csv files to put into the tables. The user's Postgresql/PgAdmin
path to the data files must be copied into the COPY code in order to copy the data into the tables. Or, the 
data can be imported via PgAdmin.

*Bonus*
The jupyter notebook titled Bonus analzes salary data from the database. The bonus images folder includes
two pngs generated from the notebook that illustrate a histogram of employee salaries and a bar chart
of average salary by employee title. Discussion of these results are included in the notebook. The users
postgresql password must be entered into the config file in order to run the analysis.