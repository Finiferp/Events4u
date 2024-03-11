DELIMITER //
DROP PROCEDURE IF EXISTS sp_checkToken;

CREATE PROCEDURE sp_checkToken(IN p_token VARCHAR(255), OUT outputJSON JSON)
BEGIN
    DECLARE token_exists INT;

    SELECT COUNT(*) INTO token_exists
    FROM Token
    WHERE type = p_token;
    SET outputJSON = JSON_OBJECT('result', token_exists);
END //

DELIMITER ;