public class UnlockRecordsClass
{
    @InvocableMethod(label='Unlock Records' description='Unlock Records')
    public static List<ID> unlockRecords(List<ID> ids)
    {
        List<ID> returnSuccessRecords=new List<ID>();
        
        Approval.UnlockResult[] finalResults =  Approval.unlock(ids);
        for(Approval.UnlockResult apResult :finalResults)
        {
            if(!apResult.isSuccess())
            {
                for(Database.Error error: apResult.getErrors())
                {
                    system.debug('@@@ Error after calling UnlockRecordsClass with id: '+apResult.getId()+' and error message : '+error.getMessage());
                }
            }
            else
            {
                 returnSuccessRecords.add(apResult.getId());
            }
        }
        return returnSuccessRecords;
    }
}