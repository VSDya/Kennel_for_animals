-- Create DB Friends_of_Human
-- DROP DATABASE IF Friends_of_Human;
-- CREATE DATABASE Friends_of_Human;

USE Friends_of_Human;

-- Table animal_classes
DROP TABLE IF EXISTS animal_classes;
CREATE TABLE animal_classes (
    id INT AUTO_INCREMENT PRIMARY KEY, 
	class_name VARCHAR(20)
);


-- Table packed_animals
DROP TABLE IF EXISTS packed_animals;
CREATE TABLE packed_animals (
	id INT AUTO_INCREMENT PRIMARY KEY,
    gen_name VARCHAR (20),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES animal_classes (id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Table home_animals  
DROP TABLE IF EXISTS home_animals;  
CREATE TABLE home_animals (
	id INT AUTO_INCREMENT PRIMARY KEY,
    gen_name VARCHAR (20),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES animal_classes (id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Table cats
DROP TABLE IF EXISTS cats;
CREATE TABLE cats (       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    gen_id int,
    Foreign KEY (gen_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table dogs 
DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs (       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    gen_id int,
    Foreign KEY (gen_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table hamsters 
DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters (       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    gen_id int,
    Foreign KEY (gen_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table camels 
DROP TABLE IF EXISTS camels;
CREATE TABLE camels (       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    gen_id int,
    Foreign KEY (gen_id) REFERENCES packed_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table horses
DROP TABLE IF EXISTS horses;
CREATE TABLE horses (       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    gen_id int,
    Foreign KEY (gen_id) REFERENCES packed_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table donkeys
DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys (       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    gen_id int,
    Foreign KEY (gen_id) REFERENCES packed_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);