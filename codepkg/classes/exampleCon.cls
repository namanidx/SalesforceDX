/***  Controller: ***/
public class exampleCon {
public list<account> lstacc{get;set;}
    Integer count = 0;
                        
    public PageReference incrementCounter() {
            count++;
            return null;
    }
                    
    public Integer getCount() {
        return count;
    }
    public pagereference AccData(){
        lstacc = [select id, name, rating from account where rating = 'hot'];
        return null;
    }
    public list<account> Acc() {
        return lstAcc;
    }
}