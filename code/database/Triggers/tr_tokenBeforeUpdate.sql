DELIMITER //

DROP TRIGGER IF EXISTS tr_tokenBeforeUpdate;

CREATE TRIGGER tr_tokenBeforeUpdate BEFORE UPDATE ON Token FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.type <=> OLD.type AND
        NEW.created <=> OLD.created AND
        NEW.user_FK <=> OLD.user_FK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`TokenAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.type,
            OLD.created,
            OLD.user_FK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //