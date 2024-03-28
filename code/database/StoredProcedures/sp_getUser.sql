DELIMITER //

DROP PROCEDURE IF EXISTS sp_getUser //

CREATE PROCEDURE sp_getUser(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{ "type": "object",
                            "properties": {
                                "userID": { "type": "number" }
                            },
                            "required": ["userID"]
                        }';
    
    IF NOT JSON_SCHEMA_VALID(inputJSON, v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON';
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF input_userID IS NULL THEN
            SET response_code = 400;
            SET response_message = 'Missing user ID';
        ELSE
            SET response_code = 200;
            SET response_message = 'Success';
           SELECT JSON_OBJECT(
                'userID', code_PK, 
                'firstName', firstName, 
                'lastName', lastName,
                'email', email,
                'isAdmin', isAdmin,
                'acceptsNotifications', acceptsNotifications,
                'haveConcent', haveConcent 
            )
            INTO response_data
            FROM User
            WHERE code_PK = input_userID;
        END IF;
    END IF;

    SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message,
                                    'data', response_data);
END //
DELIMITER ;