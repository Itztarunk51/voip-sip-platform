CREATE DATABASE IF NOT EXISTS kamailio;
USE kamailio;

CREATE USER IF NOT EXISTS 'kamailio'@'localhost' IDENTIFIED BY 'kamailiorw';
GRANT ALL PRIVILEGES ON kamailio.* TO 'kamailio'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS subscriber (
    username VARCHAR(64) NOT NULL,
    domain VARCHAR(64) NOT NULL,
    password VARCHAR(25) NOT NULL,
    ha1 VARCHAR(128) NOT NULL,
    PRIMARY KEY (username, domain)
);