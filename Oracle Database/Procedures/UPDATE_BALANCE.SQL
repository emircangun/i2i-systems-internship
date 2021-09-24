create or replace PROCEDURE "UPDATE_BALANCE" (
  i_msisdn      IN BALANCE.MSISDN%TYPE,
  i_package_id  IN BALANCE.PACKAGE_ID%TYPE,
  i_used_amount IN BALANCE.USED_AMOUNT%TYPE
)
AS 
BEGIN

    UPDATE BALANCE
       SET LAST_UPDATE = SYSDATE,
           USED_AMOUNT = i_used_amount
     WHERE MSISDN = i_msisdn
       AND PACKAGE_ID = i_package_id;
    
    COMMIT;

END UPDATE_BALANCE;