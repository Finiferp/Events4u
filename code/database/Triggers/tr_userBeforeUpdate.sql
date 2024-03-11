DELIMITER //

DROP TRIGGER IF EXISTS tr_userBeforeUpdate;

CREATE TRIGGER tr_userBeforeUpdate BEFORE UPDATE ON User FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.firstName <=> OLD.firstName AND
        NEW.lastName <=> OLD.lastName AND
        NEW.email <=> OLD.email AND
        NEW.isAdmin <=> OLD.isAdmin
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`UserAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.firstName,
            OLD.lastName,
            OLD.email,
            OLD.isAdmin,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //