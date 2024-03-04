DELIMITER //
DROP PROCEDURE IF EXISTS sp_getLocationEvents;
CREATE PROCEDURE sp_getLocationEvents(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_locationID INT;
    DECLARE input_userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "locationID": {"type": "number"},
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["locationID", "userID"] 
                        }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
    ELSE
        SET input_locationID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.locationID'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        
        IF EXISTS (SELECT 1 FROM Location WHERE code_PK = input_locationID) THEN
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
                            'ownerName', CONCAT(u.firstName, ' ', u.lastName),
                            'isFavorited', IFNULL((
                                SELECT 1 
                                FROM Favorite 
                                WHERE user_code_favorite_PKFK = input_userID 
                                AND event_code_favorite_PKFK = e.code_PK
                                LIMIT 1
                            ), 0)
                        )
                    )
                )
                FROM Event e
                JOIN User u ON e.owner_FK = u.code_PK
                JOIN Location l ON e.location_FK = l.code_PK
                WHERE l.code_PK = input_locationID
                AND group_view_FK = 1
            );
        ELSE
            SET response_code = 404;
            SET response_message = 'Location not found';
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
        END IF;
    END IF;
END //

DELIMITER ;
