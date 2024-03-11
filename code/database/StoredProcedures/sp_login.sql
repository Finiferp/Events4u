DELIMITER //
DROP PROCEDURE IF EXISTS sp_login //
CREATE PROCEDURE sp_login(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_email VARCHAR(450);
    DECLARE input_password VARCHAR(450);
    DECLARE input_token VARCHAR(450);
    DECLARE stored_password VARCHAR(450);
    DECLARE stored_userID INT;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "email": {"type": "string"},
                                    "password": {"type": "string"},
                                    "token": {"type": "string"}
                                },
                                "required": ["email", "password"]
                            }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        SET input_password = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.password'));
        SET input_token = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.token'));	

        IF NOT EXISTS (SELECT 1 FROM User WHERE email = input_email) THEN
            SET response_code = 404;
            SET response_message = 'User not found';
        ELSE
            SELECT code_PK, password INTO stored_userID, stored_password FROM User WHERE email = input_email;

            IF input_password = stored_password THEN
                INSERT INTO Token (type, user_FK) VALUES (input_token, stored_userID);

                SET response_code = 200;
                SET response_message = 'Login successful';
            ELSE
                SET response_code = 401;
                SET response_message = 'Wrong password';
            END IF;
        END IF;
    END IF;

    IF response_code = 200 THEN
        SET outputJSON = JSON_OBJECT(
                                'status_code', response_code,
                                'message', response_message,
                                'user', JSON_OBJECT(
                                    'userID', stored_userID,
                                    'email', input_email
                                ),
                                'token_out', input_token
                            );
    ELSE
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message);
    END IF;
END //
DELIMITER ;
