CREATE PROCEDURE `getorder`(
IN USER_ID INT,
 IN PRODUCT_ID INT,
 IN QUANTITY INT,
 IN PRICE INT,
 IN DISCOUNT INT,
 IN ORDER_ID INT,
 OUT MESSAGE varchar(100)
 )
BEGIN
	DECLARE `exception_occured` BOOLEAN DEFAULT TRUE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
    BEGIN
		SET MESSAGE = 'Server error, Please try again later..';
        SET exception_occured = FALSE;
        ROLLBACK TO SP1;
    END;
    SET autocommit=0;
    START TRANSACTION;
		SAVEPOINT SP1;
			INSERT INTO flipkart.order_list (user_id, product_id, quantity, price, discount) values(USER_ID, PRODUCT_ID, QUANTITY, PRICE, DISCOUNT);
        SAVEPOINT SP2;
			INSERT INTO flipkart.delivery_list (order_id, status) values (ORDER_ID, 'DELIVERABLE');
	
    IF `exception_occured` THEN
		SET MESSAGE = 'Order Success';
		COMMIT;
	END IF;
END