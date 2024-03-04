DELIMITER //
DROP PROCEDURE IF EXISTS sp_getGroup;
CREATE PROCEDURE sp_getGroup(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_GroupID INT;
    DECLARE response_code INT;
    DECLARE response_data JSON;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"}
                                }, 
                                "required": ["groupID"] 
                        }';
      
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_GroupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        IF NOT EXISTS (SELECT 1 FROM `Group` WHERE code_PK = input_GroupID) THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message
            );
        ELSE
            SET response_message = 'Group information retrieved successfully';
            SET response_code = 200;

            SELECT JSON_OBJECT(
                    'group_code_PK', g.code_PK,
                    'group_name', g.name,
                    'owner_name', CONCAT(u.firstName, ' ', u.lastName)
                ) INTO response_data
            FROM `Group` g
            JOIN `User` u ON g.owner_FK = u.code_PK
            WHERE g.code_PK = input_GroupID;

            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', response_data
            );
        END IF;
    END IF;
END //
DELIMITER ;
