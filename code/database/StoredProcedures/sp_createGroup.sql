DELIMITER //
DROP PROCEDURE IF EXISTS sp_createGroup;
CREATE PROCEDURE sp_createGroup(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_name VARCHAR(255);
    DECLARE input_userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "name": {"type": "string"},
                                    "userID": {"type": "number"}
                                },
                                "required": ["name", "userID"]
                        }';

   IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        );
    ELSE
        SET input_name = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.name'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));

            INSERT INTO  `Group` (`name`, owner_FK) VALUES (input_name, input_userID);

        SET response_message = 'Group created successfully';
        SET response_code = 200;
        
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        );
    END IF;
END //
DELIMITER ;
