DELIMITER //

DROP PROCEDURE IF EXISTS sp_getUserAudit;

CREATE PROCEDURE sp_getUserAudit(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idUserAudit', idUserAudit,
            'code_PK', code_PK,
            'firstName', firstName,
            'lastName', lastName,
            'email', email,
            'phone', phone,
            'isAdmin', isAdmin,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM UserAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );

END //

DELIMITER ;
