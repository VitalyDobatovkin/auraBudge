({
    doInit: function (component, event, helper) {
        helper.onInit(component, event);
    },
    onSave: function (component, event, helper) {
        component.find("service").saveRecord(function (saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                // record is saved successfully
                var resultsToast = $A.get("e.force:showToast");
                if(resultsToast){
                    resultsToast.setParams({
                        "title": "Saved",
                        "message": "Boat Review Created"
                    });
                    resultsToast.fire();
                    var boatReviewAddedEvent = component.getEvent('BoatReviewAdded');
                    boatReviewAddedEvent.fire();
                }
                else {
                    alert('Boat Review Created');
                }

            } else if (saveResult.state === "INCOMPLETE") {
                // handle the incomplete state
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                // handle the error state
                console.log('Problem saving boatReview, error: ' + JSON.stringify(saveResult.error));
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        });
        helper.onInit(component, event);
    },
    onRecordUpdated: function (component, event, helper) {

    }
});