@isTest
private class OpportunityTriggerTest {

    @isTest
    static void SingleOpportunityTriggerInsertTest() {
        Account acct = new Account(Name='Test Account with Opp Insert');
        insert acct;
        List<Account> singleAccount = [SELECT Id FROM Account];
        Opportunity opp = new Opportunity(AccountId=singleAccount[0].Id,Name='Test Opportunity Insert',CloseDate=System.today() + 90,StageName='oppStage');
        System.Test.startTest();
        insert Opp;
        System.Test.stopTest();
        List<Opportunity> singleOpportunity = [SELECT Id FROM Opportunity];
        System.AssertEquals (1, singleOpportunity.size(), 'Expected 1 Opportunity to be created');
    }

    @isTest
    static void SingleOpportunityTriggerUpdateTest() {
        Account acct = new Account(Name='Test Account with Opp Insert');
        insert acct;
        List<Account> singleAccount = [SELECT Id FROM Account];
        Opportunity opp = new Opportunity(AccountId=singleAccount[0].Id,Name='Test Opportunity Insert',CloseDate=System.today() + 90,StageName='oppStage');
        insert Opp;
        Opp.Name = 'Test Opportunity Update';
        System.Test.startTest();
        update Opp;
        System.Test.stopTest();
        List<Opportunity> singleOpportunity = [SELECT Name FROM Opportunity];
        System.AssertEquals ('Test Opportunity Update', singleOpportunity[0].Name, 'Expected 1 Opportunity to be updated');
    }

}
