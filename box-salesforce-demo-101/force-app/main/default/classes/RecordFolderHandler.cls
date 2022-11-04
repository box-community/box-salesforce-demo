public class RecordFolderHandler {
    @future(callout=true)
    public static void moveOpportunityRecordFolders(Set<String> oppRecordIds) {
        System.debug('Expected to move up to record folders: ' + oppRecordIds.size());
        box.Toolkit boxToolkit = new box.Toolkit();
        List <Opportunity> opps = [SELECT Id, AccountId FROM Opportunity WHERE Id = :oppRecordIds];
        if (opps.size() > 0) {
            for (Opportunity opp : opps) {
                String acctFolderId = boxToolkit.createFolderForRecordId(opp.AccountId, null, true);
                if(acctFolderId == null) {
                    system.debug('Couldn\'t create Account folder due to error' + boxToolkit.mostRecentError);
                } else {
                    System.debug('Created or found Account folder with folder ID: ' + acctFolderId);
                    String sourceFolderID = boxToolkit.getFolderIdByRecordId(opp.Id);
                    system.debug('Attempting to move Opportunity folder to its parent: ' + sourceFolderID + ' -> ' + acctFolderId);
                    Boolean moveSuccessful = boxToolkit.moveFolder(sourceFolderID, acctFolderId, null);
                    if(moveSuccessful == false) { 
                        system.debug('Couldn\'t move Opportunity folder due to error' + boxToolkit.mostRecentError); 
                    }
                }
            }
        }
        boxToolkit.commitChanges(); 
    }
}