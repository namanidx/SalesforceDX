Global class AccountBatchJob implements database.Batchable<sobject>{
    
    Global Database.QueryLocator start(database.BatchableContext bc){
        string AccName = 'Bulk Records insert%';
        string myQuery = 'select id, name, rating from account where name like : AccName ';  // 200
       return  database.getQueryLocator(myQuery);
    }
    global void Execute(Database.BatchableContext bc, list<sobject> lstObj)
        
    {
        list<account> lst = new list<account>();
        for(sobject s : lstObj){
            Account accrec = (Account)s;
           
            accrec.name = 'sending mail Batch Apex' ;
            accrec.rating = 'cold';
            if(accrec.phone == null)
                accrec.phone = '888888';
            lst.add(accrec);
        }
        update lst;
        system.debug('------------------' + lstObj);
        
    }
    global void finish(database.BatchableContext bc){
        AsyncApexJob apexJob = [select id, status, NumberofErrors, JobitemsProcessed, TotalJobItems,
                                createdby.email from asyncapexjob where id=: bc.getJobId()];
        //send an email
        Messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
        string[] toEmails = new string[]{apexJob.createdby.email, 'anijobs.vyas@gmail.com','Kokila.sundaram@gmail.com'};
            mail.setToAddresses(toEmails);
        	mail.setSubject('My Apex Job Status' + apexJob.Status);
        	mail.setPlainTextBody('The Batch Apex job with ID ' + apexJob.Id + 'is executed. the no of items processed is'
                                  + apexjob.JobitemsProcessed + 'the no of errors are' + apexjob.NumberofErrors);
        	messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

}