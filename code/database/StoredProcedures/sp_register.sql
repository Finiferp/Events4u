DELIMITER //
DROP PROCEDURE IF EXISTS sp_register //
CREATE PROCEDURE sp_register(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(450);
    DECLARE input_firstName VARCHAR(450);
    DECLARE input_lastName VARCHAR(450);
    DECLARE input_email VARCHAR(450);
    DECLARE input_salt VARCHAR(450);	
    DECLARE input_password VARCHAR(450);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "firstName": {"type": "string"},
                                    "lastName": {"type": "string"},
                                    "email": {"type": "string"},
                                    "salt": {"type": "string"},
                                    "password": {"type": "string"}
                                },
                                "required": ["firstName", "lastName", "email", "salt", "password"]
                            }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_firstName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.firstName'));
        SET input_lastName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.lastName'));
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        SET input_salt = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.salt'));
        SET input_password = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.password'));
        IF input_firstName = '' OR input_lastName = '' OR input_email = '' OR input_salt = '' OR input_password = '' THEN
            SET response_code = 400;
            SET response_message = 'Invalid input';
        ELSE
            SET response_code = 200;
            SET response_message = 'OK';
            INSERT INTO User (firstName, lastName, email, salt, password)
            VALUES (input_firstName, input_lastName, input_email, input_salt, input_password);
        END IF;
    END IF;

    SET outputJSON = JSON_OBJECT('status_code', response_code,
                                'message', response_message);

END //
DELIMITER ;