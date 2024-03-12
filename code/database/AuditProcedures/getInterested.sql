
DELIMITER //

DROP PROCEDURE IF EXISTS sp_getInterestedAudit;

CREATE PROCEDURE sp_getInterestedAudit(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idInterestedAudit', idInterestedAudit,
            'event_code_interested_PKFK', event_code_interested_PKFK,
            'user_code_attends_PKFK', user_code_attends_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM InterestedAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );	

END //
