({
    handleSave: function(component, event) {
        var saveAction = component.get("c.createProgram");
            saveContactAction.setParams({
                "program": component.get("v.newProgram")
            });
        
        // Configure the response handler for the action
        saveContactAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                component.set("v.message", "Program saved successfully");
            }
            else if (state === "ERROR") {
                console.log('Problem saving program, response state: ' + state);
            }
            else {
                console.log('Unknown problem, response state: ' + state);
            }
        });

        // Send the request to create the new contact
        $A.enqueueAction(saveAction);
    },
})