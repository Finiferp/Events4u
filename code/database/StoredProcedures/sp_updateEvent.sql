DELIMITER //

DROP PROCEDURE IF EXISTS sp_updateEvent;
CREATE PROCEDURE sp_updateEvent(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE input_title VARCHAR(450);
    DECLARE input_startDateTime DATETIME;
    DECLARE input_endDateTime DATETIME;
    DECLARE input_price INT;
    DECLARE input_location INT;
    DECLARE input_imageUrl VARCHAR(450);
    DECLARE input_isVisible TINYINT;
    DECLARE input_group INT;

    DECLARE category_list VARCHAR(10000); 
    DECLARE category_name VARCHAR(450);
    DECLARE category_id INT;
    DECLARE category_cursor CURSOR FOR SELECT code_PK FROM Category WHERE label = category_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET category_id = NULL;

    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventID": {"type": "number"},
                                    "title": {"type": "string"}, 
                                    "startDateTime": {"type": "string"},
                                    "endDateTime": {"type": "string"},
                                    "price": {"type": "number"},
                                    "location": {"type": "number"},
                                    "categories": {"type": "string"},
                                    "imageUrl": {"type": "string"},
                                    "isVisible": {"type": "number"},
                                    "group": {"type": "number"}
                                }, 
                                "required": ["eventID", "title", "startDateTime", "endDateTime", "price", "location", "categories", "imageUrl", "isVisible"] 
                        }';
    


    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_title = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.title'));
        SET input_startDateTime = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.startDateTime'));
        SET input_endDateTime = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.endDateTime'));
        SET input_price = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.price'));
        SET input_location = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.location'));
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET category_list = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.categories'));
        SET input_imageUrl = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.imageUrl'));
        SET input_isVisible = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.isVisible'));
        SET input_group = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.group'));

        START TRANSACTION;

            UPDATE Event 
            SET title = input_title, 
                startDateTime = input_startDateTime, 
                endDateTime = input_endDateTime, 
                price = input_price, 
                location_FK = input_location,
                imageUrl = input_imageUrl,
                isVisible = input_isVisible,
                group_view_FK = input_group
            WHERE code_PK = input_eventID;

             DELETE FROM Belongs WHERE event_code_belongs_PKFK = input_eventID;

            category_loop: LOOP
                SET category_name = TRIM(SUBSTRING_INDEX(category_list, ',', 1));
                IF category_name = '' THEN
                    LEAVE category_loop;
                END IF;
            
                OPEN category_cursor;
                FETCH category_cursor INTO category_id;
                CLOSE category_cursor;
                
                IF category_id IS NOT NULL THEN
                    INSERT INTO Belongs (event_code_belongs_PKFK, category_code_belongs_PKFK)
                    VALUES (input_eventID, category_id);
                END IF;
                SET category_list = TRIM(BOTH ',' FROM SUBSTRING(category_list, LENGTH(category_name) + 2));
            END LOOP category_loop;

        COMMIT;

            SET response_message = 'Event updated successfully';
            SET response_code = 200;
    END IF;
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        ); 

END //
DELIMITER ;