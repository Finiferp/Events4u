DELIMITER //
DROP PROCEDURE IF EXISTS sp_getEvent;
CREATE PROCEDURE sp_getEvent(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_eventId INT;
    DECLARE input_activeUser INT;
    DECLARE isFavorited INT DEFAULT 0;
    DECLARE isAttending INT DEFAULT 0;
    DECLARE isInterested INT DEFAULT 0;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data TEXT;
    DECLARE v_JSONSchema JSON;
    
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventId": {"type": "integer"},
                                    "activeUser": {"type": "integer"}
                                }, 
                                "required": ["eventId", "activeUser"] 
                        }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_OBJECT());
    ELSE
        SET input_eventId = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventId'));
        SET input_activeUser = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.activeUser'));
        SET response_code = 200;
        SET response_message = 'Success';

        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Favorite WHERE user_code_favorite_PKFK = input_activeUser AND event_code_favorite_PKFK = input_eventId) THEN
            SET isFavorited = 1;
        ELSE
            SET isFavorited = 0;
        END IF;

        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Attends WHERE user_code_attends_PKFK = input_activeUser AND event_code_attends_PKFK = input_eventId) THEN
            SET isAttending = 1;
        ELSE
            SET isAttending = 0;
        END IF;

        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Interested WHERE user_code_interested_PKFK = input_activeUser AND event_code_interested_PKFK = input_eventId) THEN
            SET isInterested = 1;
        ELSE
            SET isInterested = 0;
        END IF;

        SET outputJSON = (
            SELECT JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', JSON_OBJECT(
                    'eventCode', e.code_PK,
                    'eventTitle', e.title,
                    'startDateTime', e.startDateTime,
                    'endDateTime', e.endDateTime,
                    'eventPrice', e.price,
                    'eventLocation', l.adress,
                    'eventLocationCode', e.location_FK,
                    'eventImage', e.imageUrl,
                    'isVisible', e.isVisible,
                    'ownerName', CONCAT(u.firstName, ' ', u.lastName),
                    'isFavorited', isFavorited,
                    'isAttending', isAttending,
                    'isInterested', isInterested,
                    'categories', (
                        SELECT JSON_ARRAYAGG(c.label)
                        FROM Category c
                        JOIN Belongs b ON c.code_PK = b.category_code_belongs_PKFK
                        WHERE b.event_code_belongs_PKFK = e.code_PK
                    )
                )
            )
            FROM Event e
            JOIN User u ON e.owner_FK = u.code_PK
            JOIN Location l ON e.location_FK = l.code_PK
            WHERE e.code_PK = input_eventId
        );
    END IF;
END //
DELIMITER ;
