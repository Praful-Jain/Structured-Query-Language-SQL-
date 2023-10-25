# JOINS
- A join is an operation that combines rows from two or more tables based on a related column between them in a database.
- Joins are used to retrieve data from multiple tables by linking them together using a common key or column.

### Inner Join
- Filters out not-matching rows and returns only the rows that have matching values in both tables.
- Syntax:
      SELECT columns
      FROM table1
      INNER JOIN table2
      ON table1.column = table2.column;

### Left Join
  - A left join returns all the rows from the left table and the matching rows from the right table.
  - If there is no match in the right table, the result will still include the left table's row with NULL values in the right table's columns.
  - Syntax:
      SELECT columns
      FROM table1
      LEFT JOIN table2
      ON table1.column = table2.column;

### Right Join
  - A right join is similar to a left outer join, but it returns all rows from the right table and the matching rows from the left table.
  - If there is no match in the left table, the result will still include the right table's row with NULL values in the left table's columns.
  - Syntax:
      SELECT columns
      FROM table1
      RIGHT JOIN table2
      ON table1.column = table2.column;

### Full Outer Join
  - A full outer join returns all rows from both the left and right tables, including matches and non-matches.
  - If there's no match, NULL values appear in columns from the table where there's nocorresponding value.
  - Syntax:
      SELECT columns
      FROM table1
      FULL OUTER JOIN table2
      ON table1.column = table2.column;


### Cross Join
  - A cross join, also known as a Cartesian product, combines every row from one table with every row from another table.
  - Cross joins can lead to a large result set, especially when the participating tables have many rows.
  - Syntax:
      SELECT columns
      FROM table1
      CROSS JOIN table2;


    
