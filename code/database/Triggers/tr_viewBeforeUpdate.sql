DELIMITER //

DROP TRIGGER IF EXISTS tr_viewBeforeUpdate;

CREATE TRIGGER tr_viewBeforeUpdate BEFORE UPDATE ON View FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_group_view_PKFK <=> OLD.code_group_view_PKFK AND
        NEW.code_event_view_PKFK <=> OLD.code_event_view_PKFK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`ViewAudit`
        VALUES (
            NULL,
            OLD.code_group_view_PKFK,
            OLD.code_event_view_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //