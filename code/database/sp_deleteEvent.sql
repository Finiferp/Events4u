DELIMITER //
DROP PROCEDURE IF EXISTS sp_deleteEvent;
CREATE PROCEDURE sp_deleteEvent(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
      DECLARE v_JSONSchema JSON;
      DECLARE response_code INT;
      DECLARE response_message VARCHAR(255);
      DECLARE input_eventID INT;

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
            SET input_eventID = JSON_EXTRACT(inputJSON, '$.eventID'); 
            DELETE FROM Event WHERE code_PK = input_eventID;
            IF ROW_COUNT() > 0 THEN
                  SET response_message = 'Event deleted successfully';
                  SET response_code = 200;
            ELSE
                  SET response_message = 'Event not found or already deleted';
                  SET response_code = 404;
            END IF;
      END IF;
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
END //
DELIMITER;