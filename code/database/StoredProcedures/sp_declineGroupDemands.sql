DELIMITER //
DROP PROCEDURE IF EXISTS sp_declineGroupDemands//
CREATE PROCEDURE sp_declineGroupDemands(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_groupID INT;
    DECLARE input_userID INT;
    DECLARE v_JSONSchema JSON;

     SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"},
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["groupID", "userID"] 
                        }';
      
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));

        DELETE FROM `AplliedFor`
        WHERE `group_code_appliedFor_PKFK` = input_groupID AND `user_code_appliedFor_PKFK` = input_userID;
        SET response_code = 200;
        SET response_message = 'Success';
    END IF;

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message
    );

END //
DELIMITER ;