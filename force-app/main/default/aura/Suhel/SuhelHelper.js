({
	fetchhPrograms : function(searchVal,component) {
       component.set("v.columnsToDisplay", [
           {label: "Program No", fieldName:"Name",type:"AutoNumber"},
           {label: "Program Description", fieldName:"Description__c",type:"text"},
           {label: "Date", fieldName:"Date__c",type:"date"},
           {label: "Name", fieldName:"Name__c",type:"text"},
           {label: "Program", fieldName:"Program__c",type:"text"}



       ]);
        var action = component.get("c.fetchPrograms");
        action.setParams({
            "searchKeyWord":searchVal
        });
        
        action.setCallback(this, function(response){
           var state = response.getState();
        if(state==="SUCCESS") {
            component.set("v.listPrograms",response.getReturnValue());
        } else {
            alert("failed")
        }
                           });
    $A.enqueueAction(action);
	}
})