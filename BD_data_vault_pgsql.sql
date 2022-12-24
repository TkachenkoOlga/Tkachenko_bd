CREATE TABLE hub_заказчик (
id INTEGER PRIMARY KEY NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE sat_заказчик (
id INTEGER PRIMARY KEY NOT NULL,
ФИО varchar(100) NOT NULL,
номер_телефона varchar(100) NOT NULL,
почта varchar(100) NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE sat_мастер (
id INTEGER PRIMARY KEY NOT NULL,
ФИО varchar(100) NOT NULL,
стаж INTEGER NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE hub_мастер (
id INTEGER PRIMARY KEY NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE hub_компьютер (
id INTEGER PRIMARY KEY NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE sat_компьютер (
id INTEGER PRIMARY KEY NOT NULL,
плата varchar(100) NOT NULL,
память varchar(100) NOT NULL,
хранилище varchar(100) NOT NULL,
процессор varchar(100) NOT NULL,
блок_питания varchar(100) NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE hub_данные_сотрудника (
id INTEGER PRIMARY KEY NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE sat_данные_сотрудника (
id INTEGER PRIMARY KEY NOT NULL,
СНИЛС varchar(100) NOT NULL,
ИНН varchar(100) NOT NULL,
серия varchar(100) NOT NULL,
номер varchar(100) NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE sat_услуги (
id INTEGER PRIMARY KEY NOT NULL,
услуга varchar(100) NOT NULL,
артикул varchar(100) NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE hub_услуги (
id INTEGER PRIMARY KEY NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE sat_набор_услуг (
id INTEGER PRIMARY KEY NOT NULL,
услуга INTEGER NOT NULL,
заказ INTEGER NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE hub_набор_услуг (
id INTEGER PRIMARY KEY NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE sat_заказ (
id INTEGER PRIMARY KEY NOT NULL,
компьютер INTEGER NOT NULL,
время timestamp NOT NULL,
мастер INTEGER NOT NULL,
заказчик INTEGER NOT NULL,
стоимость INTEGER NOT NULL,
завершён BOOLEAN NOT NULL,
услуги INTEGER NOT NULL);

CREATE TABLE lnk_мастер_данные_сотрудника (
id INTEGER PRIMARY KEY NOT NULL,
hub_мастер INTEGER NOT NULL,
hub_данные_сотрудника INTEGER NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE lnk_набор_услуг_услуги (
id INTEGER PRIMARY KEY NOT NULL,
hub_набор_услуг INTEGER NOT NULL,
hub_услуги INTEGER NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE lnk_набор_услуг_заказ (
id INTEGER PRIMARY KEY NOT NULL,
hub_заказ INTEGER NOT NULL,
hub_набор_услуг INTEGER NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE hub_заказ (
id INTEGER PRIMARY KEY NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

CREATE TABLE lnk_заказ_компьютер_мастер_заказчик (
id INTEGER PRIMARY KEY NOT NULL,
hub_заказ INTEGER NOT NULL,
hub_компьютер INTEGER NOT NULL,
hub_мастер INTEGER NOT NULL,
hub_заказчик INTEGER NOT NULL,
load_timestamp timestamp NOT NULL,
record_source varchar(100) NOT NULL);

ALTER TABLE sat_заказчик ADD CONSTRAINT sat_заказчик_id_hub_заказчик_id FOREIGN KEY (id) REFERENCES hub_заказчик(id);

ALTER TABLE hub_мастер ADD CONSTRAINT hub_мастер_id_sat_мастер_id FOREIGN KEY (id) REFERENCES sat_мастер(id);

ALTER TABLE hub_компьютер ADD CONSTRAINT hub_компьютер_id_sat_компьютер_id FOREIGN KEY (id) REFERENCES sat_компьютер(id);

ALTER TABLE hub_данные_сотрудника ADD CONSTRAINT hub_данные_сотрудника_id_sat_данные_сотрудника_id FOREIGN KEY (id) REFERENCES sat_данные_сотрудника(id);

ALTER TABLE hub_услуги ADD CONSTRAINT hub_услуги_id_sat_услуги_id FOREIGN KEY (id) REFERENCES sat_услуги(id);

ALTER TABLE hub_набор_услуг ADD CONSTRAINT hub_набор_услуг_id_sat_набор_услуг_id FOREIGN KEY (id) REFERENCES sat_набор_услуг(id);

ALTER TABLE lnk_мастер_данные_сотрудника ADD CONSTRAINT lnk_мастер_данные_сотрудника_hub_мастер_hub_мастер_id FOREIGN KEY (hub_мастер) REFERENCES hub_мастер(id);

ALTER TABLE lnk_мастер_данные_сотрудника ADD CONSTRAINT lnk_мастер_данные_сотрудника_hub_данные_сотрудника_hub_данные_сотрудника_id FOREIGN KEY (hub_данные_сотрудника) REFERENCES hub_данные_сотрудника(id);

ALTER TABLE lnk_набор_услуг_услуги ADD CONSTRAINT lnk_набор_услуг_услуги_hub_набор_услуг_hub_набор_услуг_id FOREIGN KEY (hub_набор_услуг) REFERENCES hub_набор_услуг(id);

ALTER TABLE lnk_набор_услуг_услуги ADD CONSTRAINT lnk_набор_услуг_услуги_hub_услуги_hub_услуги_id FOREIGN KEY (hub_услуги) REFERENCES hub_услуги(id);

ALTER TABLE lnk_набор_услуг_заказ ADD CONSTRAINT lnk_набор_услуг_заказ_hub_заказ_hub_заказ_id FOREIGN KEY (hub_заказ) REFERENCES hub_заказ(id);

ALTER TABLE lnk_набор_услуг_заказ ADD CONSTRAINT lnk_набор_услуг_заказ_hub_набор_услуг_hub_набор_услуг_id FOREIGN KEY (hub_набор_услуг) REFERENCES hub_набор_услуг(id);

ALTER TABLE hub_заказ ADD CONSTRAINT hub_заказ_id_sat_заказ_id FOREIGN KEY (id) REFERENCES sat_заказ(id);

ALTER TABLE lnk_заказ_компьютер_мастер_заказчик ADD CONSTRAINT lnk_заказ_компьютер_мастер_заказчик_hub_заказ_hub_заказ_id FOREIGN KEY (hub_заказ) REFERENCES hub_заказ(id);

ALTER TABLE lnk_заказ_компьютер_мастер_заказчик ADD CONSTRAINT lnk_заказ_компьютер_мастер_заказчик_hub_компьютер_hub_компьютер_id FOREIGN KEY (hub_компьютер) REFERENCES hub_компьютер(id);

ALTER TABLE lnk_заказ_компьютер_мастер_заказчик ADD CONSTRAINT lnk_заказ_компьютер_мастер_заказчик_hub_мастер_hub_мастер_id FOREIGN KEY (hub_мастер) REFERENCES hub_мастер(id);

ALTER TABLE lnk_заказ_компьютер_мастер_заказчик ADD CONSTRAINT lnk_заказ_компьютер_мастер_заказчик_hub_заказчик_hub_заказчик_id FOREIGN KEY (hub_заказчик) REFERENCES hub_заказчик(id);