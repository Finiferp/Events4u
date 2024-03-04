DELIMITER //

DROP TRIGGER IF EXISTS tr_userBeforeUpdate;

CREATE TRIGGER tr_userBeforeUpdate BEFORE UPDATE ON User FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.firstName <=> OLD.firstName,
        NEW.lastName <=> OLD.lastName,
        NEW.email <=> OLD.email,
        NEW.phone <=> OLD.phone,
        NEW.isAdmin <=> OLD.isAdmin
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`UserAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.firstName,
            OLD.lastName,
            OLD.email,
            OLD.phone,
            OLD.isAdmin,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //