CREATE DEFINER=`root`@`localhost` PROCEDURE `getorder`(
IN USER_ID INT,
 IN PRODUCT_ID INT,
 IN QUANTITY INT,
 IN PRICE INT,
 IN DISCOUNT INT,
 IN ORDER_ID INT,
 OUT MESSAGE varchar(100)
 )
BEGIN
	DECLARE `exception_occured` BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `exception_occured` = TRUE;
    SET autocommit=0;
    START TRANSACTION;
		
        INSERT INTO flipkart.order_list (user_id, product_id, quantity, price, discount) values(USER_ID, PRODUCT_ID, QUANTITY, PRICE, DISCOUNT);
        INSERT INTO flipkart.delivery_list (order_id, status) values (ORDER_ID, 'DELIVERABLE');
	
    IF `exception_occured` THEN
		SET MESSAGE = 'Server error, Please try again later..';
		ROLLBACK;
	ELSE
		SET MESSAGE = 'Order Success';
		COMMIT;
	END IF;
END