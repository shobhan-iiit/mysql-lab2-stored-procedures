USE OTT;

DELIMITER $$

CREATE PROCEDURE LoopThroughAllSubscribersWatchHistory()
BEGIN
    
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE sub_name VARCHAR(100);
    DECLARE has_history INT DEFAULT 0;
    
    
    DECLARE subscriber_cursor CURSOR FOR 
        SELECT SubscriberID, SubscriberName 
        FROM Subscribers 
        ORDER BY SubscriberID;
    
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    
    
    -- Open cursor
    OPEN subscriber_cursor;
    
    
    read_loop: LOOP
        FETCH subscriber_cursor INTO sub_id, sub_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        
        SELECT COUNT(*) INTO has_history 
        FROM WatchHistory 
        WHERE SubscriberID = sub_id;
        
        
        SELECT CONCAT('Subscriber: ', sub_name, ' (ID: ', sub_id, ') =') ;
        
        IF has_history > 0 THEN
            CALL GetWatchHistoryBySubscriber(sub_id);
        ELSE
            SELECT 'No watch history found for this subscriber.';
        END IF;
        
        
    END LOOP;
    
    CLOSE subscriber_cursor;
    
END$$

DELIMITER ;


CALL LoopThroughAllSubscribersWatchHistory();
