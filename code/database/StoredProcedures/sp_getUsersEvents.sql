DELIMITER //
DROP PROCEDURE IF EXISTS sp_getUserEvents;
CREATE PROCEDURE sp_getUserEvents(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["userID"] 
                        }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        
        IF EXISTS (SELECT 1 FROM User WHERE code_PK = input_userID) THEN
            SET response_code = 200;
            SET response_message = 'Success';
            SET outputJSON = (
                SELECT JSON_OBJECT(
                    'status_code', response_code,
                    'message', response_message,
                    'data', JSON_ARRAYAGG(
                        JSON_OBJECT(
                            'eventCode', e.code_PK,
                            'eventTitle', e.title,
                            'startDateTime', e.startDateTime,
                            'endDateTime', e.endDateTime,
                            'eventPrice', e.price,
                            'eventLocation', l.adress,
                            'eventLocationCode', e.location_FK,
                            'eventImage', e.imageUrl,
                            'isVisible', e.isVisible,
                            'ownerName', CONCAT(u.firstName, ' ', u.lastName)
                        )
                    )
                )
                FROM Event e
                JOIN User u ON e.owner_FK = u.code_PK
                JOIN Location l ON e.location_FK = l.code_PK
                WHERE u.code_PK = input_userID
            );
        ELSE
            SET response_code = 404;
            SET response_message = 'User not found';
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
        END IF;
    END IF;
END //

DELIMITER ;
