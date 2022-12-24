CREATE TABLE заказчик (
id INTEGER PRIMARY KEY NOT NULL,
ФИО varchar(100) NOT NULL,
номер_телефона varchar(100) NOT NULL,
почта varchar(100) NOT NULL);

CREATE TABLE мастер (
id INTEGER PRIMARY KEY NOT NULL,
ФИО varchar(100) NOT NULL,
стаж INTEGER NOT NULL);

CREATE TABLE компьютер (
id INTEGER PRIMARY KEY NOT NULL,
плата varchar(100) NOT NULL,
память varchar(100) NOT NULL,
хранилище varchar(100) NOT NULL,
процессор varchar(100) NOT NULL,
блок_питания varchar(100) NOT NULL);

CREATE TABLE данные_сотрудника (
id INTEGER PRIMARY KEY NOT NULL,
СНИЛС varchar(100) NOT NULL,
ИНН varchar(100) NOT NULL,
серия varchar(100) NOT NULL,
номер varchar(100) NOT NULL);

CREATE TABLE услуги (
id INTEGER PRIMARY KEY NOT NULL,
услуга varchar(100) NOT NULL,
артикул varchar(100) NOT NULL);

CREATE TABLE набор_услуг (
id INTEGER PRIMARY KEY NOT NULL,
услуга INTEGER NOT NULL,
заказ INTEGER NOT NULL);

CREATE TABLE заказ (
id INTEGER PRIMARY KEY NOT NULL,
компьютер INTEGER NOT NULL,
время timestamp NOT NULL,
мастер INTEGER NOT NULL,
заказчик INTEGER NOT NULL,
стоимость INTEGER NOT NULL,
завершён BOOLEAN NOT NULL,
услуги INTEGER NOT NULL);

ALTER TABLE мастер ADD CONSTRAINT мастер_id_данные_сотрудника_id FOREIGN KEY (id) REFERENCES данные_сотрудника(id);

ALTER TABLE набор_услуг ADD CONSTRAINT набор_услуг_услуга_услуги_id FOREIGN KEY (услуга) REFERENCES услуги(id);

ALTER TABLE заказ ADD CONSTRAINT заказ_компьютер_компьютер_id FOREIGN KEY (компьютер) REFERENCES компьютер(id);

ALTER TABLE заказ ADD CONSTRAINT заказ_мастер_мастер_id FOREIGN KEY (мастер) REFERENCES мастер(id);

ALTER TABLE заказ ADD CONSTRAINT заказ_заказчик_заказчик_id FOREIGN KEY (заказчик) REFERENCES заказчик(id);

ALTER TABLE заказ ADD CONSTRAINT заказ_услуги_набор_услуг_id FOREIGN KEY (услуги) REFERENCES набор_услуг(id);