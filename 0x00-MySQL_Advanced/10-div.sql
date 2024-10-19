-- email, string (255 characters), never null and unique
-- name, string (255 characters)
-- If the table already exists, your script should not fail

DELIMITER $$ ;

DROP FUNCTION IF EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
	RETURN (IF (b = 0, 0, a / b));
END //
DELIMITER;
