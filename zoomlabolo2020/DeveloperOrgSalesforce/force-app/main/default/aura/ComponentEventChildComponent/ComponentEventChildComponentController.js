({
	fireComponentEvent:function(component, event, helper) {
        console.log("fireing event");
		var cmpEvent=component.getEvent("registeringComponentEvent");
        cmpEvent.fire();
	}
})