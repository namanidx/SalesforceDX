public class getAccountAddressClass {
public ApexPages.StandardController stdCtrl;
public account acc{get;set;}
    public getAccountAddressClass(ApexPages.StandardController controller) {
        stdCtrl = controller;
    }
    public void populateFields(){
       contact cont=(contact) stdCtrl.getRecord(); 
       acc = [select id, name, billingcity,rating, billingcountry from account where id =: cont.accountid];
       cont.mailingCity = acc.billingCity;
       cont.rating__c = acc.rating;
    }

}