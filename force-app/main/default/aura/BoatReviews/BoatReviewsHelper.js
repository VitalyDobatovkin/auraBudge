({
    onInit: function (component, event) {
        var boatId = component.get('v.boat.Id');
        var action = component.get('c.getAll');
        action.setParams({
                'boatId': boatId
            }
        );
        action.setCallback(this, function (response) {
            var state = response.getState();

            if (state === "SUCCESS") {
                console.log('SUCCESS');
                var reviews = response.getReturnValue();
                component.set('v.boatReviews', reviews);
            } else {
                console.log('ERROR');
            }
        });
        $A.enqueueAction(action);


    }
});