# Организовать систему учёта для питомника, в котором живут домашние и вьючные животные.

## Linux
1. Создание файлов с помощью команды cat:
```
$> cat > Домашние_животные.txt
собака
кошка
хомяк
^C

$> cat > Вьючные_животные.txt
лошадь
верблюд
осел
^C
```
Объединение файлов:
```
$> cat Домашние_животные.txt Вьючные_животные.txt > Друзья_человека.txt
```
Просмотр содержимого файла:
```
$> cat Друзья_человека.txt
```
Переименование файла:
```
$> mv Друзья_человека.txt Friends_of_Human.txt
```
2. Создание директории и перемещение файла:
```
$> mkdir Nursery
$> mv Friends_of_Human.txt Nursery/
```
3. Для добавления репозитория MySQL используем guide - https://downloads.mysql.com/docs/mysql-apt-repo-quick-guide-en.a4.pdf

Скачиваем deb пакет и устанавливаем:
```
$> wget https://repo.mysql.com//mysql-apt-config_0.8.26-1_all.deb
$> sudo dpkg -i mysql-apt-config_0.8.26-1_all.deb
```
Получаем последнюю информацию о пакете из репозитория MySQL APT:
```
$> sudo apt-get update
Сущ:1 http://ru.archive.ubuntu.com/ubuntu jammy InRelease
Сущ:2 http://ru.archive.ubuntu.com/ubuntu jammy-updates InRelease
Сущ:3 http://ru.archive.ubuntu.com/ubuntu jammy-backports InRelease
Сущ:4 http://repo.mysql.com/apt/ubuntu jammy InRelease
Сущ:5 http://ru.archive.ubuntu.com/ubuntu jammy-security InRelease
Чтение списков пакетов… Готово
```
Теперь можно устанавливать пакеты из репозитория MySQL. Так как в следующих заданиях предполагается работать с БД, то установим пакет **mysql-server**:
```
$> sudo apt-get install mysql-server
```
На этапе установки задаём пароль, далее ставим с рекомендуемыми параметрами.

![pass_mysql](https://github.com/VSDya/Kennel_for_animals/blob/main/image/mysql_pass.PNG)

Проверяем версию:
```
$> mysqld --version
/usr/sbin/mysqld  Ver 8.0.37 for Linux on x86_64 (MySQL Community Server - GPL)
```
Проверяем состояние:
```
$> systemctl status mysql
● mysql.service - MySQL Community Server
     Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2024-06-27 12:37:32 MSK; 3h 21min ago
       Docs: man:mysqld(8)
             http://dev.mysql.com/doc/refman/en/using-systemd.html
    Process: 945 ExecStartPre=/usr/share/mysql-8.0/mysql-systemd-start pre (code=exited, status=0/SUCCES>
   Main PID: 1144 (mysqld)
     Status: "Server is operational"
      Tasks: 40 (limit: 4597)
     Memory: 446.7M
        CPU: 2min 57.741s
     CGroup: /system.slice/mysql.service
             └─1144 /usr/sbin/mysqld
```
4. Установить и удалить deb-пакет с помощью dpkg. 

Какой пакет именно устанавливать - вопрос к методологам, что они подразумевали, я не понял. Но тем не менее, задание вроде простое.

Установка:
```
$> sudo dpkg -i <имя пакета>.deb
```
Удаление:
```
$> sudo dpkg -r <имя пакета>
```
5. История команд. Тут тоже не понял для чего история команд, когда они все выведены сверху. Но тем не менее:
```
$> history
```
## SQL
6. Диаграмма классов:

```
Animal_Classes
├── Home_Animals
│   ├── Dogs
│   ├── Cats
│   └── Hamsters
└── Packed_Animals
    ├── Horses
    ├── Camels
    └── Donkeys
```
7. Создание БД.
Для визуализации БД установим phpmyadmin (во время установки выбираем веб apache2 и задаём пароли для доступа):
```
$> sudo apt install phpmyadmin
```
Устанавливаем модуль PHP для Apache:
```
$> sudo apt install libapache2-mod-php
```
Создаём базу данных "Друзья человека" в MySQL:
```
$> mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.34 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS Friends_of_Human;
Query OK, 1 row affected, 1 warning (0,01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Friends_of_Human   |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| sys                |
+--------------------+
6 rows in set (0,00 sec)
```
Теперь можно наблюдать за БД через браузер:

![phpmyadmin](https://github.com/VSDya/Kennel_for_animals/blob/main/image/phpmyadmin-viewdb.PNG)

Она пока пустая, сейчас добавим инфу.

8. Создание таблиц в БД согласно пункту №6:

[Dump](https://github.com/VSDya/Kennel_for_animals/blob/main/SQL/Create_Table.sql) создания таблиц

```
mysql> use Friends_of_Human;
mysql>
mysql> show tables;
+----------------------------+
| Tables_in_Friends_of_Human |
+----------------------------+
| animal_classes             |
| camels                     |
| cats                       |
| dogs                       |
| donkeys                    |
| hamsters                   |
| home_animals               |
| horses                     |
| packed_animals             |
+----------------------------+
9 rows in set (0,00 sec)
```
![phpmyadmin](https://github.com/VSDya/Kennel_for_animals/blob/main/image/Create_Tables.PNG)

![Диаграмма](https://github.com/VSDya/Kennel_for_animals/blob/main/image/Диаграмма.PNG)


9. Заполнение таблиц данными:

[Dump](https://github.com/VSDya/Kennel_for_animals/blob/main/SQL/Insert_Tables.sql) заполнения таблиц данными

Теперь данные о животных хранятся в соответствующих таблицах в зависимости от их класса.
```
mysql> SELECT * FROM animal_classes;
+----+------------------+
| id | class_name       |
+----+------------------+
|  1 | Вьючные          |
|  2 | Домашние         |
+----+------------------+
2 rows in set (0,00 sec)
mysql>
mysql> SELECT * FROM home_animals;
+----+--------------+----------+
| id | gen_name     | class_id |
+----+--------------+----------+
|  1 | Кошки        |        2 |
|  2 | Собаки       |        2 |
|  3 | Хомяки       |        2 |
+----+--------------+----------+
3 rows in set (0,00 sec)
mysql>
mysql> SELECT * FROM packed_animals;
+----+------------------+----------+
| id | gen_name         | class_id |
+----+------------------+----------+
|  1 | Лошади           |        1 |
|  2 | Ослы             |        1 |
|  3 | Верблюды         |        1 |
+----+------------------+----------+
3 rows in set (0,00 sec)
mysql>
mysql> SELECT * FROM cats;
+----+--------------+------------+--------------------------------------------+--------+
| id | name         | birthday   | commands                                   | gen_id |
+----+--------------+------------+--------------------------------------------+--------+
|  1 | Том          | 2023-01-01 | Прыгай, прячься, играть                    |      1 |
|  2 | Мурка        | 2022-01-05 | Лежать, ловить мышей                       |      1 |
|  3 | Черныш       | 2017-08-02 | Сидеть                                     |      1 |
+----+--------------+------------+--------------------------------------------+--------+
3 rows in set (0,00 sec)
mysql>
mysql> SELECT * FROM horses;
+----+----------------+------------+----------------------------------------------------+--------+
| id | name           | birthday   | commands                                           | gen_id |
+----+----------------+------------+----------------------------------------------------+--------+
|  1 | Молния         | 2020-03-12 | бегом, шагом, галопом                              |      1 |
|  2 | Дождь          | 2017-04-11 | бегом, шагом, галопом, сесть                       |      1 |
|  3 | Быстрый        | 2018-06-09 | бегом, шагом, хоп, брр                             |      1 |
|  4 | Байкал         | 2022-11-10 | шагом, хоп                                         |      1 |
+----+----------------+------------+----------------------------------------------------+--------+
4 rows in set (0,00 sec)
```

![Hourses](https://github.com/VSDya/Kennel_for_animals/blob/main/image/Horses.PNG)

10. В таблице **camels** сейчас четыре строки:
```
mysql> SELECT * FROM camels;
+----+----------------+------------+------------------------------------------------+--------+
| id | name           | birthday   | commands                                       | gen_id |
+----+----------------+------------+------------------------------------------------+--------+
|  1 | Дружный        | 2022-04-10 | Сесть                                          |      3 |
|  2 | Кунка          | 2018-03-11 | стоп                                           |      3 |
|  3 | Лайнер         | 2017-07-12 | назад, стоп, разворот                          |      3 |
|  4 | Палуба         | 2021-12-05 | сесть, стоп, вперед, назад                     |      3 |
+----+----------------+------------+------------------------------------------------+--------+
4 rows in set (0,00 sec)
```
Чистим таблицу:
```
mysql> DELETE FROM camels;
Query OK, 4 rows affected (0,01 sec)

mysql> SELECT * FROM camels;
Empty set (0,00 sec)
```
Выбираем строки из таблиц **horses** и **donkeys**:
```
mysql> SELECT name, birthday, commands FROM horses
    -> UNION
    -> SELECT name, birthday, commands FROM donkeys
    -> ;
+----------------+------------+----------------------------------------------------+
| name           | birthday   | commands                                           |
+----------------+------------+----------------------------------------------------+
| Молния         | 2020-03-12 | бегом, шагом, галопом                              |
| Дождь          | 2017-04-11 | бегом, шагом, галопом, сесть                       |
| Быстрый        | 2018-06-09 | бегом, шагом, хоп, брр                             |
| Байкал         | 2022-11-10 | шагом, хоп                                         |
| Хитрый         | 2018-03-12 | стоп, вперед                                       |
| Толстяк        | 2019-07-12 | стоп                                               |
| Мирный         | 2022-12-10 | вперед                                             |
+----------------+------------+----------------------------------------------------+
7 rows in set (0,01 sec)
```
11. Создать новую таблицу “молодые животные”, в которую попадут все животные старше 1 года, но младше 3 лет.

Сначала создаём временную таблицу animals_temp, которая объединяет таблицы cats, dogs,hamsters, horses и donkeys и  в одну таблицу с новым столбцом gen, который указывает на вид животного:
```
mysql> CREATE TEMPORARY TABLE animals_temp AS
    -> SELECT *, 'Лошади' as gen FROM horses
    -> UNION SELECT *, 'Ослы' AS gen FROM donkeys
    -> UNION SELECT *, 'Собаки' AS gen FROM dogs
    -> UNION SELECT *, 'Кошки' AS gen FROM cats
    -> UNION SELECT *, 'Хомяки' AS gen FROM hamsters;
Query OK, 17 rows affected (0,01 sec)
Records: 17  Duplicates: 0  Warnings: 0
```
Теперь создаём таблицу young_animals, которая содержит имена, даты рождения, команды, вид и возраст животных из таблицы animals_temp. Отбираем всех животных, которые родились в течение последних трех лет. Возраст вычисляется на основе даты рождения и текущей даты, и представлен в формате "лет мес.:

```
mysql> CREATE TABLE young_animals AS
    -> SELECT name, birthday, commands, gen, CONCAT(CAST(TIMESTAMPDIFF(YEAR, Birthday, NOW()) AS CHAR), " лет ",
    -> CAST(MOD(TIMESTAMPDIFF(MONTH, birthday, NOW()), 12) AS CHAR), " мес. ") AS age
    -> FROM animals_temp WHERE birthday BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
Query OK, 7 rows affected (0,02 sec)
Records: 7  Duplicates: 0  Warnings: 0
```
Смотрим что получилось:
```
mysql> SELECT * FROM young_animals;
+--------------------+------------+----------------------------------------+--------------+---------------------+
| name               | birthday   | commands                               | gen          | age                 |
+--------------------+------------+----------------------------------------+--------------+---------------------+
| Белка              | 2021-04-08 | лежать, голос                          | Собаки       | 2 лет 3 мес.        |
| Стрелка            | 2022-06-12 | сидеть, лежать                         | Собаки       | 1 лет 1 мес.        |
| Бобик              | 2021-05-10 | сидеть, лежать, место                  | Собаки       | 2 лет 2 мес.        |
| Мурка              | 2022-01-05 | Лежать, ловить мышей                   | Кошки        | 1 лет 6 мес.        |
| Серый              | 2021-11-12 |                                        | Хомяки       | 1 лет 8 мес.        |
| Бурый              | 2022-02-12 | крутить колесо                         | Хомяки       | 1 лет 5 мес.        |
| Полосатик          | 2021-07-11 | Спрятаться в домике                    | Хомяки       | 2 лет 0 мес.        |
+--------------------+------------+----------------------------------------+--------------+---------------------+
7 rows in set (0,00 sec)
```

![young_animals](https://github.com/VSDya/Kennel_for_animals/blob/main/image/young_animals.PNG)

12. Выводим всех животных в одну таблицу:
```
SELECT h.Name, h.Birthday, h.Commands, pa.Gen_name, yo.Age
FROM horses h
LEFT JOIN young_animals yo ON yo.Name = h.Name
LEFT JOIN packed_animals pa ON pa.Id = h.Gen_id
UNION 
SELECT d.Name, d.Birthday, d.Commands, pa.Gen_name, yo.Age 
FROM donkeys d 
LEFT JOIN packed_animals pa ON pa.Id = d.Gen_id
LEFT JOIN young_animals yo ON yo.Name = d.Name
UNION
SELECT hm.Name, hm.Birthday, hm.Commands, ha.Gen_name, yo.Age 
FROM hamsters hm
LEFT JOIN young_animals yo ON yo.Name = hm.Name
LEFT JOIN home_animals ha ON ha.Id = hm.Gen_id
UNION
SELECT c.Name, c.Birthday, c.Commands, ha.Gen_name, yo.Age 
FROM cats c
LEFT JOIN young_animals yo ON yo.Name = c.Name
LEFT JOIN home_animals ha ON ha.Id = c.Gen_id
UNION
SELECT d.Name, d.Birthday, d.Commands, ha.Gen_name, yo.Age 
FROM dogs d
LEFT JOIN young_animals yo ON yo.Name = d.Name
LEFT JOIN home_animals ha ON ha.Id = d.Gen_id;
```

```
mysql> SELECT h.Name, h.Birthday, h.Commands, pa.Gen_name, yo.Age
    -> FROM horses h
    -> LEFT JOIN young_animals yo ON yo.Name = h.Name
    -> LEFT JOIN packed_animals pa ON pa.Id = h.Gen_id
    -> UNION
    -> SELECT d.Name, d.Birthday, d.Commands, pa.Gen_name, yo.Age
    -> FROM donkeys d
    -> LEFT JOIN packed_animals pa ON pa.Id = d.Gen_id
    -> LEFT JOIN young_animals yo ON yo.Name = d.Name
    -> UNION
    -> SELECT hm.Name, hm.Birthday, hm.Commands, ha.Gen_name, yo.Age
    -> FROM hamsters hm
    -> LEFT JOIN young_animals yo ON yo.Name = hm.Name
    -> LEFT JOIN home_animals ha ON ha.Id = hm.Gen_id
    -> UNION
    -> SELECT c.Name, c.Birthday, c.Commands, ha.Gen_name, yo.Age
    -> FROM cats c
    -> LEFT JOIN young_animals yo ON yo.Name = c.Name
    -> LEFT JOIN home_animals ha ON ha.Id = c.Gen_id
    -> UNION
    -> SELECT d.Name, d.Birthday, d.Commands, ha.Gen_name, yo.Age
    -> FROM dogs d
    -> LEFT JOIN young_animals yo ON yo.Name = d.Name
    -> LEFT JOIN home_animals ha ON ha.Id = d.Gen_id;
+--------------------+------------+----------------------------------------------------+--------------+---------------------+
| Name               | Birthday   | Commands                                           | Gen_name     | Age                 |
+--------------------+------------+----------------------------------------------------+--------------+---------------------+
| Молния             | 2020-03-12 | бегом, шагом, галопом                              | Лошади       | NULL                |
| Дождь              | 2017-04-11 | бегом, шагом, галопом, сесть                       | Лошади       | NULL                |
| Быстрый            | 2018-06-09 | бегом, шагом, хоп, брр                             | Лошади       | NULL                |
| Байкал             | 2022-11-10 | шагом, хоп                                         | Лошади       | NULL                |
| Хитрый             | 2018-03-12 | стоп, вперед                                       | Ослы         | NULL                |
| Толстяк            | 2019-07-12 | стоп                                               | Ослы         | NULL                |
| Мирный             | 2022-12-10 | вперед                                             | Ослы         | NULL                |
| Серый              | 2021-11-12 |                                                    | Хомяки       | 1 лет 8 мес.        |
| Бурый              | 2022-02-12 | крутить колесо                                     | Хомяки       | 1 лет 5 мес.        |
| Полосатик          | 2021-07-11 | Спрятаться в домике                                | Хомяки       | 2 лет 0 мес.        |
| Том                | 2023-01-01 | Прыгай, прячься, играть                            | Кошки        | NULL                |
| Мурка              | 2022-01-05 | Лежать, ловить мышей                               | Кошки        | 1 лет 6 мес.        |
| Черныш             | 2017-08-02 | Сидеть                                             | Кошки        | NULL                |
| Белка              | 2021-04-08 | лежать, голос                                      | Собаки       | 2 лет 3 мес.        |
| Стрелка            | 2022-06-12 | сидеть, лежать                                     | Собаки       | 1 лет 1 мес.        |
| Шарик              | 2015-07-01 | сидеть, лежать, след, фас                          | Собаки       | NULL                |
| Бобик              | 2021-05-10 | сидеть, лежать, место                              | Собаки       | 2 лет 2 мес.        |
+--------------------+------------+----------------------------------------------------+--------------+---------------------+
17 rows in set (0,00 sec)
```
## Java
13. Создать класс с Инкапсуляцией методов и наследованием по диаграмме.

[Model](https://github.com/VSDya/Kennel_for_animals/tree/main/src/Model)

14. Написать программу, имитирующую работу реестра домашних животных.

[Program](https://github.com/VSDya/Kennel_for_animals/tree/main/src)

15. Создайте класс Счетчик, у которого есть метод add(), увеличивающий̆
значение внутренней̆int переменной̆на 1 при нажатие “Завести новое
животное” Сделайте так, чтобы с объектом такого типа можно было работать в
блоке try-with-resources. Нужно бросить исключение, если работа с объектом
типа счетчик была не в ресурсном try и/или ресурс остался открыт. Значение
считать в ресурсе try, если при заведения животного заполнены все поля.

![Counter](https://github.com/VSDya/Kennel_for_animals/blob/main/image/Counter.png)

[Counter](https://github.com/VSDya/Kennel_for_animals/blob/main/src/Counter/Counter.java)

![add_new_pit](https://github.com/VSDya/Kennel_for_animals/blob/main/image/Add_pit.gif)


БД mysql расположена на виртуалке 192.168.1.7 (Хост А)
Application - на узле 192.168.1.3 (Хост Б)
Чтобы от хоста А подключиться к БД, расположенной на хосте Б нужно выполнить:
```
$> sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
```
Добавить строку **bind-address = 192.168.1.3**

Сохраняем изменения и ребутаем службу MySQL:
```
$> sudo systemctl restart mysql
```
Создаем нового пользователя **user/12345** в БД с правами доступа к удаленному подключению:
```
mysql> CREATE USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY '12345';
Query OK, 0 rows affected (0,01 sec)

mysql> GRANT ALL PRIVILEGES ON pet_db.* TO 'user'@'%';
Query OK, 0 rows affected (0,01 sec)
```
В [коде](https://github.com/VSDya/Kennel_for_animals/blob/main/src/Resources/database.properties) прописываем хост, бд, логин и пароль.

Использовал VSC. Для работы JDBC драйвера нужно качнуть с офф сайта драйвер и положить его в [проект](https://github.com/VSDya/Kennel_for_animals/tree/main/src/lib)

Далее в classpath добавить jar.

![classpath](https://github.com/VSDya/Kennel_for_animals/blob/main/image/Classpath_VSC.png) 






