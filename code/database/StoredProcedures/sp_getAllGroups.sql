DELIMITER //

DROP PROCEDURE IF EXISTS sp_getAllGroups//

CREATE PROCEDURE sp_getAllGroups(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_userID INT;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["userID"] 
                        }';

   IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = "Invalid JSON format";
        SET response_data = NULL;
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));

        SET response_code = 200;
        SET response_message = 'OK';
        SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'group_code_PK', g.code_PK,
                        'group_name', g.name,
                        'owner_name', CONCAT(u.firstName, ' ', u.lastName),
                        'applied_for',( 
                                CASE 
                                    WHEN af.user_code_appliedFor_PKFK IS NOT NULL THEN TRUE 
                                    ELSE FALSE 
                                END
                            )
                    )
                ) INTO response_data
                FROM `Group` g
                JOIN User u ON g.owner_FK = u.code_PK
               LEFT JOIN AplliedFor af ON g.code_PK = af.group_code_appliedFor_PKFK AND af.user_code_appliedFor_PKFK = input_userID

                WHERE g.`code_PK` <> 1;
    END IF;

    SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', response_data);

END //

DELIMITER ;