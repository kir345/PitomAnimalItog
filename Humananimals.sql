CREATE DATABASE Human_friends;

USE Human_friends;
CREATE TABLE animal_class
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(30)
);

INSERT INTO animal_class (class_name)
VALUES ('домашние'), ('вьючные');

CREATE TABLE home_animals
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_name VARCHAR(30),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES animal_class (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO home_animals (animal_name, class_id)
VALUES ('собаки', 1),
       ('кошки', 1),
       ('хомяки', 1);

CREATE TABLE pack_animals
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_name VARCHAR(30),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES animal_class (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pack_animals (animal_name, class_id)
VALUES ('лошади', 2),
       ('верблюды', 2),
       ('ослы', 2);

CREATE TABLE dogs
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    birthday DATE,
    commands VARCHAR(60),
    animal_id INT,
    Foreign KEY (animal_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO dogs (name, birthday, commands, animal_id)
VALUES ('Барбос', '2017-07-09', 'сидеть, лежать, ко мне, аппорт, подай голос', 1),
       ('Доги', '2014-03-09', 'сидеть, лежать, ко мне, лапу, фу', 1),
       ('Шарик', '2022-10-05', 'сидеть, лежать, место, фас', 1),
       ('Бим', '2020-11-12', 'сидеть, лежать, ко мне, лапу, голос', 1);

CREATE TABLE cats
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    birthday DATE,
    commands VARCHAR(60),
    animal_id INT,
    Foreign KEY (animal_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
); 

INSERT INTO cats (name, birthday, commands, animal_id)
VALUES ('Васька', '2013-07-09', 'кс-кс-кс', 2),
       ('Мурзик', '2022-07-09', 'мяу-мяу', 2),
       ('Муська', '2020-01-21', 'кс-кс-кс, мяу-мяу', 2),
       ('Марвел', '2018-06-12', 'кс-кс-кс', 2);
    
CREATE TABLE hamsters
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    birthday DATE,
    commands VARCHAR(60),
    animal_id INT,
    Foreign KEY (animal_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
); 

INSERT INTO hamsters (name, birthday, commands, animal_id)
VALUES ('Пулька', '2014-08-21', '', 3),
       ('Граф', '2023-04-14', 'бежать', 3),
       ('Буся', '2020-10-01', NULL, 3),
       ('Бегемотик', '2018-02-18', NULL, 3);
       
CREATE TABLE horses
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    birthday DATE,
    commands VARCHAR(60),
    animal_id INT,
    Foreign KEY (animal_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
); 

INSERT INTO horses (name, birthday, commands, animal_id)
VALUES ('Байкал', '2011-03-11', 'бегом, шагом', 1),
       ('Гром', '2015-08-27', 'шагом, брр', 1),
       ('Руслан', '2013-12-26', 'бегом, шагом, хоп, брр', 1),
       ('Шумахер', '2019-05-19', 'шагом, хоп, брр', 1);
       
CREATE TABLE camels
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    birthday DATE,
    commands VARCHAR(60),
    animal_id INT,
    Foreign KEY (animal_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
); 

INSERT INTO camels (name, birthday, commands, animal_id)
VALUES ('Борзый', '2018-01-24', 'бегом, вернись', 2),
       ('Горб', '2018-05-30', 'шагом, повернись, остановись', 2),
       ('Старый', '2009-02-02', 'шагом, остановись', 2),
       ('Лазурный', '2019-09-09', 'улыбнись, повернись, бегом', 2);

CREATE TABLE donkeys
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    birthday DATE,
    commands VARCHAR(60),
    animal_id INT,
    Foreign KEY (animal_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
); 

INSERT INTO donkeys (name, birthday, commands, animal_id)
VALUES ('Первый', '2018-07-20', 'стой', 3),
       ('Второй', '2019-04-07', '', 3),
       ('Третий', '2020-09-26', NULL, 3),
       ('Мякиш', '2021-06-08', '', 3);

SET SQL_SAFE_UPDATES = 0;
DELETE FROM camels;

SELECT name, birthday, commands FROM horses
UNION SELECT name, birthday, commands FROM donkeys;


CREATE TEMPORARY TABLE animals AS
SELECT *, 'лошади' AS animal FROM horses
UNION SELECT *, 'ослы' AS animal FROM donkeys
UNION SELECT *, 'собаки' AS animal FROM dogs
UNION SELECT *, 'кошки' AS animal FROM cats
UNION SELECT *, 'хомяки' AS animal FROM hamsters;
       
CREATE TABLE yang_animal AS
SELECT name, birthday, commands, animal, TIMESTAMPDIFF(MONTH, Birthday, CURDATE()) AS Age_in_month
FROM animals WHERE birthday BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
 
SELECT * FROM yang_animal;


SELECT h.name, h.birthday, h.commands, pa.animal_name, ya.Age_in_month 
FROM horses h
LEFT JOIN yang_animal ya ON ya.name = h.name
LEFT JOIN pack_animals pa ON pa.id = h.animal_id
UNION 
SELECT d.name, d.birthday, d.commands, pa.animal_name, ya.Age_in_month 
FROM donkeys d 
LEFT JOIN yang_animal ya ON ya.name = d.name
LEFT JOIN pack_animals pa ON pa.id = d.animal_id
UNION
SELECT c.name, c.birthday, c.commands, ha.animal_name, ya.Age_in_month 
FROM cats c
LEFT JOIN yang_animal ya ON ya.name = c.name
LEFT JOIN home_animals ha ON ha.id = c.animal_id
UNION
SELECT d.name, d.birthday, d.commands, ha.animal_name, ya.Age_in_month 
FROM dogs d
LEFT JOIN yang_animal ya ON ya.name = d.name
LEFT JOIN home_animals ha ON ha.id = d.animal_id
UNION
SELECT hm.name, hm.birthday, hm.commands, ha.animal_name, ya.Age_in_month 
FROM hamsters hm
LEFT JOIN yang_animal ya ON ya.name = hm.name
LEFT JOIN home_animals ha ON ha.id = hm.animal_id;






