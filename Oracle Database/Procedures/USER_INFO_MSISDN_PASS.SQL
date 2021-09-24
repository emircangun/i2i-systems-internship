create or replace PROCEDURE "USER_INFO_MSISDN_PASS" (
    i_msisdn IN USERS.MSISDN%TYPE,
    i_password IN USERS.PASSWORD%TYPE,
    o_user_id OUT USERS.USER_ID%TYPE,
    o_user_name OUT USERS.USER_NAME%TYPE,
    o_user_surname OUT USERS.USER_SURNAME%TYPE,
    o_mail OUT USERS.USER_MAIL%TYPE,
    o_msisdn OUT USERS.MSISDN%TYPE
)
AS 
BEGIN

    SELECT USER_ID,
           USER_NAME,
           USER_SURNAME,
           USER_MAIL,
           MSISDN
      INTO o_user_id,
           o_user_name,
           o_user_surname,
           o_mail,
           o_msisdn
      FROM USERS
     WHERE MSISDN = i_msisdn
       AND PASSWORD = i_password;


END USER_INFO_MSISDN_PASS;