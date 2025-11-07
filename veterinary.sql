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

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
    (1, 'Fido', 'Dog', 'Golden Retriever', '2019-05-15', 'Male', 'Golden', 1),
    (2, 'Whiskers', 'Cat', 'Siamese', '2020-02-20', 'Female', 'Cream', 2),
    (3, 'Rocky', 'Dog', 'German Shepherd', '2018-11-11', 'Male', 'Black/Tan', 3),
    (4, 'Fluffy', 'Cat', 'Persian', '2021-03-30', 'Male', 'White', 4),
    (5, 'Luna', 'Dog', 'Siberian Husky', '2019-07-22', 'Female', 'Gray/White', 5),
    (6, 'Mochi', 'Cat', 'Maine Coon', '2020-09-19', 'Male', 'Brown Tabby', 6),
    (7, 'Bella', 'Dog', 'Poodle', '2021-01-10', 'Female', 'White', 7),
    (8, 'Simba', 'Cat', 'Bengal', '2019-12-25', 'Male', 'Spotted', 8),
    (9, 'Max', 'Dog', 'Dachshund', '2020-08-08', 'Male', 'Red', 9),
    (10, 'Cleo', 'Cat', 'Ragdoll', '2021-04-17', 'Female', 'Seal Point', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES
    (1, 1, '2023-01-05', 'Annual checkup'),
    (2, 2, '2023-01-10', 'Vaccination'),
    (3, 3, '2023-02-02', 'Injury assessment'),
    (4, 4, '2023-02-15', 'Dental cleaning'),
    (5, 5, '2023-03-10', 'Skin condition'),
    (6, 6, '2023-03-20', 'Flea treatment'),
    (7, 7, '2023-04-12', 'Vaccination'),
    (8, 8, '2023-04-18', 'Spaying surgery'),
    (9, 9, '2023-05-02', 'Allergy consultation'),
    (10, 10, '2023-05-20', 'Eye infection');

INSERT INTO doctors (doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
    (1, 'Dr. Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
    (2, 'Dr. Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
    (3, 'Dr. Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
    (4, 'Dr. Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
    (5, 'Dr. Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
    (6, 'Dr. Carmen', 'Fernandez', 'Ophthalmology Specialist', '333-222-1111', 'carmen@example.com'),
    (7, 'Dr. Roberto', 'Chen', 'Cardiology Specialist', '444-555-6666', 'roberto@example.com'),
    (8, 'Dr. Elena', 'Martinez', 'Neurology Specialist', '777-888-9999', 'elena@example.com'),
    (9, 'Dr. Miguel', 'Tan', 'Dentistry Specialist', '222-333-4444', 'miguel@example.com'),
    (10, 'Dr. Andrea', 'Lim', 'Emergency Care Specialist', '666-777-8888', 'andrea@example.com');

INSERT INTO invoices (invoiceid, appointid, totalamount, paymentdate)
VALUES
    (1, 1, 50.00, '09:30:00'),
    (2, 2, 75.00, '14:15:00'),
    (3, 3, 100.00, '11:00:00'),
    (4, 4, 200.00, '13:45:00'),
    (5, 5, 80.00, '10:30:00'),
    (6, 6, 30.00, '15:00:00'),
    (7, 7, 75.00, '09:15:00'),
    (8, 8, 150.00, '16:30:00'),
    (9, 9, 60.00, '14:45:00'),
    (10, 10, 40.00, '11:30:00');