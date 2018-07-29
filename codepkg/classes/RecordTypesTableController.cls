public class RecordTypesTableController {
 public list<recordtype> opptyRecTypes{get; set;}
    public RecordType recordType{get;set;}
    public list<SelectOption> options{get;set;}
    public PageReference pageRef;
    public list<account> lstacc{get; set;}
       
    public list<SelectOption> getRecordTypes() {
        list<SelectOption> options = new list<SelectOption>();
        opptyRecTypes = [SELECT ID, name, description FROM RecordType WHERE SObjectType = 'opportunity' ORDER BY name];
        lstacc = [select id, name from account limit 10];
        system.debug('wwwwwwwwwww' + opptyRecTypes );
      //  for (RecordType rts : opptyRecTypes) {
            for (RecordType rt : opptyRecTypes) {
                options.add(new SelectOption(rt.ID, rt.Name));
            
        }
        return options;
    }
}