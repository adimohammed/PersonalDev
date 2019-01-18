({
	getBMIC : function(comp) {
        var action = comp.get("c.getBMI");
        console.log("##Height:"+comp.get("v.Height"));
        console.log("##Weight:"+comp.get("v.Weight"));
		var height = comp.get("v.Height");
		var weight = comp.get("v.Weight");        
        action.setParams({ height : height , weight : weight });
		
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert("From server: " + response.getReturnValue());
                comp.set("v.BMI", response.getReturnValue());
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

         $A.enqueueAction(action);
	}
})