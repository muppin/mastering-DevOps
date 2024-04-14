## RDS

### what is database?
- Just a system that stores the data and manages it.
- It is divided into two:
   - Relational Database (SQL)
   - Non Relational Database (NoSQL)
- schema: structure in and between tables of data is called schema.

### Relational database schema basics:

A relational database schema is a blueprint or structure that defines how data is organized and stored in a relational database management system (RDBMS). It's like a framework that outlines the tables, columns, relationships, constraints, and other elements that make up the database.

Here's a breakdown of key components typically found in a relational database schema:

1. **Tables**: These are the main containers for storing data. Each table represents an entity (such as customers, products, orders) and consists of rows and columns. 

2. **Columns/Attributes**: Columns represent the characteristics or properties of the entities stored in the table. Each column has a name and a data type (like text, integer, date, etc.), which determines the kind of data it can store.

3. **Rows/Tuples**: Each row in a table represents a single record or instance of the entity. It contains data values corresponding to each column defined in the table schema.

4. **Primary Keys**: A primary key uniquely identifies each row in a table. It ensures that each record can be uniquely identified and helps establish relationships between tables.

5. **Foreign Keys**: Foreign keys establish relationships between tables. They are attributes in one table that refer to the primary key in another table. These keys enforce referential integrity, ensuring that data remains consistent across related tables.

6. **Constraints**: Constraints are rules enforced on the data in the database to maintain data integrity and consistency. Common constraints include primary key constraints, foreign key constraints, unique constraints, and check constraints.

7. **Indexes**: Indexes are structures used to speed up data retrieval operations. They provide quick access to specific rows based on the values of certain columns. Indexes are created on columns frequently used in search conditions.

Relational database schemas are designed using a data modeling technique such as Entity-Relationship (ER) modeling. ER diagrams are graphical representations of the schema, showing tables, columns, relationships, and constraints visually.

Overall, a well-designed relational database schema is crucial for organizing data efficiently, ensuring data integrity, and supporting data retrieval and manipulation operations effectively.

**Explain Foriegn key with an example**

Sure, let's illustrate the concept of a foreign key with an example:

Let's consider a simple relational database schema for managing students and their courses:

1. **Students Table**:
   - Columns: student_id (Primary Key), name, age, grade_level

2. **Courses Table**:
   - Columns: course_id (Primary Key), course_name, instructor

3. **Enrollments Table**:
   - Columns: enrollment_id (Primary Key), student_id (Foreign Key), course_id (Foreign Key)

In this schema:

- The **Students Table** stores information about each student, with the `student_id` column as the primary key.

- The **Courses Table** stores information about each course, with the `course_id` column as the primary key.

- The **Enrollments Table** is a junction table that associates students with the courses they are enrolled in. It contains foreign keys `student_id` and `course_id`, referencing the `student_id` in the Students Table and `course_id` in the Courses Table, respectively.

Here's how the foreign key works with an example:

Let's say we have the following data:

**Students Table:**
```
| student_id | name   | age | grade_level |
|------------|--------|-----|-------------|
| 1          | Alice  | 18  | 12          |
| 2          | Bob    | 19  | 11          |
| 3          | Charlie| 20  | 12          |
```

**Courses Table:**
```
| course_id | course_name | instructor |
|-----------|-------------|------------|
| 101       | Math        | Mr. Smith  |
| 102       | Science     | Ms. Johnson|
| 103       | History     | Mr. Brown  |
```

**Enrollments Table:**
```
| enrollment_id | student_id | course_id |
|---------------|------------|-----------|
| 1             | 1          | 101       |
| 2             | 2          | 102       |
| 3             | 3          | 101       |
| 4             | 1          | 103       |
```

In the Enrollments Table:

- The `student_id` column refers to the `student_id` column in the Students Table. For example, enrollment_id 1 has student_id 1, which corresponds to Alice in the Students Table.

- Similarly, the `course_id` column refers to the `course_id` column in the Courses Table. For example, enrollment_id 2 has course_id 102, which corresponds to the Science course in the Courses Table.

By using foreign keys, we establish a relationship between the Enrollments Table and the Students/Courses Tables, ensuring that only valid student and course combinations can be stored in the Enrollments Table. This helps maintain data integrity and consistency in the database.

### Databases on ec2 instances

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/4afaa22d-1ec1-47c8-a07f-f6b330953f00)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c9954ae7-6e32-40cc-a75d-9ca522cbc5dc)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/9b14d665-0790-4f60-998d-a820513570d5)

### Relational Database Service 

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/f1bf36f7-6f35-46b1-a803-aabca80f9c85)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/58cc645a-56da-4639-8e02-f6eb0ba7fb0e)





