CREATE FUNCTION CalcularDigitoVerificacion (@NIT VARCHAR(15))
RETURNS INT
AS
BEGIN
    DECLARE @i INT = 1;
    DECLARE @z INT;
    DECLARE @y INT;
    DECLARE @x INT = 0;
    DECLARE @dv1 INT;
    DECLARE @arreglo TABLE (id INT IDENTITY(1,1), valor INT);
    
    -- Valores constantes
    INSERT INTO @arreglo VALUES (3), (7), (13), (17), (19), (23), (29), (37), (41), (43), (47), (53), (59), (67), (71);
    
    SET @z = LEN(@NIT);

    -- Realizar el cálculo
    WHILE @i <= @z
    BEGIN
        SELECT @y = CAST(SUBSTRING(@NIT, @i, 1) AS INT);
        SET @x = @x + (@y * (SELECT valor FROM @arreglo WHERE id = (@z + 1 - @i)));
        SET @i = @i + 1;
    END
    
    SET @y = @x % 11;

    IF @y > 1
        SET @dv1 = 11 - @y;
    ELSE
        SET @dv1 = @y;

    RETURN @dv1;
END;
