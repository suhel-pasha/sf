({
	doInit : function(component, event, helper) {
		helper.fetchhPrograms(null,component);
	},
    searchPrograms: function(component,event,helper) {
        var searchValue=component.find("searchField").get("v.value");
        helper.fetchhPrograms(searchValue,component);
    },
    navigate : function(component, event, helper) {
        var navigateEvent = $A.get("e.force:navigateToComponent");
        navigateEvent.setParams({
            componentDef: "c:createNew"
            
        });
        navigateEvent.fire();
    }

   
})