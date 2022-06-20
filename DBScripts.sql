-- Creating a db instance named Craneware for the assessment
CREATE DATABASE Craneware;

-- Creating a table for employees and their basic information like first name, last name, email, hire date and salary
CREATE TABLE employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	hire_date DATE NOT NULL,
	salary DECIMAL (8, 2) NOT NULL
);

-- Creating a table for employee contact information like address, city, state, country and zipcode. 
-- Here employee id is the foreign key reference on employees table
CREATE TABLE employeecontact (
	contact_id INT IDENTITY(1,1) PRIMARY KEY,
	addressline1 VARCHAR (50) NOT NULL,
	addressline2 VARCHAR (50) NOT NULL,
	city VARCHAR (50) NOT NULL,
	state VARCHAR (50) NOT NULL,
	country VARCHAR (50) NOT NULL,
	zipcode DECIMAL (5, 0) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Sample data insert queries for employees
INSERT INTO employees(first_name, last_name, email, hire_date, salary) VALUES ('Niramay', 'Kelkar', 'abcd@gmail.com', '04/04/2022', 60000);
INSERT INTO employees(first_name, last_name, email, hire_date, salary) VALUES ('Abcd', 'Xyz', 'xyz@gmail.com', '04/01/2020', 90000);
INSERT INTO employees(first_name, last_name, email, hire_date, salary) VALUES ('Jurgen', 'Klopp', 'klopp.com', '05/16/2016', 160000);
INSERT INTO employees(first_name, last_name, email, hire_date, salary) VALUES ('Max', 'Verstappen', 'max@gmail.com', '08/04/2018', 87000);
INSERT INTO employees(first_name, last_name, email, hire_date, salary) VALUES ('Luis', 'Diaz', 'diaz@gmail.com', '12/01/2022', 56000);

-- Sample data insert queries for employeecontact
INSERT INTO employeecontact(addressline1, addressline2, city, [state], country, zipcode, employee_id) VALUES ('1 Richard Lane', 'Apt 2', 'Boston', 'Massachusetts', 'United States' , 02118, 1);
INSERT INTO employeecontact(addressline1, addressline2, city, [state], country, zipcode, employee_id) VALUES ('221 Baker St', 'Apt B', 'Brookline', 'Massachusetts', 'United States' , 02445, 2);
INSERT INTO employeecontact(addressline1, addressline2, city, [state], country, zipcode, employee_id) VALUES ('1021 Beacon St', 'Apt 6', 'Brookline', 'Massachusetts', 'United States' , 02446, 3);
INSERT INTO employeecontact(addressline1, addressline2, city, [state], country, zipcode, employee_id) VALUES ('32 McGreevy Way', 'Apt C', 'Boston', 'Massachusetts', 'United States' , 02120, 4);
INSERT INTO employeecontact(addressline1, addressline2, city, [state], country, zipcode, employee_id) VALUES ('18 Hyde Park Ave', 'Apt 4', 'Jamaica Plain', 'Massachusetts', 'United States' , 02140, 5);


-- To test out the data run the commands below
select *from employees;
select * from employeecontact;