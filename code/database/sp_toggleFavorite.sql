DELIMITER //
DROP PROCEDURE IF EXISTS sp_toggleFavorite;
CREATE PROCEDURE sp_toggleFavorite(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE input_isFavorited INT;
    DECLARE input_userID INT;
    SET v_JSONSchema = '{"type": "object",
                              "properties": {
                                  "eventID": {"type": "number"},
                                  "isFavorited" : {"type": "number"},
                                  "userID": {"type": "number"}
                              }, 
                              "required": ["eventID", "isFavorited", "userID"] 
                      }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET input_isFavorited = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.isFavorited'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));

        IF input_isFavorited = 1 THEN  -- True
            INSERT INTO Favorite (user_code_favorite_PKFK, event_code_favorite_PKFK)
            VALUES (input_userID, input_eventID);
        ELSE
            DELETE FROM Favorite WHERE user_code_favorite_PKFK = input_userID AND event_code_favorite_PKFK = input_eventID;
        END IF;

        SET response_message = 'Favorite update successfully';
        SET response_code = 200;
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    END IF;
END //
DELIMITER;