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


CALL GetWatchHistoryBySubscriber(1);
