DELIMITER //
DROP PROCEDURE IF EXISTS sp_getEvent;
CREATE PROCEDURE sp_getEvent(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_eventId INT;
    DECLARE input_activeUser INT;
    DECLARE isFavorited INT DEFAULT 0;
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
                    'eventLocation', e.location,
                    'eventImage', e.imageUrl,
                    'ownerName', CONCAT(u.firstName, ' ', u.lastName),
                    'isFavorited', isFavorited,
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
            WHERE e.code_PK = input_eventId
        );
    END IF;
END //
DELIMITER ;
