--1

/*CREATE PROCEDURE Factorial
    @Number INT,
    @Result INT OUTPUT
AS
BEGIN
    IF @Number < 0
    BEGIN
        PRINT 'factorial otricatelnogo cisla net'
        SET @Result = NULL
        RETURN
    END

    DECLARE @i INT = 1
    SET @Result = 1

    WHILE @i <= @Number
    BEGIN
        SET @Result = @Result * @i
        SET @i = @i + 1
    END
END
*/
/*
DECLARE @Result INT
EXEC Factorial @Number = 5, @Result = @Result OUTPUT
SELECT @Result AS FactorialResult
*/


--2

/*
CREATE PROCEDURE LazyStudents
    @Count INT OUTPUT
AS
BEGIN
    SELECT s.Id AS StudentID, s.FirstName, s.LastName
    FROM Students AS s
    LEFT JOIN S_Cards AS sc ON s.Id = sc.Id_Student
    WHERE sc.Id_Student IS NULL
    SELECT @Count = COUNT(*)
    FROM Students AS s
    LEFT JOIN S_Cards AS sc ON s.Id = sc.Id_Student
    WHERE sc.Id_Student IS NULL
END
*/
/*
DECLARE @Count INT
EXEC LazyStudents @Count = @Count OUTPUT
SELECT @Count AS LazyStudentsCount
*/


--3
/*
CREATE FUNCTION Minbookspages
(
    @PublisherId INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        b.Id,
        b.Name,
        b.Pages
    FROM 
        Books AS b
    WHERE 
        b.Id_Press = @PublisherId
    AND 
        b.Pages = (SELECT MIN(Pages) 
		FROM Books 
		WHERE Id_Press = @PublisherId)
)
*/
/*
DECLARE @PublisherId INT = 5
SELECT *
FROM Minbookspages(@PublisherId)
*/





--4
/*
CREATE FUNCTION Avgpages
(
    @Avgpages INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.Name AS PublisherName
    FROM 
        Press AS p
    JOIN 
        Books AS  b ON p.Id = b.Id_Press
    GROUP BY 
        p.Name
    HAVING 
        AVG(b.Pages) > @Avgpages
)*/

/*
DECLARE @Avgpages INT = 400
SELECT *
FROM Avgpages(@Avgpages)
*/






