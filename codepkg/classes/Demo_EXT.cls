public with sharing class Demo_EXT{
public PageReference pageRef;
public RecordType recordType{get;set;}
public Opportunity opp;
public string RecordTypeId {get; set;}
    public Demo_EXT(ApexPages.StandardController myController){
        this.opp = (opportunity)myController.getRecord();
        if (Apexpages.currentPage().getParameters().get('RecordType') != null){
            RecordTypeId = Apexpages.currentPage().getParameters().get('RecordType');
        }
        system.debug('0000000000 ' + RecordTypeId );
        system.debug('----------- ' + opp.recordtypeid);
    }

    public PageReference Redirect() {
 /* id id = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Record Type A').getRecordTypeId();
 system.debug('000001111' + id );
   if(opp.RecordTypeId != id){
   system.debug('00000' + opp.RecordType.developerName );
       // If(opp.recordtypeId != '0120O000000L6Ve'){
            system.debug('----'+ opp.recordtypeid);
            pageRef = new PageReference('/006/e?nooverride=1');
            return pageRef;
        }
        else
           */
        
        return null; 
    }
}