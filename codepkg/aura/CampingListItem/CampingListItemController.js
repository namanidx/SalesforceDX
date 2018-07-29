({
	packItem : function(component, event, helper) {
        var buttonclick = event.getSource();
        //var buttonMessage = buttonclick.get("v.label");
        component.set("v.item.Packed__c" , true);
        component.set("v.disabled", true);
		
	}
})