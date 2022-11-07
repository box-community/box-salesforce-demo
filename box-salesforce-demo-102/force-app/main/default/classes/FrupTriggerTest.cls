@isTest
private class FrupTriggerTest {

    @isTest
    static void SingleFrupTriggerInsertTest() {
        box__FRUP__c frup = new box__FRUP__c(box__Folder_ID__c='12345',box__Record_ID__c='aaaaaa');
        System.Test.startTest();
        insert frup;
        System.Test.stopTest();
        List<box__FRUP__c> singleFrup = [SELECT Id FROM box__FRUP__c];
        System.AssertEquals (1, singleFrup.size(), 'Expected 1 account to be created');
    }
   
}
