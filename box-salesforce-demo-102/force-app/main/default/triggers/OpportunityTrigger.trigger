trigger OpportunityTrigger on Opportunity (after insert,after update) {

    Set<String> recordIds = new Set<String>();
    for(Opportunity a : Trigger.New) {
        recordIds.add(a.Id);
    }
    RecordFolderHandler.createRecordFolders(recordIds);

}