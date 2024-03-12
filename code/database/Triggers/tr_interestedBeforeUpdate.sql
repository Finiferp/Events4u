DELIMITER //

DROP TRIGGER IF EXISTS tr_interestedBeforeUpdate;

CREATE TRIGGER tr_interestedBeforeUpdate BEFORE UPDATE ON Interested FOR EACH ROW
BEGIN
    IF NOT(
        NEW.user_code_interested_PKFK <=> OLD.user_code_interested_PKFK AND
        NEW.user_code_interested_PKFK <=> OLD.user_code_interested_PKFK
    ) THEN
        INSERT INTO `Events4uAuditLogs`.`InterestedAudit`
        VALUES (
            NULL,
            OLD.user_code_interested_PKFK,
            OLD.user_code_interested_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //
    