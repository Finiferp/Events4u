DELIMITER //

DROP PROCEDURE IF EXISTS sp_getUsers;

CREATE PROCEDURE sp_getUsers(OUT outputJSON JSON)
BEGIN
      DECLARE response_code INT;
      DECLARE response_message VARCHAR(255);
      DECLARE response_data JSON;

      SET response_code = 200;
      SET response_message = 'Success';

      SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
            'user_code_PK', code_PK,
            'user_name', CONCAT(firstName, ' ', lastName)
            )
        ) INTO response_data
      FROM `User`
      WHERE code_PK <> 2;

      SET outputJSON = JSON_OBJECT(
          'status_code', response_code,
          'message', response_message,
          'data', response_data
      );
END //

DELIMITER ;