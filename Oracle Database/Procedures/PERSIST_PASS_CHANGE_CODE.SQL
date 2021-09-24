create or replace PROCEDURE "PERSIST_PASS_CHANGE_CODE" (
  i_user_mail       IN USERS.USER_MAIL%TYPE,
  o_passchangecode OUT USERS.PASSCHANGECODE%TYPE
)
AS 
BEGIN
    
    o_passchangecode := dbms_random.value(100000, 999999);
    
    UPDATE USERS
       SET PASSCHANGECODE = o_passchangecode
     WHERE USER_MAIL = i_user_mail;
     
    COMMIT;

END PERSIST_PASS_CHANGE_CODE;