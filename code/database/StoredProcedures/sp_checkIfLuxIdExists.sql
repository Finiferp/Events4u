DELIMITER //
DROP PROCEDURE IF EXISTS sp_checkIfLuxIdExists //
CREATE PROCEDURE sp_checkIfLuxIdExists(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    DECLARE userId INT;
    DECLARE input_sub VARCHAR(255);
    DECLARE existsFlag INT DEFAULT 0;
    
    SET v_JSONSchema = '{"type": "object", 
                            "properties": {
                                "sub": {"type": "string"}
                            },
                        "required": ["sub"]
                        }';

    IF NOT JSON_SCHEMA_VALID(JSON_EXTRACT(inputJSON, '$'), v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format';
    ELSE
        SET input_sub = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.sub'));

        -- Check if sub exists
        SELECT COUNT(*) INTO existsFlag
        FROM LuxId_Mapping
        WHERE sub = input_sub;

        IF existsFlag = 0 THEN
            SET response_code = 404;
            SET response_message = 'Not found';
            SET response_data = JSON_OBJECT('exists', 'false',
                                            'userId', "-1" );
        ELSE
            SELECT userMapping_FK into userId
            FROM LuxId_Mapping
            WHERE sub = input_sub;
            
            SET response_code = 200;
            SET response_message = 'OK';
            
            SET response_data = JSON_OBJECT('userId', userId,
                                            'exists', 'true' );
        END IF;

    END IF;

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data);

END //

DELIMITER ;
