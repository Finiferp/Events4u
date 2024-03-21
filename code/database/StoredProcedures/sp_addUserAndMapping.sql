DELIMITER //
DROP PROCEDURE IF EXISTS sp_addUserAndMapping;
DROP PROCEDURE IF EXISTS sp_addUserAndMapping //
CREATE PROCEDURE sp_addUserAndMapping(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_userId INT;
    DECLARE input_firstName VARCHAR(450);
    DECLARE input_lastName VARCHAR(450);
    DECLARE input_email VARCHAR(450);
    DECLARE input_sub VARCHAR(500);
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT DEFAULT 200;
    DECLARE response_message VARCHAR(255) DEFAULT 'User and mapping created successfully';

    -- Define JSON Schema for input validation
    SET v_JSONSchema = '{"type": "object", 
                            "properties": {
                                "firstName": {"type": "string"},
                                "lastName": {"type": "string"},
                                "email": {"type": "string"},
                                "sub": {"type": "string"}
                            }, "required": ["firstName", "lastName", "email", "sub"]}';

    -- Validate input JSON
    IF NOT JSON_SCHEMA_VALID(inputJSON, v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format';
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                     'message', response_message);
    ELSE
        -- Extract values from input JSON
        SET input_firstName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.firstName'));
        SET input_lastName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.lastName'));
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        SET input_sub = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.sub'));

        -- Insert new User
        INSERT INTO User(firstName, lastName, email)
        VALUES (input_firstName, input_lastName, input_email);

        -- Get the ID of the newly inserted User
        SET v_userId = LAST_INSERT_ID();

        -- Insert new LuxId_Mapping
        INSERT INTO LuxId_Mapping(sub, userMapping_FK)
        VALUES (input_sub, v_userId);

        -- Prepare output JSON
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                     'message', response_message,
                                     'data', JSON_OBJECT('userId', v_userId));
    END IF;
END //

DELIMITER ;
