update users set email = 'e1@e.com' where id = 5;
update users set email = 'e2@e.com' where id = 6;
update users set email = 'e3@e.com' where id = 7;


CREATE TABLE t (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(30) NOT NULL,
  lastname VARCHAR(30) NOT NULL,
  email VARCHAR(50),
  reg_date TIMESTAMP
)