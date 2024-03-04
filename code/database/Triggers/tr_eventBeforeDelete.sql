DELIMITER //

DROP TRIGGER IF EXISTS tr_eventBeforeDelete;

CREATE TRIGGER tr_eventBeforeDelete BEFORE DELETE ON Event FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`EventAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.title,
        OLD.startDateTime,
        OLD.endDateTime,
        OLD.price,
        OLD.created,
        OLD.owner_FK,
        OLD.imageUrl,
        OLD.isVisible,
        OLD.location_FK,
        OLD.group_view_FK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END //
DELIMITER ;