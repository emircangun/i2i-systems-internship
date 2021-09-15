-- Exercise SQL01-EX-03
SELECT
    SUBSTR(e.PHONE_NUMBER, 1, 3) As Operator,
    Count(*) as Total
FROM HR.EMPLOYEES e
GROUP BY SUBSTR(e.PHONE_NUMBER, 1, 3);

SELECT *
FROM
(
    SELECT
        SUBSTR(e.PHONE_NUMBER, 1, 3) As Operator,
        Count(*) as Total
    FROM HR.EMPLOYEES e
    GROUP BY SUBSTR(e.PHONE_NUMBER, 1, 3)
)
PIVOT
(
   MAX(Total) FOR Operator IN (515, 590, 603, '011', 650)
);