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
                                "required": [eventID] 
                        }';
    


      IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
            SET response_code = 400;
            SET response_message = 'Invalid JSON format or structure';
      ELSE

            START TRANSACTION;
                  IF EXISTS (SELECT * FROM Event WHERE code_PK = input_eventID AND isVisible = 0) THEN
                        DELETE FROM Event WHERE code_PK = input_eventID;
                        SET response_message = 'Event deleted successfully';
                        SET response_code = 200;
                  ELSE
                        SET response_code = 404;
                        SET response_message = 'Event not found or is not invisible';
                  END IF;
            COMMIT;

            SET response_message = 'Event deleted successfully';
            SET response_code = 200;
      END IF;
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
END //
DELIMITER;