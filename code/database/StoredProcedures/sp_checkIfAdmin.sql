DELIMITER //

DROP PROCEDURE IF EXISTS sp_checkIfAdmin;

CREATE PROCEDURE sp_checkIfAdmin(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_activeUser INT;
    DECLARE response_code INT;
    DECLARE isAdminStatus INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "activeUser": {"type": "number"}
                                }, 
                                "required": ["activeUser"] 
                        }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_OBJECT());
    ELSE
        SET input_activeUser = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.activeUser'));
        SET response_code = 200;
        SET response_message = 'Success';

        SELECT isAdmin INTO isAdminStatus FROM `User` WHERE code_PK = input_activeUser;
        
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message,
                                    'data', JSON_OBJECT(
                                        'isAdmin', isAdminStatus
                                    )
                                );
    END IF;

END //

DELIMITER ;