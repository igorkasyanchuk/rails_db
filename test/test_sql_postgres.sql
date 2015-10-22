update users set age = 1 where id = 5;
update users set age = 2 where id = 6;
update users set age = 3 where id = 7;

CREATE TABLE t (
    code        char(5) PRIMARY KEY,
    title       varchar(40) NOT NULL,
    did         integer NOT NULL,
    date_prod   date,
    kind        varchar(10),
    len         interval hour to minute
);