DELIMITER //

DROP TRIGGER IF EXISTS tr_locationBeforeUpdate;

CREATE TRIGGER tr_locationBeforeUpdate BEFORE UPDATE ON Location FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.adress <=> OLD.adress
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`LocationAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.adress,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //