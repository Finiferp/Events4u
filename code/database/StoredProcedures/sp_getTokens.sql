DELIMITER //

DROP PROCEDURE IF EXISTS sp_getTokens;

CREATE PROCEDURE sp_getTokens(OUT outputJSON JSON)
BEGIN
    SET outputJSON = (
        SELECT JSON_OBJECT(
            "status_code", "200",
            "message", "Sucessfully retirved all the tokens",
            "data", JSON_ARRAYAGG(
                JSON_OBJECT(
                    "token", t.type,
                    "id", t.code_PK
                )
            )
        )
        FROM Token t
    );
END //

DELIMITER ;