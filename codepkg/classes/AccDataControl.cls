public class AccDataControl {
  public List<account> acclist{get; set;}

    public AccDataControl (){
        acclist= [
            SELECT Name, phone, rating, type, billingcity, Expiry_Date__c from account limit 2];
    }

    public PageReference save(){
        try{
            update acclist;
        }catch(DMLException e){
            //Report DML exceptions to the Apex Page messages element in Visualforce
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,e.getMessage()));
        }

        //Returning null for the page reference, directs user back to the same VF page, but rerenders values.
        //Otherwise, you could return another Visualforce page or a link to a record's detail page here as well.
        return null;
    }

    public PageReference cancel(){
        //Return a link to the parent record perhaps or do something else besides return null here
        return null;
    }
}