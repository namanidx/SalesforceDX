trigger ContactTrigger on Contact (before insert, before update, after insert, before delete, after update) {
    if((trigger.isInsert || Trigger.isUpdate) && Trigger.isBefore ){
    for(Contact con : trigger.new) {
        if(con.phone == '' || con.phone == null || con.email == null || con.fax == null){
        con.adderror('Pleae Enter Phone, Fax and Email');
        }
        if(con.Level__c == null || con.Level__c == '')
            con.Level__c = 'Primary';
            }
        
    }
    if(trigger.isBefore && trigger.isUpdate)
    {
        contact cont = [select id, lastname, reportstoid from contact where lastname =: 'srinu namani'];
        for(contact c : trigger.new){
            if(c.ReportsToid == null )
                c.reportsToid = cont.id;
                
        }
            
    }
}

// (A or B) & C