USE OTT;


DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE subscriber_count INT DEFAULT 0;
    DECLARE new_subscriber_id INT;
    
    SELECT COUNT(*) INTO subscriber_count 
    FROM Subscribers 
    WHERE SubscriberName = subName;
    
    IF subscriber_count = 0 THEN
        
        SELECT COALESCE(MAX(SubscriberID), 0) + 1 INTO new_subscriber_id FROM Subscribers;
        
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) 
        VALUES (new_subscriber_id, subName, CURDATE());
        
        SELECT CONCAT('Subscriber "', subName, '" added successfully with ID: ', new_subscriber_id);
    ELSE
        SELECT CONCAT('Subscriber "', subName, '" already exists!');
    END IF;
END$$

DELIMITER ;


CALL AddSubscriberIfNotExists('John Doe');
CALL AddSubscriberIfNotExists('Emily Clark');
