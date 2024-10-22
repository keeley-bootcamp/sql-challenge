-- World questions

use world;
-- 1. Using COUNT, get the number of cities in the USA
select count(*) as cities from city where CountryCode = 'USA';

-- 2. Find out the population and life expectancy for people in Argentina
select Population, LifeExpectancy from country where Name = 'Argentina';

-- 3. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
select Name, LifeExpectancy from country
order by LifeExpectancy desc
limit 1;

-- 4. Using JOIN ... ON, find the capital city of Spain
select city.name from city 
join country on city.ID = country.capital
where country.Name = 'Spain';

-- 5. Using JOIN ... ON, list all the languages spoken in the Southeast Asia region
select countrylanguage.Language from countrylanguage
join country on countrylanguage.CountryCode = country.Code
where region = 'Southeast Asia';

-- 6. Using a single query, list 25 cities around the world that start with the letter F
select Name from city where Name like 'F%' limit 25;

-- 7. Using COUNT and JOIN ... ON, get the number of cities in China
select count(city.Name) from city
join country on city.CountryCode = country.Code
where country.Name = 'China';

-- 8. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations
select Name, Population from country where Population is not null
order by Population 
limit 1;

-- 9. Using aggregate functions, return the number of countries the database contains
select count(*) from country;

-- 10. What are the top ten largest countries by area?
select Name, SurfaceArea from country 
order by SurfaceArea desc
limit 10;

-- 11. List the five largest cities by population in Japan
select city.Name, city.Population from city
join country on city.CountryCode = country.Code
where country.Name = 'Japan'
order by Population desc
limit 5;

-- 12. List the names and country codes of every country with Elizabeth II as its Head of State. 
-- You will need to fix the mistake first!
select Name, Code from country where HeadOfState = 'Elisabeth II';

-- 13. List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0
select Name from country where Population / SurfaceArea > 0
order by Population / SurfaceArea
limit 10;

-- 14. List every unique world language
select distinct Language from countrylanguage;

-- 15. List the names and GNP of the world's top 10 richest countries
select Name, GNP from country
order by GNP desc
limit 10;

-- 16. List the names of, and number of languages spoken by, the top ten most multilingual countries
select country.Name, count(countrylanguage.CountryCode) as num_of_languages from country
join countrylanguage on country.Code = countrylanguage.CountryCode
group by country.Name
order by num_of_languages desc
limit 10;

-- 17. List every country where over 50% of its population can speak German
select country.Name, countrylanguage.Percentage from country
join countrylanguage on country.Code = countrylanguage.CountryCode
where countrylanguage.Percentage > 50 and countrylanguage.Language = 'German';

-- 18. Which country has the worst life expectancy? Discard zero or null values
select * from country where LifeExpectancy is not null and LifeExpectancy != 0
order by LifeExpectancy
limit 1;

-- 19. List the top three most common government forms
select GovernmentForm, count(GovernmentForm) as govcount from country
group by GovernmentForm
order by govcount desc
limit 3;

-- 20. How many countries have gained independence since records began?
select count(InDepYear) from country where InDepYear is not null;

