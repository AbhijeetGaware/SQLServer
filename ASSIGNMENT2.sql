
-------------1 SALES.CUSTOMERS DESC-------------------------

SELECT first_name FROM SALES.customers ORDER BY first_name DESC;

-------------2 DISPLAY THE CUSTOMER DETAILS---------------------

SELECT first_name,last_name FROM sales.customers ORDER BY city,first_name 

------------3 TOP 3 PRODUCTS ------------------------------------

SELECT  TOP(3)LIST_PRICE,product_name FROM  PRODUCTION.PRODUCTS ORDER BY LIST_PRICE,product_name 

------------4 FIND PRODUCTS GREATER THAN USING AND-------------------------

SELECT list_price,model_year FROM production.products  WHERE list_price>300 AND model_year=2018

------------5 FIND PRODUCTS GREATER THAN USING OR--------------------------------------

SELECT list_price,model_year FROM production.products WHERE list_price>3000 OR model_year=2018


-------------6 PRODUCTS IN BETWEEN ------------------------------------------------------

SELECT PRODUCT_NAME,list_price FROM production.products WHERE LIST_PRICE BETWEEN 1899 AND 1999.99


-------------7 USING IN OPERATOR LIST PRICE-----------------------------------------------

SELECT product_name,list_price FROM production.products WHERE list_price IN (299.99 , 466.99 , 489.99)


-------------8  FIRST CHAR IN THE LAST ----------------------------------------------------

SELECT first_name,city,last_name FROM sales.customers WHERE last_name LIKE '[ABC]%'

-------------9 NOT LIKE FIRST CHAR IN THE FIRST NAME --------------------------------------

SELECT customer_id, first_name,last_name FROM sales.customers WHERE first_name NOT LIKE '[A]%'

------------10 RETURN THE NUMBER OF CUST BY STATE --------------------------------------------

SELECT  count(customer_id) customer_count FROM SALES.customers  state Group by state,city


--------------11  ORDERED PLACED BY CUSTOMERS ------------------------------------------------


SELECT customer_id,YEAR(order_date)'YEAR', COUNT(ORDER_ID)AS PLACED_ORDERS_COUNT FROM SALES.orders GROUP BY CUSTOMER_ID ,YEAR(ORDER_DATE)

------------12  MAXIMUM AND MINIMUM GROUP BY CATEGORY ID0-----------------------------------------

SELECT category_id , MAX(list_price)AS MAX_LISTPRICE, MIN(list_price)AS MIN_LISTPRICE FROM production.products GROUP BY category_id 
HAVING MAX (list_price)>4000 OR MIN (list_price)<500