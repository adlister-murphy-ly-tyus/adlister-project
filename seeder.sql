USE adlister_db;

CREATE USER IF NOT EXISTS 'billy'@'localhost' IDENTIFIED BY 'billysSecretP@ass123';
GRANT ALL ON adlister_db TO 'billy'@'localhost' WITH GRANT OPTION;