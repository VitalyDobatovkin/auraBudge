({
    onFullDetails: function (component, event, helper) {

        var navEvt = $A.get("e.force:navigateToSObject");

        navEvt.setParams({

            "recordId": component.get("v.boat.Id")

        });

        navEvt.fire();
    },
    doInit: function (component) {
        var isEnable = $A.get("e.force:navigateToSObject");
        if (isEnable) {
            component.set('v.showButton', true);
        }
    }
});