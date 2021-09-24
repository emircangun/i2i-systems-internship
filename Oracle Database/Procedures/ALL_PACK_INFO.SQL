create or replace PROCEDURE "ALL_PACK_INFO" (
    all_packages OUT SYS_REFCURSOR
)
AS 
BEGIN
  -- returning all packages info
  OPEN all_packages FOR
  SELECT    P.PACKAGE_ID PACKAGE_ID,
            P.PACKAGE_NAME PACKAGE_NAME,
            P.PACKAGE_TYPE PACKAGE_TYPE,
            P.PACKAGE_LIMIT PACKAGE_LIMIT,
            P.BUSINESS_ZONE BUSINESS_ZONE,
            P.VISIBILITY VISIBILITY,
            B.BEGIN_DATE BEGIN_DATE,
            B.END_DATE END_DATE,
            B.LAST_UPDATE LAST_UPDATE,
            B.USED_AMOUNT USED_AMOUNT,
            U.USER_MAIL USER_MAIL,
            U.MSISDN MSISDN,
            U.USER_SURNAME USER_SURNAME,
            U.USER_NAME USER_NAME,
            U.PASSCHANGECODE PASSCHANGECODE
  FROM PACKAGES P
  INNER JOIN BALANCE B
          ON (P.PACKAGE_ID = B.PACKAGE_ID)
  INNER JOIN USERS U
          ON (B.USER_ID = U.USER_ID);

END ALL_PACK_INFO;

-- Return all packages in the database
-- To return all tuples, SYS_REFCURSOR is used

-- example usage of SYS_REFCURSOR:
    -- LOOP 
    --   FETCH l_cursor
    --   INTO  l_ename, l_empno, l_deptno;
    --   EXIT WHEN l_cursor%NOTFOUND;
    --   DBMS_OUTPUT.PUT_LINE(l_ename || ' | ' || l_empno || ' | ' || l_deptno);
    -- END LOOP;

/*
BALANCE:
  USED_AMOUNT
  BEGIN_DATE
  END_DATE

PACKAGES:
    PACKAGE_NAME
    PACKAGE_TYPE
    PACKAGE_LIMIT
    BUSINESS_ZONE
    VISIBILITY
    


*/