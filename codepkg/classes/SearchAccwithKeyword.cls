public class SearchAccwithKeyword {
    public string serachKeyword{get; set;}
    public list<account> lstacc{get; set;}
    
    
    public void SearchAccswithKeyword(){
       // myQuery = 'select id, name, rating, phone from account where name like : serachKeyword ';
        lstacc = database.query('select id, name, rating, phone from account where name like '+'\''+ serachKeyword + '%' + '\'');
    }
}