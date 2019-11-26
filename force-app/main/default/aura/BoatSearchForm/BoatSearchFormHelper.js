({
    getBoatTypes: function (component, event, helper) {
        var action = component.get("c.getBoatsFromDataBase");
        action.setCallback(this, function (response) {
            component.set('v.boatTypes', JSON.parse(response.getReturnValue()));
        });

        $A.enqueueAction(action);
    }
});