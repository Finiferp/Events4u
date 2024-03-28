DELIMITER //
DROP PROCEDURE IF EXISTS sp_getAppliedUsersForGroup//
CREATE PROCEDURE sp_getAppliedUsersForGroup(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_groupID INT;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"}
                                }, 
                                "required": ["groupID"] 
                        }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = "Invalid JSON format";
        SET response_data = NULL;
    ELSE
        SET input_groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET response_code = 200;
        SET response_message = 'OK';
        SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'userID', u.code_PK,
                        'username', CONCAT(u.firstName, ' ', u.lastName),
                        'message', af.message
                    )
                ) INTO response_data
                FROM User u
                JOIN AplliedFor af ON u.code_PK = af.user_code_appliedFor_PKFK
                WHERE af.group_code_appliedFor_PKFK = input_groupID;
    END IF;

    SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', response_data);

END //

DELIMITER ;
