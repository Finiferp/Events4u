DELIMITER //

DROP TRIGGER IF EXISTS tr_viewBeforeDelete;
CREATE TRIGGER tr_viewBeforeDelete BEFORE DELETE ON View FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`ViewAudit`
    VALUES (
        NULL,
        OLD.code_group_view_PKFK,
        OLD.code_event_view_PKFK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END //
DELIMITER ;