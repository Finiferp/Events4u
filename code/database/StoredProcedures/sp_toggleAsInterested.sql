DELIMITER //

DROP PROCEDURE IF EXISTS sp_toggleAsInterested;

CREATE PROCEDURE sp_toggleAsInterested(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE input_isInterested INT;
    DECLARE input_userID INT;
    SET v_JSONSchema = '{"type": "object",
                              "properties": {
                                  "eventID": {"type": "number"},
                                  "isInterested" : {"type": "number"},
                                  "userID": {"type": "number"}
                              },
                              "required": ["eventID", "isInterested", "userID"]
                      }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET input_isInterested = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.isInterested'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));

        IF input_isInterested = 1 THEN  -- True
            INSERT INTO Interested (user_code_interested_PKFK, event_code_interested_PKFK)
            VALUES (input_userID, input_eventID);
        ELSE
            DELETE FROM Interested WHERE user_code_interested_PKFK = input_userID AND event_code_interested_PKFK = input_eventID;
        END IF; 

        SET response_message = 'Interested update successfully';
        SET response_code = 200;
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    END IF;
END //
DELIMITER ;