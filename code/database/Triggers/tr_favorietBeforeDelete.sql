DELIMITER //

DROP TRIGGER IF EXISTS tr_favorietBeforeDelete;

CREATE TRIGGER tr_favorietBeforeDelete BEFORE DELETE ON Favorite FOR EACH ROW
BEGIN
    INSERT INTO `Events4uAuditLogs`.`FavoriteAudit`
    VALUES (
        NULL,
        OLD.user_code_favorite_PKFK,
        OLD.event_code_favorite_PKFK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END //
DELIMITER ;