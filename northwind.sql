

create table categories (
    categoryID INT PRIMARY KEY NOT NULL,
    categoryName VARCHAR(50) NOT NULL,
    description TEXT,
    picture TEXT
);

create table customers (
   customerID VARCHAR(50) PRIMARY KEY NOT NULL, 
   companyName VARCHAR(50) NOT NULL,
   contactName VARCHAR(50),
   contactTitle VARCHAR(50),
   address VARCHAR(100),
   city VARCHAR(50),
   region VARCHAR(50),
   postalCode VARCHAR(50),
   country VARCHAR(50),
   phone VARCHAR(50),
   fax VARCHAR(50)
);
create table regions (
    regionID INT PRIMARY KEY NOT NULL,
    regionDescription VARCHAR(255)
);

create table shippers (
    shipperID INT PRIMARY KEY NOT NULL,
    companyName VARCHAR(50) NOT NULL,
    phone VARCHAR(50)
);

create table suppliers (
    supplierID INT PRIMARY KEY NOT NULL,
    companyName VARCHAR(50),
    contactName VARCHAR(50),
    contactTitle VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    region VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(50),
    fax VARCHAR(50),
    homePage TEXT
);

create table employees (
    employeeID INT PRIMARY KEY NOT NULL,
    lastName VARCHAR(50) NOT NULL,	
    firstName VARCHAR(50) NOT NULL,	
    title VARCHAR(50),		
    titleOfCourtesy	VARCHAR(50),
    birthDate DATE,	
    hireDate DATE,	
    address	VARCHAR(100),	
    city VARCHAR(50),		
    region VARCHAR(50),	
    postalCode VARCHAR(50),	
    country VARCHAR(50),	
    homePhone VARCHAR(50),
    extension INT,
    photo TEXT,	
    notes TEXT,
    reportsTo INT,
    photoPath TEXT,
    FOREIGN KEY (reportsTo) REFERENCES employees(employeeID)  
);
create table products (
	productID INT PRIMARY KEY NOT NULL,
    productName VARCHAR(50),
    supplierID INT,
    categoryID INT,
    quantityPerUnit VARCHAR(50),
    unitPrice FLOAT,
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued INT,
    FOREIGN KEY (supplierID) REFERENCES suppliers (supplierID),
    FOREIGN KEY (categoryID) REFERENCES categories (categoryID)
);

create table orders (
    orderID INT  PRIMARY KEY NOT NULL,
    customerID VARCHAR(50),
    employeeID INT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipVia INT,
    freight FLOAT,
    shipName VARCHAR(50),
    shipAddress VARCHAR(100),
    shipCity VARCHAR(50),
    shipRegion VARCHAR(50),
    shipPostalCode VARCHAR(50),
    shipCountry VARCHAR(50),    
    FOREIGN KEY (customerID) REFERENCES customers(customerID),
    FOREIGN KEY (employeeID) REFERENCES employees (employeeID),
    FOREIGN KEY (shipVia) REFERENCES shippers (shipperID)
 );   
    
create table order_details (
    orderID	INT  NOT NULL, 
    productID INT  NOT NULL,
    unitPrice FLOAT,
    quantity INT,
    discount FLOAT,
    FOREIGN KEY (productID) REFERENCES products(productID),
    FOREIGN KEY (orderID) REFERENCES orders(orderID)
);


create table territories (
    territoryID INT PRIMARY KEY NOT NULL,
    territoryDescription VARCHAR(50),
    regionID INT , 
    FOREIGN KEY (regionID) REFERENCES regions(regionID)
);
create table employee_territories (
    employeeID INT  NOT NULL,
    territoryID INT  NOT NULL REFERENCES territories (territoryID),
    FOREIGN KEY (employeeID) REFERENCES employees(employeeID)
);

create table countries (
    code VARCHAR(2),
    latitude FLOAT,
    longitude FLOAT,
    country VARCHAR(50)
);

\copy categories FROM '/home/daria/Documents/spiced_projects/week_5/data/categories.csv' DELIMITER ',' CSV HEADER NULL 'NULL';
\copy customers FROM '/home/daria/Documents/spiced_projects/week_5/data/customers.csv' DELIMITER ',' CSV HEADER NULL 'NULL';
\copy regions FROM '/home/daria/Documents/spiced_projects/week_5/data/regions.csv' DELIMITER ',' CSV HEADER NULL 'NULL';
\copy shippers FROM '/home/daria/Documents/spiced_projects/week_5/data/shippers.csv' DELIMITER ',' CSV HEADER NULL 'NULL';
\copy suppliers FROM '/home/daria/Documents/spiced_projects/week_5/data/suppliers.csv' DELIMITER ',' CSV HEADER NULL 'NULL';
\copy employees FROM '/home/daria/Documents/spiced_projects/week_5/data/employees.csv' DELIMITER ',' CSV HEADER NULL 'NULL';
\copy products FROM '/home/daria/Documents/spiced_projects/week_5/data/products.csv' DELIMITER ',' CSV HEADER NULL 'NULL' ;
\copy orders FROM '/home/daria/Documents/spiced_projects/week_5/data/orders.csv' DELIMITER ',' CSV HEADER NULL 'NULL' ;
\copy order_details FROM '/home/daria/Documents/spiced_projects/week_5/data/order_details.csv' DELIMITER ',' CSV HEADER NULL 'NULL' ;
\copy territories FROM '/home/daria/Documents/spiced_projects/week_5/data/territories.csv' DELIMITER ',' CSV HEADER NULL 'NULL';

\copy employee_territories FROM '/home/daria/Documents/spiced_projects/week_5/data/employee_territories.csv' DELIMITER ',' CSV HEADER NULL 'NULL';
\copy countries FROM '/home/daria/Documents/spiced_projects/week_5/data/countries.csv' DELIMITER ',' CSV HEADER NULL 'NULL';

