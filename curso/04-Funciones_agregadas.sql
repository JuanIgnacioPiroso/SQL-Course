-- Operador BETWEEN y order by

select * from users;

SELECT first_name, last_name, followers
FROM users
WHERE --followers >= 4600 AND followers <=4700
      followers BETWEEN 4600 AND 4700
ORDER BY followers;

-- Operador MAX, MIN, COUNT, ROUND, AVG

SELECT count(*)              AS total_users,
       MIN(followers)        AS min_followers,
       MAX(followers)        AS max_followers,
       ROUND(AVG(followers)) AS avg_followers
from users;

-- Operador GROUP BY

SELECT count(*), followers
FROM users
WHERE followers = 4
   or followers = 4999
GROUP BY followers;

-- Funcion HAVING

SELECT count(*) as total, country
FROM users
GROUP BY country
HAVING count(*) > 5
ORDER BY count(*) DESC;

-- Funcion DISTINCT

SELECT DISTINCT country
FROM USERS;

SELECT count(*),
       substring(email, position('@' in email) + 1) as domain
from users
group by substring(email, position('@' in email) + 1)
having count(*) > 1
order by substring(email, position('@' in email) + 1);