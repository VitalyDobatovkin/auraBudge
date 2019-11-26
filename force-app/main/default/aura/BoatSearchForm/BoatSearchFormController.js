({
    doInit: function (component, event, helper) {
        helper.getBoatTypes(component, event, helper);
    },
    checkPermission: function (component, event, helper) {
        var isEnabled = $A.get("event.force:createRecord");
        //check if isEnabled is truthy
        if (isEnabled) {
            component.set("v.showNewButton", true);
        }

    },
    createBoat: function (component) {
        var createRecordEvent = $A.get('event.force:createRecord');

        createRecordEvent.setParams({
            'entityApiName': 'Boat__c',
            'defaultFieldValues': {
                'BoatType__c': component.get('v.selectedBoatType')
            },
        });
        createRecordEvent.fire();
    },
    onFormSubmit: function (component, event, helper) {
        var cmpEvent = component.getEvent("formsubmit");
        var selectedBoatType = component.get('v.selectedBoatType');
        if (selectedBoatType === null) {
            selectedBoatType = "";
        }
        cmpEvent.setParams({
            "formData":
                {"boatTypeId": selectedBoatType}
        });
        cmpEvent.fire();

    }


})