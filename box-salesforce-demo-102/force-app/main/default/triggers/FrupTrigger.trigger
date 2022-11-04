trigger FrupTrigger on box__FRUP__c (after insert) {
    if(System.IsBatch() == false && System.isFuture() == false){ 
        Set<String> recordIds = new Set<String>();
        for(box__FRUP__c frup : Trigger.New) {
            recordIds.add(frup.box__Record_ID__c);
        }
        RecordFolderHandler.moveOpportunityRecordFolders(recordIds);  
    } 
}