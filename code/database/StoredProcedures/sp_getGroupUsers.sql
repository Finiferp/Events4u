DELIMITER //
DROP PROCEDURE IF EXISTS sp_getGroupUsers;
CREATE PROCEDURE sp_getGroupUsers(IN inputJSON JSON, OUT outputJSON JSON)
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

        -- Check if group exists
        IF NOT EXISTS (SELECT 1 FROM `Group` WHERE code_PK = input_GroupID) THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message
            );
        ELSE
            SET response_message = 'Users of the group retrieved successfully';
            SET response_code = 200;

            SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'user_code_PK', u.code_PK,
                        'user_name', CONCAT(u.firstName, ' ', u.lastName)
                    )
                ) INTO response_data
            FROM `User` u
            JOIN `PartOf` p ON u.code_PK = p.code_user_partOf_PKFK
            WHERE p.code_group_partOf_PKFK = input_GroupID;

            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', response_data
            );
        END IF;
    END IF;
END //
DELIMITER ;
