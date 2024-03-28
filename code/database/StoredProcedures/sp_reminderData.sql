DELIMITER //
DROP PROCEDURE IF EXISTS sp_reminderData;
CREATE PROCEDURE sp_reminderData(OUT outputJSON JSON)
BEGIN
    DECLARE event_attendees_json JSON;


     SET event_attendees_json = (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'event_name', e.title,
                'event_code', e.code_PK,
                'attending_users', (
                    SELECT JSON_ARRAYAGG(
                        JSON_OBJECT(
                            'email', u.email,
                            'name', CONCAT(u.firstName, ' ', u.lastName)
                        )
                    )
                    FROM Attends a
                    JOIN User u ON a.user_code_attends_PKFK = u.code_PK
                    WHERE a.event_code_attends_PKFK = e.code_PK
                )
            )
        )
        FROM Event e
        WHERE DATE(e.startDateTime) = DATE_ADD(CURDATE(), INTERVAL 1 DAY)
    );

    SET outputJSON = JSON_OBJECT(
        'events', event_attendees_json
    );
END //

DELIMITER ;
