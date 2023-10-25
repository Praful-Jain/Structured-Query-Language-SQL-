# Aggregation Functions
- These are used to perform calculations on groups of data.
- Common Aggregate Functions:
  - COUNT():
  Counts the number of rows in a group or result set.
  - SUM():
  Calculates the sum of numeric values in a group or result set.
  - AVG():
  Computes the average of numeric values in a group or result set.
  - MAX():
  Finds the maximum value in a group or result set.
  - MIN():
  Retrieves the minimum value in a group or result set.
- Aggregation functions (e.g., COUNT, SUM, AVG, MAX, MIN) are often used with GROUP BY to calculate values for each group.
- Example: SELECT department, AVG(salary) FROM employees GROUP BY department;

 # Filters
 
 ### 1. WHERE:
 - The WHERE clause is used to filter records.
 - Syntax: SELECT column1, column2, ... FROM table_name WHERE condition;
 - Ex: SELECT * FROM Customers WHERE Country='Mexico';
 - Operators used in WHERE are:
   1.   = : Equal
   2.   < : Less than
   3.   \> : Greater than
   4.   \>= : Greater than or equal
   5.   <= : Less than or equal
   6.   <> or != : Not equal.

  ### 2. IN:
  - Filters results based on a list of values in the WHERE clause.
  - Example: SELECT * FROM products WHERE category_id IN (1, 2, 3);

  ### 3. BETWEEN:
  - Filters results within a specified range in the WHERE clause.
  - Example: SELECT * FROM orders WHERE order_date BETWEEN '2023-01-01' AND '2023-06-30';

  ### 4. HAVING Clause:
  - The HAVING clause is used with GROUP BY to filter groups based on aggregate function results.
  - It's similar to the WHERE clause but operates on grouped data.
  - Example: SELECT department, AVG(salary) FROM employees GROUP BY department HAVING AVG(salary) > 50000;




