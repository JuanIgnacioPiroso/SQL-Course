select *
from users;

SELECT name,
       substring(name, 0, 5),
       position(' ' in name),
       substring(name, 0, position(' ' in name)) as first_name,
       substring(name, position(' ' in name) + 1) as last_name
from users;

alter table users
    add last_name varchar(100);

COMMIT;

UPDATE users
set
    first_name = substring(name, 0, position(' ' in name)),
    last_name = substring(name, position(' ' in name) + 1)