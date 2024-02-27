DELIMITER //
DROP PROCEDURE IF EXISTS sp_getCategories;
CREATE PROCEDURE sp_getCategories(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data TEXT;

    SET response_code = 200;
    SET response_message = 'Success';

    SET outputJSON = (
        SELECT JSON_OBJECT(
            'status_code', response_code,
            'message', response_message,
            'data', JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', c.code_PK,
                    'name', c.label
                )
            )
        )
        FROM Category c
    );

END //
DELIMITER ;
