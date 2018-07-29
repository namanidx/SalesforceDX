public class SampleClass {
   
    public string name;
    public integer accNumber;
    Public integer FirstNum = 10;
    Public integer SecondNum = 100;
    public account acc;
    public list<account> lst;
    public SampleClass(){
       
        system.debug('the constructor call ' );
    }
    
    public account addNum(){
        	account acc = new account();
        	if(acc.rating == '' || acc.rating == null)
                acc.rating = 'hot';
        	return acc;
        
       
        }     
    
}