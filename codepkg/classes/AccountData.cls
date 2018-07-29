public class AccountData {
    public list<account> lstacc{get; set;}
    public list<account> getAccountRecords(){
        list<account> lstacc = [select id, name, rating, phone, industry,type from account limit 20];
        return lstacc;
    }
}