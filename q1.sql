USE OTT;

DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
   
    DECLARE done INT DEFAULT 0;
    DECLARE subscriber_name VARCHAR(100);
    
    
    DECLARE subscriber_cursor CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;
    
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    
    OPEN subscriber_cursor;
    
    REPEAT
	  FETCH subscriber_cursor INTO subscriber_name;
      IF NOT done THEN
         SELECT subscriber_name;
         
	  END IF;
    UNTIL done END REPEAT;
    
    
    CLOSE subscriber_cursor;
END$$

DELIMITER ;


CALL ListAllSubscribers();
