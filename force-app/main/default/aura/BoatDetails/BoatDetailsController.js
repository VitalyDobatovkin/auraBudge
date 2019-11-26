({
    onBoatSelected: function (component, event, helper) {
        var boat = event.getParam('boat');
        component.set('v.id', boat.Id);
        component.find("service").reloadRecord();
    },
    onRecordUpdated: function (component, event, helper) {
        var BRcmp = component.find("BRcmp");
        if (typeof BRcmp !== 'undefined') {
            BRcmp.refresh();
        }
    },
    onBoatReviewAdded: function (component, event, helper) {
        var tab = component.find('tabs');
        tab.set("v.selectedTabId",'boatreviewtab');
        var BRcmp = component.find("BRcmp");
        var auraMethodResult = BRcmp.refresh();
    }
});