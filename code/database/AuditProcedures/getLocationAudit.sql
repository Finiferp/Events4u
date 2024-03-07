-- Active: 1706868742750@@192.168.131.123@3306@Events4uAuditLogs
DELIMITER //

DROP PROCEDURE IF EXISTS sp_getLocationAudit;

CREATE PROCEDURE sp_getLocationAudit(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idLocationAudit', idLocationAudit,
            'code_PK', code_PK,
            'address', adress,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM LocationAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );

END //

DELIMITER ;
