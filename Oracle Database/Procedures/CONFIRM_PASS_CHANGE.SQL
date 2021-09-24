create or replace PROCEDURE "CONFIRM_PASS_CHANGE" (
  i_user_mail       IN USERS.USER_MAIL%TYPE,
  i_new_password    IN USERS.PASSWORD%TYPE
)
AS
BEGIN
    -- setting new password after validation
    -- according to the user mail
    UPDATE USERS
       SET PASSWORD = i_new_password,
           PASSCHANGECODE = NULL
     WHERE USER_MAIL = i_user_mail;

END CONFIRM_PASS_CHANGE;

/*

CREATE OR REPLACE PROCEDURE "CONFIRM_PASS_CHANGE" (
  i_user_mail       IN USERS.USER_MAIL%TYPE,
  i_new_password    IN USERS.PASSWORD%TYPE
)
AS
BEGIN

  UPDATE USERS
      SET PASSWORD = i_new_password
          PASSCHANGECODE = NULL;
    WHERE USER_MAIL = i_user_mail;
    
END CONFIRM_PASS_CHANGE;

*/