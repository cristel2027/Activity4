# Activity

CREATE DATABASE veterinary

CREATE TABLE owners (
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) 
    REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid)
    REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices (
   invoiceid INT PRIMARY KEY,
   appointid INT,
   totalamount DECIMAL(10,2),
   paymentdate VARCHAR(20),
   FOREIGN KEY (appointid)
   REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
   recordid INT PRIMARY KEY,
   animalid INT,
   recorddate DATETIME,
   doctorid INT,
   diagnosis VARCHAR(255),
   prescription VARCHAR(255),
   notes TEXT,
   FOREIGN KEY (animalid) 
   REFERENCES animals(animalid),
   FOREIGN KEY (doctorid) 
   REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email) 
VALUES
    (1, 'Juan', 'Dela Cruz', '123 Main St, Manila', '123-4567', 'juan@example.com'),
    (2, 'Maria', 'Santos', '456 Oak St, Quezon City', '987-6543', 'maria@example.com'),
    (3, 'Antonio', 'Gonzales', '789 Pine St, Cebu', '555-1234', 'antonio@example.com'),
    (4, 'Elena', 'Rodriguez', '321 Elm St, Davao', '111-2222', 'elena@example.com'),
    (5, 'Ricardo', 'Lim', '654 Maple St, Makati', '333-4444', 'ricardo@example.com'),
    (6, 'Isabel', 'Reyes', '987 Birch St, Pasig', '666-7777', 'isabel@example.com'),
    (7, 'Lorenzo', 'Torres', '147 Cedar St, Mandaluyong', '888-9999', 'lorenzo@example.com'),
    (8, 'Carmen', 'Fernandez', '258 Spruce St, Taguig', '222-3333', 'carmen@example.com'),
    (9, 'Felipe', 'Garcia', '369 Walnut St, Paranaque', '444-5555', 'felipe@example.com'),
    (10, 'Beatriz', 'Morales', '741 Palm St, Las Pinas', '777-8888', 'beatriz@example.com');