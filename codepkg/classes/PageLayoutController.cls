public with sharing class PageLayoutController {
    public id aid{get; set;}
    public PageLayoutController() {

    }

  

    public PageLayoutController(ApexPages.StandardController controller) {

    }
    public list<contact> getRecords(){
   
     aid = apexpages.currentpage().getparameters().get('id') ;  
   
    list<Contact> ConAcc = [select id, lastname, name, phone, account.name, account.Phone, account.rating from contact where id =: aid ];
    
    return ConAcc ;
    }
}