DELIMITER //
DROP TRIGGER IF EXISTS tr_belongsBeforeDelete;

CREATE TRIGGER tr_belongsBeforeDelete BEFORE DELETE ON Belongs FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`BelongsAudit`
    VALUES (
        NULL,
        OLD.event_code_belongs_PKFK,
        OLD.category_code_belongs_PKFK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END //
DELIMITER ;