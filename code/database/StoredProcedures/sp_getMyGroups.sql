DELIMITER //
DROP PROCEDURE IF EXISTS sp_getMyGroups;
CREATE PROCEDURE sp_getMyGroups(IN inputJSON JSON, OUT outputJSON JSON
)
BEGIN
    DECLARE input_UserID INT;
    DECLARE response_code INT;
    DECLARE response_data JSON;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["userID"] 
                        }';
      
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_UserID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        -- Check if user exists
        IF NOT EXISTS (SELECT 1 FROM `User` WHERE code_PK = input_UserID) THEN
            SET response_code = 404;
            SET response_message = 'User does not exist';
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message
            );
        ELSE
            SET response_message = 'Groups retrieved successfully';
            SET response_code = 200;
            SET response_data = (SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'group_code_PK', g.code_PK,
                        'group_name', g.name,
                        'owner_name', CONCAT(u.firstName, ' ', u.lastName)
                    )
                )
            FROM `Group` g
            JOIN `User` u ON g.owner_FK = u.code_PK
            WHERE g.owner_FK = input_UserID
            AND g.`code_PK` <> 1);

            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', response_data
            );
        END IF;
    END IF;
END //

DELIMITER ;
