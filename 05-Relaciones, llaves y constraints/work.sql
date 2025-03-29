SELECT *
from country;

BEGIN TRANSACTION;
DELETE
FROM country
where code = 'NLD'
  AND code2 = 'NA';

ROLLBACK;

COMMIT;

ALTER TABLE country
    ADD PRIMARY KEY (code);

ALTER TABLE country
    add CHECK (
        surfacearea >= 0
        );

ALTER TABLE country
    add CHECK (
        (continent = 'Asia') OR
        (continent = 'South America') OR
        (continent = 'North America') OR
        (continent = 'Oceania') OR
        (continent = 'Antarctica') OR
        (continent = 'Africa') OR
        (continent = 'Europe') OR
        (continent = 'Central America')
        );

select *
from country
where code = 'CRI';

UPDATE country
SET continent = 'Central America'
where code = 'CRI';

ALTER TABLE country
    drop CONSTRAINT country_continent_check;

explain analyze select * from country where continent = 'Africa';

create unique index "unique_country_name" on country (name);

create index  "country_continent" on country (
                                             continent
    );


create unique index "unique_name_countrycode_district" on city (
                                                               name,countrycode, district
    );

SELECT * from city where name = 'Jinzhou' and countrycode = 'CHN' and district = 'Liaoning';

ALTER TABLE city
    ADD CONSTRAINT  fk_country_code
    FOREIGN KEY (countrycode)
    REFERENCES  country(code);

SELECT  * from country where code = 'AFG';

INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');


ALTER TABLE countrylanguage
ADD CONSTRAINT fk_country_code
FOREIGN KEY (countrycode)
REFERENCES country(code);