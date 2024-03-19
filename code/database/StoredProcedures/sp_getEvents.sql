DELIMITER //

DROP PROCEDURE IF EXISTS sp_getEvents;

CREATE PROCEDURE sp_getEvents(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_activeUser INT;
    DECLARE currentEventID INT;
    DECLARE isFavorited INT;
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE done INT DEFAULT FALSE;

    DECLARE cur CURSOR FOR 
        SELECT e.code_PK
        FROM Event e;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "activeUser": {"type": "number"}
                                }, 
                                "required": ["activeUser"] 
                        }';

    OPEN cur;
    FETCH cur INTO currentEventID;

    SET input_activeUser = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.activeUser'));
    SET response_code = 200;
    SET response_message = 'Success';
    SET response_data = JSON_ARRAY();

    eventLoop: LOOP
        IF done THEN
            LEAVE eventLoop;
        END IF;

        -- Check if event is favorited
        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Favorite WHERE user_code_favorite_PKFK = input_activeUser AND event_code_favorite_PKFK = currentEventID) THEN
            SET isFavorited = 1;
        ELSE
            SET isFavorited = 0;
        END IF;

        SET response_data = JSON_ARRAY_APPEND(response_data, '$', JSON_OBJECT(
            'eventCode', currentEventID,
            'eventTitle', (SELECT title FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'startDateTime', (SELECT startDateTime FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'endDateTime', (SELECT endDateTime FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'eventPrice', (SELECT price FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'eventIsVisible', (SELECT isVisible FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'eventLocation', (SELECT l.adress FROM Location l JOIN Event e ON e.location_FK = l.code_PK WHERE e.code_PK = currentEventID AND group_view_FK = 1),
            'eventImage', (SELECT imageUrl FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'ownerName', (SELECT CONCAT(firstName, ' ', lastName) FROM User WHERE code_PK = (SELECT owner_FK FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1)),
            'isFavorited', isFavorited
        ));

        FETCH cur INTO currentEventID;
    END LOOP eventLoop;
    CLOSE cur;

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code, 
        'message', response_message, 
        'data', response_data
    );
END //

DELIMITER ;
