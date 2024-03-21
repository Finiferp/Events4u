DELIMITER //
DROP PROCEDURE IF EXISTS sp_checkToken;

CREATE PROCEDURE sp_checkToken(IN p_token VARCHAR(1000), OUT outputJSON JSON)
BEGIN
    DECLARE token_exists INT;
    DECLARE token_ID INT;

    SELECT COUNT(*) INTO  token_exists
    FROM Token
    WHERE type = p_token;

    SELECT code_PK INTO token_ID
    FROM Token
    WHERE type = p_token;
    
    SET outputJSON = JSON_OBJECT('result', token_exists, 'id', token_ID);
END //

DELIMITER ;