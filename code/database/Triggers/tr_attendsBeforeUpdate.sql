DELIMITER //

DROP TRIGGER IF EXISTS tr_attendsBeforeUpdate;

CREATE TRIGGER tr_attendsBeforeUpdate BEFORE UPDATE ON Attends FOR EACH ROW
BEGIN
    IF NOT(
        NEW.event_code_attends_PKFK <=> OLD.event_code_attends_PKFK AND
        NEW.user_code_attends_PKFK <=> OLD.user_code_attends_PKFK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`AttendsAudit`
        VALUES (
            NULL,
            OLD.event_code_attends_PKFK,
            OLD.user_code_attends_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //