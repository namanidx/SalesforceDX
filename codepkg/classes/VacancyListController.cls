public class VacancyListController {
    public string searchCity{get; set;}
  public string searchName{get; set;}
    public string myQuery;
    public list<vacancy__c> lstvac{get; set;}
    public VacancyListController(){
        lstvac = new list<vacancy__c>();
        //string myquery = '';
    }
    
    public pagereference doSearch(){
        myquery = 'select id, name, city__C, Type__c, Experience_Level__c,Salary__c from vacancy__c ';
        myquery = myquery + 'where city__c = ' + '\''+ searchCity + '\'';
        system.debug('--------- my query ' + myquery );
        lstvac = database.query(myquery);
        return null;
        
        
    
    }
}