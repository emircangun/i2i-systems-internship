create or replace PROCEDURE "AUSER_PACKAGE_INFO" (
    i_msisdn IN USERS.MSISDN%TYPE,
    o_packages OUT SYS_REFCURSOR
)
AS 
BEGIN
    -- returning packages of the given user
    OPEN o_packages FOR
    SELECT P.PACKAGE_NAME,
           P.PACKAGE_TYPE,
           P.PACKAGE_LIMIT,
           P.BUSINESS_ZONE,
           P.VISIBILITY,
           B.END_DATE,
           B.BEGIN_DATE,
           B.USED_AMOUNT
    FROM BALANCE B
    INNER JOIN PACKAGES P
            ON (B.PACKAGE_ID = P.PACKAGE_ID)
    WHERE B.USER_ID IN (SELECT USER_ID
                          FROM USERS
                         WHERE MSISDN = i_msisdn);
    
    
END AUSER_PACKAGE_INFO;