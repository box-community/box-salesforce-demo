@isTest
private class RecordFolderHandlerTest {
    
    @isTest(SeeAllData=false)
    static void SingleRecordFolderCreationTest() {
        Set<String> recordIds = new Set<String>();
        Account acct = new Account(Name='Test Account Insert');
        insert acct;
        List<Account> singleAccount = [SELECT Id FROM Account];
        recordIds.add(singleAccount[0].Id);
        System.Test.startTest();
        RecordFolderHandler.createRecordFolders(recordIds);
        System.Test.stopTest();
    }

    @isTest(SeeAllData=false)
    static void MoveOpportunityRecordFolderTest() {
        Set<String> recordIds = new Set<String>();
        Account acct = new Account(Name='Test Account with Opp Insert');
        insert acct;
        List<Account> singleAccount = [SELECT Id FROM Account];
        Opportunity opp = new Opportunity(AccountId=singleAccount[0].Id,Name='Test Opportunity Insert',CloseDate=System.today() + 90,StageName='oppStage');
        insert opp;
        List<Opportunity> singleOpp = [SELECT Id FROM Opportunity];
        recordIds.add(singleOpp[0].Id);
        System.Test.startTest();
        RecordFolderHandler.moveOpportunityRecordFolders(recordIds);
        System.Test.stopTest();
    }

}
