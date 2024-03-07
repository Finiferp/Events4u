DELIMITER //

DROP PROCEDURE IF EXISTS sp_toggleAsAttending;

CREATE PROCEDURE sp_toggleAsAttending(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE input_isAttending INT;
    DECLARE input_userID INT;

    SET v_JSONSchema = '{"type": "object",
                              "properties": {
                                  "eventID": {"type": "number"},
                                  "isAttending" : {"type": "number"},
                                  "userID": {"type": "number"}
                              },
                              "required": ["eventID", "isAttending", "userID"]
                      }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET input_isAttending = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.isAttending'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));

        IF input_isAttending = 1 THEN  -- True
            INSERT INTO Attends (user_code_attends_PKFK, event_code_attends_PKFK)
            VALUES (input_userID, input_eventID);
        ELSE
            DELETE FROM Attends WHERE user_code_attends_PKFK = input_userID AND event_code_attends_PKFK = input_eventID;
        END IF;

        SET response_message = 'Attending update successfully';
        SET response_code = 200;
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    END IF;
END //
DELIMITER ;