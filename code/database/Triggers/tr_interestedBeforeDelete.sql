DELIMITER //

DROP TRIGGER IF EXISTS tr_interestedBeforeDelete;
CREATE TRIGGER tr_interestedBeforeDelete BEFORE DELETE ON Interested FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`InterestedAudit`
       VALUES (
          NULL,
          OLD.user_code_interested_PKFK,
          OLD.user_code_interested_PKFK,
          CURRENT_TIMESTAMP,
          "DELETE"
       );
END//
DELIMITER ;