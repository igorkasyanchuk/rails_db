update users set email = 'e1@e.com' where id = 1;
update users set email = 'e2@e.com' where id = 2;
update users set email = 'e3@e.com' where id = 3;

CREATE TABLE films1 (
    code        char(5) PRIMARY KEY,
    title       varchar(40) NOT NULL,
    did         integer NOT NULL,
    date_prod   date,
    kind        varchar(10),
    len         interval hour to minute
);