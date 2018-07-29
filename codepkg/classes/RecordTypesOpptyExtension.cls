public class RecordTypesOpptyExtension {
    public string SelectedRecordTypeId{get;set;}
    public Opportunity opp{get;set;}
    public id Rid;
    public string RecordTypeId {get; set;}
    public RecordType recordType{get;set;}
    public list<SelectOption> options{get;set;}
    public PageReference pageRef;
    public RecordTypesOpptyExtension(ApexPages.StandardController mycontroller) {
     opp = (opportunity)myController.getRecord();
        if (Apexpages.currentPage().getParameters().get('RecordType') != null){
            RecordTypeId = Apexpages.currentPage().getParameters().get('RecordType');
        }
      
       Rid = opp.recordtypeId;
       system.debug('000001111' + RecordTypeId );
       system.debug('000001111' + rid);
     /*  Rid= apexpages.currentpage().getparameters().get('RecordType');
       system.debug('000001111' + rid);*/
     // this.controller = controller;
    }
    public list<SelectOption> getRecordTypes() {
        list<SelectOption> options = new list<SelectOption>();
        for (list<RecordType> rts : [SELECT ID, name FROM RecordType WHERE SObjectType = 'opportunity' ORDER BY name]) {
            for (RecordType rt : rts) {
                options.add(new SelectOption(rt.ID, rt.Name));
            } 
        }
        return options;
    }
    public pagereference getRedir(){
    system.debug('entered here');
           
      //  system.debug('--- '+ recordTypeName );
       // id id = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Record Type A').getRecordTypeId();
       // id Rid1 = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('recordType').getRecordTypeId();
       // id Rid = [select id from recordType where id =: SelectedRecordTypeId and SObjectType = 'opportunity'].id;
       id id1 = opp.RecordTypeId;
       system.debug('--- ppppid1 ' + id1);
       recordtype recordTypeName = [SELECT ID, name FROM RecordType WHERE SObjectType = 'opportunity' and id=:opp.RecordTypeId limit 1];
       system.debug('--- pppp' + recordTypeName );
       system.debug('--- ppppid1 ' + id1);
      if(recordTypeName.name == 'Record Type C')
       {pageRef = new PageReference('/apex/OppRecordTypeSelectionC');
       system.debug('--- ppppid1 ' + id1);}
      else if(recordTypeName.name == 'Record Type B')
       {pageRef = new PageReference('/apex/OppRecordTypeSelectionB');
       system.debug('--- ppppid1 ' + id1);}
       else if(recordTypeName.name == 'Record Type A')
       //pageRef = new PageReference('/apex/OppRecordTypeSelection'); 
       {system.debug('--- ppppid1 ' + id1);
       pageRef = new pagereference('/006/e?RecordType='+opp.RecordTypeId+'&nooverride=1');}
       else 
       {pageRef = new pagereference('/006/e?RecordType='+opp.RecordTypeId+'&nooverride=1');
       system.debug('--- ppppid1 ' + id1);}
        //pagereference p = new pagereference('/006/e');
        return pageRef;
    }
}