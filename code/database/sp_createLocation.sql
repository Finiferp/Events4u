DELIMITER //

DROP PROCEDURE IF EXISTS sp_createLocation;

CREATE PROCEDURE sp_createLocation(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);

    DECLARE input_adress VARCHAR(450);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "adress": {"type": "string"}
                                }, 
                                "required": ["adress"] 
                        }';
    


    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_adress = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.adress'));

        INSERT INTO Location (adress) 
        VALUES (input_adress);

        SET response_message = 'Adress created successfully';
        SET response_code = 200;
    END IF;
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        ); 

END //
DELIMITER ;