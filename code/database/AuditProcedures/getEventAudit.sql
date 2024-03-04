DELIMITER //

DROP PROCEDURE IF EXISTS sp_getEventAudit;

CREATE PROCEDURE sp_getEventAudit(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idEventAudit', idEventAudit,
            'code_PK', code_PK,
            'title', title,
            'startDateTime', startDateTime,
            'endDateTime', endDateTime,
            'price', price,
            'created', created,
            'owner_FK', owner_FK,
            'imageURL', imageURL,
            'isVisible', isVisible,
            'location_FK', location_FK,
            'group_view_FK', group_view_FK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM EventAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );

END //

DELIMITER ;
