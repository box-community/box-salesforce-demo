@isTest
private class AccountTriggerTest {

    @isTest
    static void SingleAccountTriggerInsertTest() {
        Account acct = new Account(Name='Test Account Insert');
        System.Test.startTest();
        insert acct;
        System.Test.stopTest();
        List<Account> singleAccount = [SELECT Id FROM Account];
        System.AssertEquals (1, singleAccount.size(), 'Expected 1 account to be created');
    }

    @isTest
    static void SingleAccountTriggerUpdateTest() {
        Account acct = new Account(Name='Test Account Insert');
        insert acct;
        acct.Name = 'Test Account Update';
        System.Test.startTest();
        update acct;
        System.Test.stopTest();
        List<Account> singleAccount = [SELECT Name FROM Account];
        System.AssertEquals ('Test Account Update', singleAccount[0].Name, 'Expected 1 account to be updated');
    }

}
