DELIMITER //

DROP TRIGGER IF EXISTS tr_locationBeforeDelete;

CREATE TRIGGER tr_locationBeforeDelete BEFORE DELETE ON Location FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`LocationAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.adress,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END //
DELIMITER ;