DELIMITER //
DROP TRIGGER IF EXISTS tr_tokenBeforeDelete;
CREATE TRIGGER tr_tokenBeforeDelete BEFORE DELETE ON Token FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`TokenAudit`
       VALUES (
          NULL,
          OLD.code_PK,
          OLD.type,
          OLD.created,
          OLD.user_FK,
          CURRENT_TIMESTAMP,
          "DELETE"
       );
END//
DELIMITER ;