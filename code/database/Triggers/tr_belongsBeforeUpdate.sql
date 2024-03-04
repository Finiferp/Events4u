DELIMITER //
DROP TRIGGER IF EXISTS tr_belongsBeforeUpdate;
CREATE TRIGGER tr_belongsBeforeUpdate BEFORE UPDATE ON Belongs FOR EACH ROW
BEGIN
    IF NOT(
        NEW.event_code_belongs_PKFK <=> OLD.event_code_belongs_PKFK AND
        NEW.category_code_belongs_PKFK <=> OLD.category_code_belongs_PKFK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`BelongsAudit`
        VALUES (
            NULL,
            OLD.event_code_belongs_PKFK,
            OLD.category_code_belongs_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //
DELIMITER ;