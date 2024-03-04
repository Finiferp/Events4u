DELIMITER //

DROP TRIGGER IF EXISTS tr_partOfBeforeUpdate;

CREATE TRIGGER tr_partOfBeforeUpdate BEFORE UPDATE ON PartOf FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_group_partOf_PKFK <=> OLD.code_group_partOf_PKFK AND
        NEW.code_user_partOf_PKFK <=> OLD.code_user_partOf_PKFK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`PartOfAudit`
        VALUES (
            NULL,
            OLD.code_group_partOf_PKFK,
            OLD.code_user_partOf_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //