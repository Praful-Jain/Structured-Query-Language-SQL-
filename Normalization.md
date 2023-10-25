# Normalization

### Data Redundancy 
- When same data is stored multiple times unnecessarily in a database, it is called data redundancy.
- Disadvantages of redundancy:
  1. Insertion, deletion, and modification anomalies.
  2. Data inconsistency.
  3. Increase in database size and increase in execution time.
 
### Insertion, deletion, and modification anomalies
- Insertion anomalies: when certain data or attributes cannot be inserted into a database without the presence of other data.
- Deletion anomalies: If we delete some unwanted data, it causes the deletion of some other useful data as well.
- Modification anomalies: When we want to update a single piece of data, but it must be done for all of its copies.

### Normalization
- As one paragraph contains a single idea, similarly, one table must contain direct and main data about an entity.
- Normalization is a process of decomposing tables into multiple sub-tables, and it is done on the basis of functional dependencies.
- Normalization is done in order to reduce data redundancy.
- Normal Forms:
  1. First normal form (1NF)
  2. Second normal form (2NF)
  3. Third normal form (3NF)
  4. Boyee Codd normal form (BCNF)

  #### 1. First normal form (1NF)
  - A table is said to be in first normal form if every cell of the table contains an atomic value.
  - The order of columns and rows is insignificant.
  - In every column, all the values must belong to the same domain.
  - Every column should have a unique name.
  
  #### 2. Second normal form (2NF)
  - A table is said to be in 2NF if it is in 1NF, and it must be independent of partial dependency.
  - Candidate key: A candidate key is a field that uniquely identifies each record in the table. The primary key is selected from the set of candidate keys by the data administrator.
  - Prime attribute: An attribute is said to be prime if it is present in atleast any one of the candidate keys of the database.
  - Non-prime attribute: Those attributes that are not part of any candidate key are called non-prime attributes.
  - Partial Dependency: When a non-prime attribute, instead of depending on the entire candidate key, depends on a part of the candidate key, this is called partial dependency. i.e,  α -> β where α ∈ Prime, β ∈ Non-prime
  - To remove partial dependency, decompose the table into two or more tables such that they do not contain any partial dependency.

  #### 3. Third normal form (3NF).
  - A table is said to be in 3NF if it is in 2NF, and it must be independent of transitive dependency.
  - Transitive Dependency:  When we can derive a non-prime attribute from another non-prime attribute, then it is called transitive dependency. i.e,  α -> β, where α and β are non-prime.
  - To remove transitive dependency, decompose the table into two or more tables such that they do not contain any transitive dendency.
  
  #### 4. Boyee Codd normal form (BCNF)
  - BCNF is the advanced version of 3NF. It is stricter than 3NF.
  - A table is in BCNF if, in every functional dependency α -> β, α is the super key of the table.
  - Super key: A super key is any combination of fields within a table that uniquely identifies each record or row within that table.
