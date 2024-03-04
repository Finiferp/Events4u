DELIMITER //

DROP TRIGGER IF EXISTS tr_groupBeforeDelete;

CREATE TRIGGER tr_groupBeforeDelete BEFORE DELETE ON `Group` FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`GroupAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.name,
        OLD.owner_FK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END //
DELIMITER ;