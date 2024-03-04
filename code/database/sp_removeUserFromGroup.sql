DELIMITER //
DROP PROCEDURE IF EXISTS sp_removeUserFromGroup;
CREATE PROCEDURE sp_removeUserFromGroup(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE groupID INT;
    DECLARE userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    DECLARE v_groupExists INT;
    DECLARE v_userExists INT;
    
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
        SET groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        
        SELECT COUNT(*) INTO v_groupExists FROM `Group` WHERE code_PK = groupID;
        
        IF v_groupExists = 0 THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
        ELSE
            SELECT COUNT(*) INTO v_userExists FROM `User` WHERE code_PK = userID;
            
            IF v_userExists = 0 THEN
                SET response_code = 404;
                SET response_message = 'User does not exist';
            ELSE
                IF NOT EXISTS (SELECT 1 FROM `PartOf` WHERE code_group_partOf_PKFK = groupID AND code_user_partOf_PKFK = userID) THEN
                    SET response_code = 400;
                    SET response_message = 'User is not part of the group';
                ELSE
                    DELETE FROM `PartOf` WHERE code_group_partOf_PKFK = groupID AND code_user_partOf_PKFK = userID;
                    SET response_code = 200;
                    SET response_message = 'User removed from the group successfully';
                END IF;
            END IF;
        END IF;
    END IF;
    
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message
    );
    
END //

DELIMITER ;
