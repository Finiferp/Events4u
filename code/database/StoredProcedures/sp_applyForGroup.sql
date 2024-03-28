DELIMITER //

DROP PROCEDURE IF EXISTS sp_applyForGroup //

CREATE PROCEDURE sp_applyForGroup(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_userID INT;
    DECLARE input_groupID INT;
    DECLARE input_message VARCHAR(450);

    SET v_JSONSchema ='{"type": "object",
                              "properties": {
                                  "userID": {"type": "number"},
                                  "groupID" : {"type": "number"},
                                  "message" : {"type": "string"}
                              }, 
                              "required": ["userID", "groupID"] 
                      }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = "Invalid JSON format";
        SET outputJSON = JSON_OBJECT("code", response_code, "message", response_message);
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, "$.userID"));
        SET input_groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, "$.groupID"));
        SET input_message = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, "$.message"));

        INSERT INTO AplliedFor (user_code_appliedFor_PKFK, group_code_appliedFor_PKFK,message)
        VALUES (input_userID, input_groupID, input_message);
        SET response_code = 200;
        SET response_message = "Applied for group successfully";
        SET outputJSON = JSON_OBJECT("status_code", response_code, "message", response_message);
    END IF;

END //

DELIMITER ;