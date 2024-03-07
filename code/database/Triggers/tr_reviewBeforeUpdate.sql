DELIMITER //

DROP TRIGGER IF EXISTS tr_reviewBeforeUpdate;

CREATE TRIGGER tr_reviewBeforeUpdate BEFORE UPDATE ON Review FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.stars <=> OLD.stars AND
        NEW.review <=> OLD.review AND
        NEW.user_code_review_FK <=> OLD.user_code_review_FK AND
        NEW.event_code_describes_FK <=> OLD.event_code_describes_FK AND
        NEW.creationDate <=> OLD.creationDate
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`ReviewAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.stars,
            OLD.review,
            OLD.user_code_review_FK,
            OLD.event_code_describes_FK,
            OLD.creationDate,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //