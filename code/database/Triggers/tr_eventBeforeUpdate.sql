DELIMITER //

DROP TRIGGER IF EXISTS tr_eventBeforeUpdate;
CREATE TRIGGER tr_eventBeforeUpdate BEFORE UPDATE ON Event FOR EACH ROW
BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.title <=> OLD.title AND
        NEW.startDateTime <=> OLD.startDateTime AND
        NEW.endDateTime <=> OLD.endDateTime AND
        NEW.price <=> OLD.price AND
        NEW.created <=> OLD.created AND
        NEW.owner_FK <=> OLD.owner_FK AND
        NEW.imageUrl <=> OLD.imageUrl AND
        NEW.isVisible <=> OLD.isVisible ANd
        NEW.location_FK <=> OLD.location_FK AND
        NEW.group_view_FK <=> OLD.group_view_FK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`EventAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.title,
            OLD.startDateTime,
            OLD.endDateTime,
            OLD.price,
            OLD.created,
            OLD.owner_FK,
            OLD.imageUrl,
            OLD.isVisible,
            OLD.location_FK,
            OLD.group_view_FK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;

END //

DELIMITER ;