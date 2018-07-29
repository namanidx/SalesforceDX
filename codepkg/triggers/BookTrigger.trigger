trigger BookTrigger on Book__c (before insert) {
    for(book__c b : trigger.new){
        if(b.price__c == null)
            b.price__c.adderror('please enter price');
    }

}