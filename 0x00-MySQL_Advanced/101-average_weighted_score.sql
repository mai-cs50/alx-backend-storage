-- creates an index idx_name_first on the table names and the first letter of name.
-- Only the first letter of name must be indexed

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser ()
BEGIN
	UPDATE users AS users,
		(SELECT users.id, SUM(score * weight) / SUM(weight) AS weight_avg
		FROM users AS users JOIN corrections AS correct ON users.id = correct.user_id
		JOIN projects AS proj ON correct.project_id = proj.id
		GROUP BY users.id)
	AS weight
	SET users.average_score = weight.weight_avg
	WHERE users.id = weight.id;
END $$
DELIMITER ;