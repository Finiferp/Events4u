DELIMITER //
DROP PROCEDURE IF EXISTS sp_updateGroup;
CREATE PROCEDURE sp_updateGroup(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_groupID INT;
    DECLARE input_name VARCHAR(255);
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"},
                                    "name": {"type": "string"}
                                }, 
                                "required": ["groupID", "name"]
                        }';
      
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET input_name = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.name'));
        
        IF NOT EXISTS (SELECT 1 FROM `Group` WHERE code_PK = input_groupID) THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
        ELSE
            UPDATE `Group` SET name = input_name WHERE code_PK = input_groupID;
            
            SET response_code = 200;
            SET response_message = 'Group updated successfully';
        END IF;
    END IF;
        SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message
    );
END //
DELIMITER ;
