DELIMITER //

DROP TRIGGER IF EXISTS tr_attendsBeforeDelete;

CREATE TRIGGER tr_attendsBeforeDelete BEFORE DELETE ON Attends FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`AttendsAudit`
    VALUES (
        NULL,
        OLD.event_code_attends_PKFK,
        OLD.user_code_attends_PKFK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END //
DELIMITER ;