DELIMITER //

DROP PROCEDURE IF EXISTS sp_getGroupAudit;

CREATE PROCEDURE sp_getGroupAudit(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idGroupAudit', idGroupAudit,
            'code_PK', code_PK,
            'name', name,
            'owner_FK', owner_FK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM GroupAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );

END //

DELIMITER ;
