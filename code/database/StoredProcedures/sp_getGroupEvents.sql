DELIMITER //
DROP PROCEDURE IF EXISTS sp_getGroupEvents;
CREATE PROCEDURE sp_getGroupEvents(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE inputGroupID INT;
    DECLARE v_JSONSchema JSON;

    SET v_JSONSchema = '{"type": "object",
                            "properties": {
                                "groupID": {"type": "number"}
                            },
                            "required": ["groupID"]
                        }';

    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET inputGroupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));

        IF NOT EXISTS (SELECT 1 FROM `Group` WHERE code_PK = inputGroupID) THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
        ELSE
            SET response_message = 'Events retrieved successfully';
            SET response_code = 200;

            SELECT JSON_ARRAYAGG(
                       JSON_OBJECT(
                           'code_PK', e.code_PK,
                           'title', e.title,
                           'startDateTime', e.startDateTime,
                           'endDateTime', e.endDateTime,
                           'price', e.price,
                           'created', e.created,
                           'owner_FK', e.owner_FK,
                           'imageUrl', e.imageUrl,
                           'isVisible', e.isVisible,
                           'location_FK', e.location_FK,
                           'group_view_FK', e.group_view_FK
                       )
                   ) INTO response_data
            FROM `Event` e
            WHERE e.group_view_FK = inputGroupID;
        END IF;
    END IF;

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END //

DELIMITER ;