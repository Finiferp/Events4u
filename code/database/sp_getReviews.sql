DELIMITER //

DROP PROCEDURE IF EXISTS sp_getReviews;

CREATE PROCEDURE sp_getReviews(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE currentReviewID INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_eventID INT;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventID": {"type": "number"}
                                }, 
                                "required": ["eventID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));

        SET response_message = 'Review retrieved successfully';
        SET response_code = 200;

        SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'stars', r.stars,
                   'text', r.review,
                   'user', CONCAT(u.firstName, ' ', u.lastName),
                   'date', r.creationDate
               )
           ) INTO response_data
        FROM Review r
        JOIN User u ON r.user_code_review_FK = u.code_PK
        WHERE r.event_code_describes_FK = input_eventID;
    END IF;

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    ); 
END //

DELIMITER ;
