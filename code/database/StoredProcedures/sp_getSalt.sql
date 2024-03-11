DELIMITER //
DROP PROCEDURE IF EXISTS sp_getSalt;

CREATE PROCEDURE sp_getSalt(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_email VARCHAR(255);
    DECLARE stored_salt VARCHAR(255);
    DECLARE stored_userID INT;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "email": {"type": "string"}
                                },
                                "required": ["email"]
                            }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        IF input_email = '' THEN
            SET response_code = 400;
            SET response_message = 'Invalid input';
        ELSE
            SET response_code = 200;
            SET response_message = 'OK';
            SELECT salt,code_PK INTO stored_salt,stored_userID FROM User WHERE email = input_email;
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT('response_code', response_code,
                                'response_message', response_message,
                                'salt', stored_salt,
                                'userID', stored_userID);

END //
DELIMITER ;