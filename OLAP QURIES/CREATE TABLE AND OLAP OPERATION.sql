USE school;

CREATE table Product_dw
( 
	prod_id int PRIMARY KEY, 
	Prod_name varchar(60) NOT NULL, 
	Prod_category varchar(255) NOT NULL,
	Brand_name varchar(255) NOT NULL,
	Suppl_name varchar(255) NOT NULL,
	Prod_price int 
);

INSERT INTO Product_dw(prod_id,Prod_name,Prod_category,Brand_name, Suppl_name, 
Prod_price)
	VALUES (1, 'Rice', 'Grocery', 'Dawat','Ramesh',140 );

INSERT INTO Product_dw (prod_id,Prod_name,Prod_category,Brand_name, Suppl_name, 
Prod_price)
	VALUES (2, 'Sugar', 'Grocery', 'Dawat','Ramesh',50 );

INSERT INTO Product_dw (prod_id,Prod_name,Prod_category,Brand_name, Suppl_name, 
Prod_price)
	VALUES (3, 'Kurta', 'Cloth', 'Max','Lila',500 );

INSERT INTO Product_dw (prod_id,Prod_name,Prod_category,Brand_name, Suppl_name, 
Prod_price)
	VALUES (4, 'jacket', 'Cloth', 'Max','Lila',700 );

SELECT * FROM PRODUCT_DW;

CREATE table Time_dw
( 
time_id int PRIMARY KEY, 
day DATE NOT NULL, 
month varchar(255) NOT NULL,
qt varchar(255) NOT NULL,
yr varchar(255) NOT NULL
);

INSERT INTO Time_dw(time_id,day, month,qt,yr)
	VALUES (101,DATE '2021-1-17', 'january', 'Q1','2021'),
		(102, DATE '2021-2-14', 'february', 'Q1','2021'),
		(103, DATE '2021-5-21', 'may', 'Q2','2021'),
		(104, DATE '2021-6-26', 'june', 'Q2','2021');
        
SELECT * FROM TIME_DW;


CREATE table Location_dw
( 
	loc_id int PRIMARY KEY, 
	street varchar(60) NOT NULL, 
	city varchar(255) NOT NULL,
	state varchar(255) NOT NULL,
	country varchar(255) NOT NULL
);


INSERT INTO Location_dw(loc_id,street,city,state,country)
	VALUES (201,'ML ROAD','MUMBAI','MAHARASHTRA','INDIA'),
		(202,'AI ROAD','MUMBAI','MAHARASHTRA','INDIA'),
		(203,'BI ROAD','KOLKATA','WEST BENGAL','INDIA'),
		(204,'DB ROAD','KOLKATA','WEST BENGAL','INDIA');

SELECT * FROM LOCATION_DW;


CREATE table Fact_sales
( 
	prod_id int REFERENCES Product_dw(prod_id),
	time_id int REFERENCES Time_dw(time_id),
	loc_id int REFERENCES Location_dw(loc_id),
	number_of_unit_sold int NOT NULL,
	Total_sales int NOT NULL
);

INSERT INTO Fact_sales(prod_id,time_id,loc_id,number_of_unit_sold,Total_sales)
	VALUES (1,101,201,400,80000),
		(1,102,201,400,90000),
		(1,103,201,400,70000),
		(1,104,201,400,90000);

SELECT * FROM FACT_SALES;


-- SLICE --!>
SELECT 
	Prod_name ,Total_sales
	FROM Fact_sales
	INNER JOIN Product_dw
	ON Fact_sales.prod_id = Product_dw.prod_id
	WHERE prod_name='Rice';


-- ROLL-UP --!>
SELECT 
	yr, 
    SUM(total_sales)
	FROM (Fact_sales 
	NATURAL JOIN 
	Product_dw)
	JOIN Time_dw 
	ON Fact_sales.time_id=Time_dw.time_id
	WHERE Prod_name='Rice' 
	GROUP BY yr;
    
    
-- DICE --!>
SELECT 
	Prod_name ,
    Fact_sales.total_sales 
    FROM ((Product_dw 
    INNER JOIN 
	Fact_sales 
    ON Product_dw.prod_id=Fact_sales.prod_id) 
    JOIN Time_dw 
    ON Fact_sales.time_id=Time_dw.time_id) 
    WHERE Prod_name='Rice' AND (qt='Q1');

 
-- DRILL DOWN --!>    
    
SELECT 
	yr,
    SUM(total_sales) 
    FROM (Fact_sales 
    NATURAL JOIN 
	Product_dw)
    JOIN Time_dw 
    ON Fact_sales.time_id=Time_dw.time_id
	WHERE Prod_name='Rice' 
    GROUP BY yr; 
    
    
    
    
