DELIMITER //

DROP TRIGGER IF EXISTS tr_categoryBeforeUpdate;
CREATE TRIGGER tr_categoryBeforeUpdate BEFORE UPDATE ON Category FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.label <=> OLD.label
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`CategoryAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.label,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //