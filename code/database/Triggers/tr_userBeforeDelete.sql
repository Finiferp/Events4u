DELIMITER //

DROP TRIGGER IF EXISTS tr_userBeforeDelete;
CREATE TRIGGER tr_userBeforeDelete BEFORE DELETE ON User FOR EACH ROW
BEGIN
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
        "DELETE"
    );
END //
DELIMITER ;