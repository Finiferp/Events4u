DELIMITER //
DROP PROCEDURE IF EXISTS sp_getUserFavorites;
CREATE PROCEDURE sp_getUserFavorites(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_userID INT;
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

        IF NOT EXISTS (SELECT 1 FROM `User` WHERE code_PK = input_userID) THEN
            SET response_code = 404;
            SET response_message = 'User not found';
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
        ELSE
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
                            'eventIsVisible', e.isVisible,
                            'ownerName', CONCAT(u.firstName, ' ', u.lastName)
                        )
                    )
                )
                FROM Event e
                JOIN User u ON e.owner_FK = u.code_PK
                JOIN Favorite f ON e.code_PK = f.event_code_favorite_PKFK
                JOIN Location l ON e.location_FK = l.code_PK
                WHERE f.user_code_favorite_PKFK = input_userID
            );
        END IF;
    END IF;
END //
DELIMITER ;
