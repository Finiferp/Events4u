DELIMITER //

DROP TRIGGER IF EXISTS tr_categoryBeforeDelete;
CREATE TRIGGER tr_categoryBeforeDelete BEFORE DELETE ON Category FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`CategoryAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.label,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END //
DELIMITER ;