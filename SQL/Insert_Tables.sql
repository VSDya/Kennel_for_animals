USE Friends_of_Human;

-- Table animal_classes
INSERT INTO animal_classes (class_name) VALUES
('Вьючные'),
('Домашние'); 

-- Table packed_animals
INSERT INTO packed_animals (gen_name, class_id) VALUES 
('Лошади', 1),
('Ослы', 1),  
('Верблюды', 1); 

-- Table home_animals    
INSERT INTO home_animals (gen_name, class_id) VALUES 
('Кошки', 2),
('Собаки', 2),  
('Хомяки', 2); 

-- Table cats
INSERT INTO cats (name, birthday, commands, gen_id) VALUES 
('Том', '2023-01-01', 'Прыгай, прячься, играть', 1),
('Мурка', '2022-01-05', "Лежать, ловить мышей", 1),  
('Черныш', '2017-08-02', "Сидеть", 1);

-- Table dogs 
INSERT INTO dogs (name, birthday, commands, gen_id) VALUES 
('Белка', '2021-04-08', 'лежать, голос', 2),
('Стрелка', '2022-06-12', "сидеть, лежать", 2),  
('Шарик', '2015-07-01', "сидеть, лежать, след, фас", 2), 
('Бобик', '2021-05-10', "сидеть, лежать, место", 2);

-- Table hamsters 
INSERT INTO hamsters (name, birthday, commands, gen_id) VALUES 
('Серый', '2021-11-12', '', 3),
('Бурый', '2022-02-12', "крутить колесо", 3),  
('Полосатик', '2021-07-11', 'Спрятаться в домике', 3);

-- Table camels 
INSERT INTO camels (name, birthday, commands, gen_id) VALUES 
('Дружный', '2022-04-10', 'Сесть', 3),
('Кунка', '2018-03-11', "стоп", 3),  
('Лайнер', '2017-07-12', "назад, стоп, разворот", 3), 
('Палуба', '2021-12-05', "сесть, стоп, вперед, назад", 3);

-- Table horses
INSERT INTO horses (name, birthday, commands, gen_id) VALUES 
('Молния', '2020-03-12', 'бегом, шагом, галопом', 1),
('Дождь', '2017-04-11', "бегом, шагом, галопом, сесть", 1),  
('Быстрый', '2018-06-09', "бегом, шагом, хоп, брр", 1), 
('Байкал', '2022-11-10', "шагом, хоп", 1);

-- Table donkeys
INSERT INTO donkeys (name, birthday, commands, gen_id) VALUES 
('Хитрый', '2018-03-12', 'стоп, вперед', 2),  
('Толстяк', '2019-07-12', 'стоп', 2), 
('Мирный', '2022-12-10', 'вперед', 2);