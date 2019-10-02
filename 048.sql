/*Please add ; after each select statement*/
CREATE PROCEDURE routeLength()
BEGIN
    SELECT 
        ROUND(SUM(ST_Length(ST_GeomFromText(dataLines.line))), 9) as total
    FROM (
        SELECT 
        -- ca.id, ca.x, ca.y, cb.id, cb.x, cb.y,
        CONCAT('LineString(', ca.x, ' ', ca.y, ', ', cb.x, ' ', cb.y, ')') as line
        FROM cities ca INNER JOIN cities cb ON (ca.id + 1) = cb.id
    ) dataLines;
END