DELIMITER //

DROP TRIGGER IF EXISTS tr_favoriteBeforeUpdate;
CREATE TRIGGER tr_favoriteBeforeUpdate BEFORE UPDATE ON Favorite FOR EACH ROW
BEGIN
    IF NOT(
        NEW.user_code_favorite_PKFK <=> OLD.user_code_favorite_PKFK AND
        NEW.event_code_favorite_PKFK <=> OLD.event_code_favorite_PKFK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`FavoriteAudit`
        VALUES (
            NULL,
            OLD.user_code_favorite_PKFK,
            OLD.event_code_favorite_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END //