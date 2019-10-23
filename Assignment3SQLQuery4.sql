

--1)-------------------CREATE A VIEW SALESINFO-ORDERS,ORDER_ITEMS,------------------------------

CREATE VIEW SALES_INFO
AS

SELECT PP.product_id,PP.product_name,SOI.order_id,SOI.item_id,
SO.order_status,SO.order_date,SO.required_date,SO.shipped_date,SO.store_id,SO.staff_id,SOI.product_id,SO.order_id
  FROM production.products PP INNER JOIN sales.order_items SOI ON PP.product_id = SOI.product_id INNER JOIN sales.orders SO ON
 SOI.order_id = SO.order_id


--2)------------------------------------------------------------CREAE A STAFF_SALES----------------------------------
--CC.category_id,LL.list_price,BB.brand_id,MM.model_year,QQ.quantity,DD.discount,CC.customer_id,
CREATE VIEW STAFF_SALES
AS
 SELECT SS.first_name,SS.last_name,SUM(SOI.QUANTITY*LIST_PRICE) AS 'TOTAL ORDER_ITEMS' FROM sales.order_items SOI INNER JOIN sales.orders SO ON  SOI.order_id =SO.order_id
 INNER JOIN sales.staffs SS ON SS.staff_id = SO.staff_id GROUP BY SS.first_name,SS.last_name

-3)------------------------------- STORE PROCUDURE-------------------------------------------------------------------------

 CREATE PROCEDURE USP_ADD_STORE
  @ADD_STORE VARCHAR(50),
  @STORE_COUNT INT OUTPUT
  AS
 
  BEGIN
  INSERT INTO sales.stores (store_name) VALUES ( @ADD_STORE)
  SELECT @STORE_COUNT=COUNT(*) FROM sales.stores
  RETURN @STORE_COUNT
END;

 DECLARE @COUNT INT;
 EXEC USP_ADD_STORE
 @ADD_STORE ='SANTA CRUZ BIKES',
 @STORE_COUNT=@COUNT OUTPUT

SELECT @COUNT AS 'STORE COUNT'



-----------------USP_STORE-WISE----SALES----------------------------

CREATE PROCEDURE USP_STORE_WISE_SALES
AS
BEGIN 
SELECT SS.store_id,SS.store_name,SS.city, COUNT(order_id) AS 'ORDER COUNT' FROM sales.stores SS INNER JOIN sales.orders SO ON SS.store_id = SO.STORE_ID
GROUP BY SS.store_id,SS.city, SS.store_name
END

EXEC USP_STORE_WISE_SALES

--------------------------------------------------UDF_avg_QAL-----------------------------------------------------------------------------

CREATE FUNCTION SALES.UDF_AVG_QTY(
@CUSTOMER_ID INT,
@YEAR        INT
)
RETURNS INT
AS
BEGIN
DECLARE @COUNT INT
       SELECT @COUNT=SUM(quantity*list_price) FROM sales.order_items
	   RETURN @COUNT
END;

(SELECT  sales.UDF_AVG_QTY(17,2016)AS 'COUNT')


