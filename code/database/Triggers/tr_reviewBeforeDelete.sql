DELIMITER //

DROP TRIGGER IF EXISTS tr_reviewBeforeDelete;
CREATE TRIGGER tr_reviewBeforeDelete BEFORE DELETE ON Review FOR EACH ROW
BEGIN
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
            "DELETE"
        );
END//
DELIMITER ;