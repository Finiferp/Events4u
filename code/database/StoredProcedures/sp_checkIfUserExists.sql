DELIMITER //

DROP PROCEDURE IF EXISTS sp_checkIfUserExists //

CREATE PROCEDURE sp_checkIfUserExists(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_email VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "email": {"type": "string"}
                                },
                                "required": ["email"]
                        }';
        IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
            SET outputJSON = JSON_OBJECT(
                'status_code', 400,
                'message', 'Invalid JSON format or structure'
            );
        ELSE
            SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
            IF EXISTS(SELECT * FROM User WHERE email = input_email) THEN
                SET outputJSON = JSON_OBJECT(
                    'status_code', 200,
                    'message', 'User exists'
                );
            ELSE
                SET outputJSON = JSON_OBJECT(
                    'status_code', 404,
                    'message', 'User does not exist'
                );
            END IF;
        END IF;

END //

DELIMITER ;