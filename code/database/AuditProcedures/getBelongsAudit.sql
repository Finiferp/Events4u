DELIMITER //

DROP PROCEDURE IF EXISTS sp_getBelongsAudit;

CREATE PROCEDURE sp_getBelongsAudit(OUT ouputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idBelongsAudit', idBelongsAudit,
            'event_code_belongs_PKFK', event_code_belongs_PKFK,
            'category_code_belongs_PKFK', category_code_belongs_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM `BelongsAudit`);

    SET ouputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );

END //

DELIMITER ;