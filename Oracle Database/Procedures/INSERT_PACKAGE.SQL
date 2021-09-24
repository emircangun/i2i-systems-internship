create or replace PROCEDURE "INSERT_PACKAGE" (
  i_package_id    IN PACKAGES.PACKAGE_ID%TYPE,
  i_package_name  IN PACKAGES.PACKAGE_NAME%TYPE,
  i_package_type  IN PACKAGES.PACKAGE_TYPE%TYPE,
  i_package_limit IN PACKAGES.PACKAGE_LIMIT%TYPE,
  i_business_zone IN PACKAGES.BUSINESS_ZONE%TYPE,
  i_visibility    IN PACKAGES.VISIBILITY%TYPE
)
AS 
BEGIN
  
  INSERT INTO PACKAGES (PACKAGE_ID, PACKAGE_NAME, PACKAGE_TYPE, PACKAGE_LIMIT, BUSINESS_ZONE, VISIBILITY)
  VALUES (i_package_id, i_package_name, i_package_type, i_package_limit, i_business_zone, i_visibility);

  COMMIT;

END INSERT_PACKAGE;
