DELIMITER //

DROP TRIGGER IF EXISTS tr_groupBeforeUpdate;

CREATE TRIGGER tr_groupBeforeUpdate BEFORE UPDATE ON `Group` FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.name <=> OLD.name AND
        NEW.owner_FK <=> OLD.owner_FK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`GroupAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.name,
            OLD.owner_FK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //