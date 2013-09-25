# Create SonarQube database and user.
#
# Command: mysql -u root -p < create_database.sql
#
# See: https://github.com/SonarSource/sonar-examples/blob/master/scripts/database/mysql/create_database.sql

CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER 'sonar' IDENTIFIED BY 'sonar';
GRANT ALL ON sonar.* TO 'sonar'@'%' IDENTIFIED BY 'sonar';
GRANT ALL ON sonar.* TO 'sonar'@'localhost' IDENTIFIED BY 'sonar';
FLUSH PRIVILEGES;