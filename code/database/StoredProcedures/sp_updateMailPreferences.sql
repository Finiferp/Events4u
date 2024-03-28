DELIMITER //

DROP PROCEDURE IF EXISTS sp_updateMailPreferences //

CREATE PROCEDURE sp_updateMailPreferences(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_userID INT;
    DECLARE input_acceptsNotifications INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{ "type": "object",
                            "properties": {
                                "userID": { "type": "number" },
                                "acceptsNotifications": { "type": "number" }
                            },
                            "required": ["userID", "acceptsNotifications"]
                        }';

    IF NOT JSON_SCHEMA_VALID(inputJSON, v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON';
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SET input_acceptsNotifications = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.acceptsNotifications'));

        SET response_code = 200;
        SET response_message = 'Success';

        UPDATE User 
        SET acceptsNotifications = input_acceptsNotifications 
        WHERE code_PK = input_userID;
    END IF;

    SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);

END //
DELIMITER ;