create or replace PROCEDURE "INSERT_BALANCE" (
  i_bal_key       IN BALANCE.BAL_KEY%TYPE,
  i_package_id    IN BALANCE.PACKAGE_ID%TYPE,
  i_user_id       IN BALANCE.USER_ID%TYPE,
  i_partition_key IN BALANCE.PARTITION_KEY%TYPE,
  i_begin_date    IN BALANCE.BEGIN_DATE%TYPE,
  i_end_date      IN BALANCE.END_DATE%TYPE,
  i_last_update   IN BALANCE.LAST_UPDATE%TYPE DEFAULT NULL,
  i_used_amount   IN BALANCE.USED_AMOUNT%TYPE,
  i_msisdn        IN BALANCE.MSISDN%TYPE
)
AS 
BEGIN

  INSERT INTO BALANCE (BAL_KEY, PACKAGE_ID, USER_ID, PARTITION_KEY, BEGIN_DATE, END_DATE, LAST_UPDATE, USED_AMOUNT, MSISDN)
  VALUES (i_bal_key, i_package_id, i_user_id, i_partition_key, i_begin_date, i_end_date, i_last_update, i_used_amount, i_msisdn);

  COMMIT;

END INSERT_BALANCE;
