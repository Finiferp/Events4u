DELIMITER //

DROP PROCEDURE IF EXISTS sp_getViewAudit;

CREATE PROCEDURE sp_getViewAudit(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idViewAudit', idViewAudit,
            'code_group_view_PKFK', code_group_view_PKFK,
            'code_event_view_PKFK', code_event_view_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM ViewAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );

END //

DELIMITER ;
