DELIMITER //

DROP PROCEDURE IF EXISTS sp_addReview;

CREATE PROCEDURE sp_addReview(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);

    DECLARE input_stars INT;
    DECLARE input_review TEXT;
    DECLARE input_userID INT;
    DECLARE input_eventID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "stars": {"type": "number"}, 
                                    "review": {"type": "string"},
                                    "userID": {"type": "number"},
                                    "eventID": {"type": "number"}
                                }, 
                                "required": ["stars", "review", "userID", "eventID"] 
                        }';
    


    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_stars = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.stars'));
        SET input_review = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.review'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));


        INSERT INTO Review (stars, review, userID, eventID) 
        VALUES (input_stars, input_review, input_userID, input_eventID);

        SET response_message = 'Review created successfully';
        SET response_code = 200;
    END IF;
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        ); 

END //
DELIMITER ;