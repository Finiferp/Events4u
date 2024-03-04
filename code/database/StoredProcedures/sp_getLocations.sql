DELIMITER //

DROP PROCEDURE IF EXISTS sp_getLocations;
CREATE PROCEDURE sp_getLocations(OUT outputJSON JSON)
BEGIN
   SET outputJSON = (
        SELECT JSON_OBJECT(
            "status_code", "200",
            "message", "Sucessfully retirved all the locations",
            "data", JSON_ARRAYAGG(
                JSON_OBJECT(
                    "id", l.code_PK,
                    "adress", l.adress
                )
            )
        )
        FROM Location l
   );
END //
DELIMITER ;