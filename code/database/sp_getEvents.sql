DELIMITER //
DROP PROCEDURE IF EXISTS sp_getEvents;
CREATE PROCEDURE sp_getEvents(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data text;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR 
        SELECT e.code_PK, e.title, e.startDateTime, e.endDateTime, e.price, e.location, e.owner_FK, u.firstName, u.lastName
        FROM Event e
        JOIN User u ON e.owner_FK = u.code_PK;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    
    SET response_code = 200;
    SET response_message = 'Success';

        SET outputJSON = (SELECT JSON_OBJECT( 
            'status_code', response_code, 
            'message', response_message, 
            'data', JSON_ARRAYAGG (
                        JSON_OBJECT(
                            'eventCode', e.code_PK,
                            'eventTitle', e.title,
                            'startDateTime', e.startDateTime,
                            'endDateTime', e.endDateTime,
                            'eventPrice', e.price,
                            'eventLocation', e.location,
                            'eventImage', e.imageUrl,
                            'ownerName', CONCAT(u.firstName, ' ', u.lastName)
                        )
    )) FROM Event e
        JOIN User u ON e.owner_FK = u.code_PK);
    
    CLOSE cur;
END //
DELIMITER ;