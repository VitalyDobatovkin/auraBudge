({
    onBoatClick: function (component, event, helper) {
        var cmpSelectEvent = component.getEvent('BoatSelect');
        var appSelectedEvent = $A.get('e.c:BoatSelected');
        var appPlotMapMarkerEvent = $A.get('e.c:PlotMapMarker');

        var selectedBoat = component.get('v.boat');

        cmpSelectEvent.setParams({
            "BoatId": selectedBoat.Id
        });
        appSelectedEvent.setParams({
            "boat": selectedBoat
        });
        appPlotMapMarkerEvent.setParams({
            "lat": selectedBoat.Geolocation__Latitude__s,
            "long": selectedBoat.Geolocation__Longitude__s
        });

        cmpSelectEvent.fire();
        appSelectedEvent.fire();

    }
});