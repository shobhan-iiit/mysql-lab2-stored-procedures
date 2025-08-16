1. EXECUTE PROCEDURES:
   - Run each SQL file in the following order:
   
   a) q1.sql - Creates ListAllSubscribers() procedure
      - This procedure uses a cursor to iterate through all subscribers
      - Test by calling: CALL ListAllSubscribers();
   
   b) q2.sql - Creates GetWatchHistoryBySubscriber() procedure  
      - Returns all shows watched by a specific subscriber
      - Test by calling: CALL GetWatchHistoryBySubscriber(1);
   
   c) q3.sql - Creates AddSubscriberIfNotExists() procedure
      - Adds new subscriber only if name doesn't already exist
      - Test by calling: CALL AddSubscriberIfNotExists('New User');
   
   d) q4.sql - Creates SendWatchTimeReport() procedure
      - Internally calls GetWatchHistoryBySubscriber() for subscribers with watch history
      - Test by calling: CALL SendWatchTimeReport();
   
   e) q5.sql - Creates LoopThroughAllSubscribersWatchHistory() procedure
      - Uses cursor to loop through all subscribers and show their watch history
      - Test by calling: CALL LoopThroughAllSubscribersWatchHistory();



GIT REPOSITORY LINK:
===================
https://github.com/shobhan-iiit/mysql-lab2-stored-procedures
