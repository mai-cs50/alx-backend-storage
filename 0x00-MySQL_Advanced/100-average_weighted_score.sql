-- creates an index idx_name_first on the table names and the first letter of name.
-- Only the first letter of name must be indexed

DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
	UPDATE users SET average_score = (SELECT
	SUM(corrections.score * projects.wieght) / (SUM(projects.wieght)
	FROM corrections
	INNER JOIN projects
	ON projects.id = correction.project_id
	WHERE correction.user_id = user_id)
	where user.id = user_id;
END &&
DELIMITER ;
