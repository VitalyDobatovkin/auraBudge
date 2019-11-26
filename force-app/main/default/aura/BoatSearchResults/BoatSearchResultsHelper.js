({
    onSearch: function (component, event) {
        var action = component.get('c.getBoats');
        action.setParams({
            'boatType': component.get('v.boatTypeId')
        });

        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                var boats = response.getReturnValue();

                component.set("v.boats", boats);
            }
        }));
        $A.enqueueAction(action);

    }
});