DELIMITER //

DROP PROCEDURE IF EXISTS sp_deleteToken //

CREATE PROCEDURE sp_deleteToken(IN inputJSON JSON)
BEGIN
    DECLARE input_id INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "id": {"type": "number"}
                                },
                                "required": ["id"]
                        }';
        IF JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN

            SET input_id = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.id'));
            DELETE FROM Token t WHERE t.code_PK = input_id;

        END IF; 
END //

DELIMITER ;