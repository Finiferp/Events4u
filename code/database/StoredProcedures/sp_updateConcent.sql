DELIMITER //

DROP PROCEDURE IF EXISTS sp_updateConcent //

CREATE PROCEDURE sp_updateConcent(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_userID INT;
    DECLARE input_haveConcent INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{ "type": "object",
                            "properties": {
                                "userID": { "type": "number" },
                                "haveConcent": { "type": "number" }
                            },
                            "required": ["userID", "haveConcent"]
                        }';

    IF NOT JSON_SCHEMA_VALID(inputJSON, v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON';
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SET input_haveConcent = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.haveConcent'));

        SET response_code = 200;
        SET response_message = 'Success';

        UPDATE User 
        SET haveConcent = input_haveConcent 
        WHERE code_PK = input_userID;

        DELETE FROM Attends
        WHERE user_code_attends_PKFK = input_userID;

        DELETE FROM Interested
        WHERE user_code_interested_PKFK = input_userID;



    END IF;

    SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
END //
DELIMITER ;