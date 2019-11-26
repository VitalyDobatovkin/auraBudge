({
    onFormSubmit: function (component, event, helper) {
        console.log("event received by BoatSearchController.js");
        var formData = event.getParam("formData");
        var boatTypeId = formData.boatTypeId;
        var BSRcmp = component.find("BSRcmp");
        BSRcmp.search(boatTypeId);
    }
});