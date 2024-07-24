# README

## Instructions for Setting Up MySQL with Docker-Compose

### Prerequisites

- Docker installed on your machine.
- Docker Compose installed on your machine.

### Steps

1. **Create a Docker Compose File**

   Create a `docker-compose.yml` file with the following content:

   ```yaml
   version: '3.8'

   services:
     mysql:
       image: mysql:latest
       container_name: mysql
       restart: always
       environment:
         MYSQL_ROOT_PASSWORD: root_password
         MYSQL_DATABASE: example_db
         MYSQL_USER: user
         MYSQL_PASSWORD: user_password
       volumes:
         - mysql-data:/var/lib/mysql
       ports:
         - "3306:3306"

     adminer:
       image: adminer:latest
       container_name: adminer
       restart: always
       ports:
         - "8080:8080"
       environment:
         ADMINER_DEFAULT_SERVER: mysql

   volumes:
     mysql-data:
       driver: local
   ```

2. **Start the Containers**

   Open a terminal and navigate to the directory where your `docker-compose.yml` file is located. Run the following command to start the MySQL and Adminer containers:

   ```sh
   docker-compose up -d
   ```

3. **Access Adminer**

   After the containers have started, you can access Adminer, a web-based database management tool, by opening your web browser and navigating to `http://localhost:8080`.

4. **Connect to MySQL using Adminer**

   In the Adminer login page, use the following credentials to connect to your MySQL database:

   - **System:** MySQL
   - **Server:** mysql
   - **Username:** user
   - **Password:** user_password
   - **Database:** example_db

5. **Running SQL Scripts**

   You can now run your SQL scripts to create tables, insert data, and perform queries. Use the SQL commands provided in your assignment.

### Assignment Instructions

1. **Create Tables and Insert Data**

   Follow the SQL scripts provided in the assignment to create the necessary tables and insert the data.

   Example:

   ```sql
   CREATE DATABASE IF NOT EXISTS Worker;

   USE Worker;

   CREATE TABLE Department (
       DepartmentID TINYINT NOT NULL,
       DepartmentNm CHAR(30) NOT NULL,
       PRIMARY KEY (DepartmentID)
   );

   INSERT INTO Department (DepartmentID, DepartmentNm) VALUES
   (1, 'Research & Development'),
   (2, 'Production'),
   (3, 'IT Support'),
   (4, 'Operations'),
   (5, 'Customer Service'),
   (6, 'Purchasing'),
   (7, 'Sales & Marketing'),
   (8, 'Human Resource Management'),
   (9, 'Accounting and Finance'),
   (10, 'Legal Department');

   SELECT * FROM Department ORDER BY DepartmentID;
   ```

2. **Take Screenshots**

   Execute the queries as specified in your assignment using either Adminer, MySQL Workbench, or the MySQL client terminal. Take screenshots of the complete set of rows and columns as required.

   Example command for running a query:

   ```sql
   SELECT * FROM Department ORDER BY DepartmentID;
   ```

3. **Save and Submit**

   Save the screenshots and include them in your assignment submission as specified by your instructor.

### Important Notes

- All table definitions (DDL), data display, and queries should be done using SQL. Avoid using graphical tools for table definitions and data display.
- Ensure that your SQL scripts are accurate and follow the structure provided in the assignment.
- Do not make any updates to the data once it has been loaded into the tables. If you encounter any issues, you may empty the tables and reload the data.

### Stopping the Containers

Once you have completed the assignment, you can stop the containers by running:

```sh
docker-compose down
```

This will stop and remove the containers but keep the data in the volume `mysql-data` intact. If you want to remove the data as well, you can remove the volume by running:

```sh
docker-compose down -v
```

This will remove all containers and volumes defined in the `docker-compose.yml` file.

---

By following these instructions, you should be able to set up a MySQL environment using Docker Compose, perform the necessary SQL operations for your assignment, and take the required screenshots for submission. If you encounter any issues or have any questions, feel free to reach out to me by generating a PR and I'll check it out(PR should contain your doubt so that I can answer on it).
