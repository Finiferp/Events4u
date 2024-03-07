DELIMITER //

DROP PROCEDURE IF EXISTS sp_exportList;

CREATE PROCEDURE sp_exportList(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE attending_users_json JSON;
    DECLARE interested_users_json JSON;

    SET v_JSONSchema = '{"type": "object",
                              "properties": {
                                  "eventID": {"type": "number"}
                              },
                              "required": ["eventID"]
                      }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    ELSE
        SET response_code = 200;
        SET response_message = 'Success';
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));

        SET attending_users_json = (
            SELECT JSON_OBJECT(
                'attending_users', JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'name', CONCAT(u.firstName, ' ', u.lastName)
                    )
                )
            )
            FROM User u
            JOIN Attends a ON u.code_PK = a.user_code_attends_PKFK
            WHERE a.event_code_attends_PKFK = input_eventID
        );

        SET interested_users_json = (
            SELECT JSON_OBJECT(
                'interested_users', JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'name', CONCAT(u.firstName, ' ', u.lastName)
                    )
                )
            )
            FROM User u
            JOIN Interested i ON u.code_PK = i.user_code_interested_PKFK
            WHERE i.event_code_interested_PKFK = input_eventID
        );
        
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message,
                                    'attending_users', attending_users_json,
                                    'interested_users', interested_users_json);

    END IF;

END //
DELIMITER ;