trigger FrupTrigger on box__FRUP__c (after insert) {
    Set<String> recordIds = new Set<String>();
    for(box__FRUP__c frup : Trigger.New) {
        recordIds.add(frup.box__Record_ID__c);
    }
    RecordFolderHandler.moveOpportunityRecordFolders(recordIds);   
}