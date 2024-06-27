-- Create DB pet_db
-- DROP DATABASE IF pet_db;
CREATE DATABASE pet_db;

USE pet_db;

-- Таблица с типами жимотных (кошки, собаки и хомяки)
CREATE TABLE pet_types (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  Genus_name VARCHAR(50) NOT NULL
);

-- Таблица с общим списком всех животных
CREATE TABLE pet_list (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  PetName VARCHAR(50) NOT NULL,
  Birthday DATE NOT NULL,
  GenusId INT,
  FOREIGN KEY (GenusId) REFERENCES pet_types(Id)
);

-- Таблица с командами для животных
CREATE TABLE commands (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  Command_name VARCHAR(50) NOT NULL
);

-- Таблица с командами, которые животные уже разучили
CREATE TABLE pet_command (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  PetId INT NOT NULL,
  CommandId INT,
  FOREIGN KEY (PetId) REFERENCES pet_list(Id),
  FOREIGN KEY (CommandId) REFERENCES commands(Id)
);

-- Таблица для комманд, которые будут животные будут разучивать
CREATE TABLE genus_command (
  GenusId INT NOT NULL,
  CommandId INT NOT NULL,
  PRIMARY KEY (GenusId, CommandId),
  FOREIGN KEY (GenusId) REFERENCES pet_types(Id),
  FOREIGN KEY (CommandId) REFERENCES commands(Id)
);

-- Три вида домашних животных
INSERT INTO pet_types (Genus_name) values
('Cat'),
('Dog'),
('Hamster');

-- Три животных в питомнике
INSERT INTO pet_list (PetName, Birthday, GenusId) VALUES 
('Том', '2020-05-20', 1),
('Спайк', '2021-01-10', 2),
('Джерри', '2022-08-01', 3);

-- Команды для животных
INSERT INTO commands (command_name) values
('cидеть'),
('лежать'),
('стоять'),
('бежать'),
('вперед'),
('назад'),
('прыгать'),
('играть'),
('спать');

-- Какие команды уже знают животные
INSERT INTO pet_command (PetId, CommandId) values
(1, 1),
(2, 2),
(3, 3);