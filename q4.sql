USE OTT;



DELIMITER $$

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
   
    SELECT 
        s.SubscriberName,
        sh.Title AS ShowTitle,
        sh.Genre,
        sh.ReleaseYear,
        w.WatchTime
    FROM WatchHistory w
    INNER JOIN Shows sh ON w.ShowID = sh.ShowID
    INNER JOIN Subscribers s ON w.SubscriberID = s.SubscriberID
    WHERE w.SubscriberID = sub_id;

END$$

DELIMITER ;













DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE sub_name VARCHAR(100);
    
  
    DECLARE subscriber_cursor CURSOR FOR 
        SELECT DISTINCT s.SubscriberID, s.SubscriberName
        FROM Subscribers s
        INNER JOIN WatchHistory w ON s.SubscriberID = w.SubscriberID
        ORDER BY s.SubscriberID;
    
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
  
    OPEN subscriber_cursor;
    
    
    read_loop: LOOP
        FETCH subscriber_cursor INTO sub_id, sub_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        
        SELECT CONCAT('Watch History for: ', sub_name, ' (ID: ', sub_id, ') -') ;
        
        CALL GetWatchHistoryBySubscriber(sub_id);
        
        
    END LOOP;
    
   
    CLOSE subscriber_cursor;
    
END$$

DELIMITER ;


CALL SendWatchTimeReport();
