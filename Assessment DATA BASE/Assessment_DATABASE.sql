create database Assignment_database;

use Assignment_database;

create table city(
id int,
city_name varchar(200),
lat float(20,6),
long_  float(20,6),
country_id int,
primary key(id),
foreign key(country_id) references country (id)
);


insert into city(id,city_name,lat,long_,country_id)
values 
(1,"Berline",52.520008,13.404954,1),
(2,"Belgrade",44.787197,20.457273,2),
(3,"Zagreb",45.815399,15.966568,3),
(4,"New York",40.730610,-73.935242,4),
(5,"Los Angeles",34.052235,-118.243683,4),
(6,"Warsaw",52.237049,21.017532,5);

create table Customer(
id int,
customer_name varchar(200),
city_id int,
customer_address varchar(250),
next_call_date date,
ts_inserted datetime,
primary key (id),
foreign key(city_id) references city(id)
);

insert into Customer (id,customer_name,city_id,customer_address,next_call_date,ts_inserted)
values
(1,"Jewelry store",4,"Long street 120","2020-01-21","2020-01-09 14:01:00"),
(2,"Bakery",1,"kurfurstendamm 25","2020-02-21","2020-01-09 17:52:15"),
(3,"Cafe",1,"Tauentzienstrabe 44","2020-01-21","2020-01-1008:02:49"),
(4,"Restaurant",3,"Ulca lipa 15","2020-01-21","2020-01-10 09:20:21");

-- update customer set customer_address = "Ulica lipa 15" where customer_address = "Ulca lipa 15";

-- truncate table Customer;

create table Country(
id int,
country_name varchar(100),
country_name_eng varchar(100),
country_code varchar(100),
primary key (id)
);


insert into Country(id,country_name,country_name_eng,country_code)
values
(1,"deutschland","Germany","DEU"),
(2,"Srbija","Serbia","SRB"),
(3,"Hrvatska","Croatia","HRV"),
(4,"United States of America","United States of America","USA"),
(5,"Polska","Polan","POL"),
(6,"Espana","Spain","ESP"),
(7,"Rossiya","Russia","RUS");

/* --> While each city has a related country, not all countries have related cities (Spain & Russia don’t have them)
	   use right join  */
    select country.*,city.* 
    from city 
    right join country 
    on country.id = city.country_id;
    
    select country.*,city.* 
    from country
    left join city
    on country.id = city.country_id;
/*------------------------------------------------*/
			select city.*,country.* 
			from city 
			right join country 
			on city.country_id = country.id;
            
            select city.*, country.*
			from country 
			left join city 
			on city.country_id = country.id;
/*------------------------------------------------*/	
			select country.*,city.* from country right join city on country.id = city.country_id;
    
    -- use inner join
			select country.*,city.* from city inner join country on country.id = city.country_id;
/*------------------------------------------------*/

/* -->	Same stands for the customers. Each customer has the city_id value defined, but only 
      cities are being used (Berlin, Zagreb & New York)   */
      
		SELECT city.id, city.city_name, customer.customer_name, customer.city_id 
		FROM customer 
		right join city 
		on city.id = customer.city_id 
		where city.id = customer.city_id ;

		SELECT city.id, city.city_name, customer.customer_name, customer.city_id 
		FROM city 
		right join customer 
		on city.id = customer.city_id
		order by city.id;

		SELECT city.id, city.city_name, customer.customer_name, customer.city_id 
		FROM city 
		left join customer 
		on city.id = customer.city_id
		order by city.id;
		-- where city.id = customer.city_id ;
        
/* Task : 1 (join multiple tables using left join) */

/*		List all Countries and customers related to these countries. */  
        
        select country.*, city.*, customer.*
        from country 
        left join city
        on country.id = city.country_id
        left join customer
        on city.id = customer.city_id;
		
/*   For each country displaying its name in English, the name of the city customer is located in as well as the name of the customer.  */
  
		select country.country_name_eng, city.city_name, customer.customer_name
        from city 
        left join customer
        on city.id = customer.city_id
        left join country
        on  country.id = city.country_id;
        
/*   Return even countries without related cities and customers.   */ 
		SELECT country.country_name,city.city_name,customer.customer_name
		FROM country
		LEFT JOIN city ON city.country_id = country.id
		LEFT JOIN customer  ON customer.city_id = city.id
		WHERE country.id AND city.id IS NULL AND customer.id IS NULL;

        
/*  Task : 2 (join multiple tables using both left and inner join)   */

   /*  Return the list of all countries that have pairs(exclude countries which are not referenced by any city). 
 For such pairs return all customers.  */
         
        select country.*, city.*
        from country 
        inner join city
        on country.id = city.country_id;
        
       /* select country.*, city.*, customer.*
        from country 
        inner join city
        on country.id = city.country_id
        inner join customer
        on city.id = customer.city_id; */
        
/* Return even pairs of not having a single customer   */
		SELECT country.country_name,city.city_name,customer.customer_name
		FROM country
		left JOIN city ON city.country_id = country.id
		left JOIN customer  ON customer.city_id = city.id
		WHERE country.id AND city.id IS NULL AND customer.id IS NULL;
	
		SELECT country.*,city.*
		FROM country
		left JOIN city ON city.country_id = country.id
		left JOIN customer  ON customer.city_id = city.id
		WHERE (country.id = city.country_id or city.id = customer.city_id);
        
        SELECT country.*,city.*,*
		FROM country
		left JOIN city ON city.country_id = country.id
		left JOIN customer  ON customer.city_id = city.id
		WHERE  city.id = customer.city_id;
