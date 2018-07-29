public with sharing class ContactData {

   // public String save { get; set; }

    
    public id cid{get; set;}
    public list<contact> lstcon{get;set;}
    
    public contactdata(){
        lstcon = [select id, lastname, phone, firstname, email, fax from contact limit 5];
    }
  
    public pagereference UpdateRecords(){
        
        update lstcon;
       
            return null;
        }
       
    }