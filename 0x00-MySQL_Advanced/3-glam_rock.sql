-- Creates a table users with below attributes
-- id, integer, never null, auto increment and primary key
-- email, string (255 characters), never null and unique
-- name, string (255 characters)
-- If the table already exists, your script should not fail

SELECT band_name, COALESCE(split, 2022) - formed as lifespan FROM metal_bands
WHERE style like '%Glam rock%' ORDER BY lifespan DESC;
