trigger AccountTrigger on Account (after insert,after update) {

    Set<String> recordIds = new Set<String>();
    for(Account a : Trigger.New) {
        recordIds.add(a.Id);
    }
    RecordFolderHandler.createRecordFolders(recordIds);

}