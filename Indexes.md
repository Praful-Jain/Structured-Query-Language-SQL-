# Indexes
- Indexes are used to retrieve data from the database more quickly.
- The users cannot see the indexes, they are just used to speed up searches/queries.
- The CREATE INDEX statement is used to create indexes in tables.
- Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.

## CREATE INDEX Statement

1. To create an index on a table with duplicate values are allowed.
  - Syntax: CREATE INDEX index_name ON table_name (column1, column2, ...);
  - Example: CREATE INDEX idx_lastname ON Persons (LastName);
    
2. To create a unique index on a table with duplicate values not allowed.
  - Syntax: CREATE UNIQUE INDEX index_name ON table_name (column1, column2, ...);
  - Example: CREATE INDEX idx_pname ON Persons (LastName, FirstName); 

## DROP INDEX Statement

- The DROP INDEX statement is used to delete an index in a table.
   - Syntax: ALTER TABLE table_name DROP INDEX index_name; 

   
