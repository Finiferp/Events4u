DELIMITER //
DROP PROCEDURE IF EXISTS sp_updateMailer;
CREATE PROCEDURE sp_updateMailer(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_eventID INT;
    DECLARE event_attendees_json JSON;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventID": {"type": "number"}
                                }, 
                                "required": ["eventID"] 
                        }';
    
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET outputJSON = JSON_OBJECT("message", "Invalid JSON format or structure");
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET event_attendees_json = (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'event_name', e.title,
                    'event_code', e.code_PK,
                    'attending_users', (
                        SELECT JSON_ARRAYAGG(
                            JSON_OBJECT(
                                'email', u.email,
                                'name', CONCAT(u.firstName, ' ', u.lastName)
                            )
                        )
                        FROM Attends a
                        JOIN User u ON a.user_code_attends_PKFK = u.code_PK
                        WHERE a.event_code_attends_PKFK = e.code_PK
                    )
                )
            )
            FROM Event e
            WHERE e.code_PK = input_eventID
        );
        SET outputJSON = JSON_OBJECT("events", event_attendees_json);
    END IF;

END //

DELIMITER ;
