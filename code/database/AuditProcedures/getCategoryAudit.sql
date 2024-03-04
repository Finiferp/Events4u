DELIMITER //

DROP PROCEDURE IF EXISTS sp_getCategoryAudit;

CREATE PROCEDURE sp_getCategoryAudit(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idCategoryAudit', idCategoryAudit,
            'code_PK', code_PK,
            'label', label,
            'date_Audit', date_Audit,
            'action_audit', action_audit
        )
    ) FROM CategoryAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );

END //

DELIMITER ;
