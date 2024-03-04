DELIMITER //

DROP PROCEDURE IF EXISTS sp_getPartOfAudit;

CREATE PROCEDURE sp_getPartOfAudit(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idPartOfAudit', idPartOfAudit,
            'code_group_partOf_PKFK', code_group_partOf_PKFK,
            'code_user_partOf_PKFK', code_user_partOf_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM PartOfAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );

END //

DELIMITER ;
