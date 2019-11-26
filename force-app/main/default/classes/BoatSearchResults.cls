/**
 * Created by vdobatovkin on 11/12/2019.
 */

public with sharing class BoatSearchResults {

    @AuraEnabled
    public static List<Boat__c> getBoats(String boatType) {
        List<Boat__c> boats;
        if (boatType.length() > 0) {
            boats = [
                    SELECT Name,Description__c,
                            Price__c,Length__c,
                            Contact__r.Name,
                            Contact__r.Email,
                            Contact__r.HomePhone,
                            BoatType__r.Name,
                            Picture__c,
                            Geolocation__Longitude__s,
                            Geolocation__Latitude__s
                    FROM Boat__c
                    WHERE BoatType__c = :boatType
                    ORDER BY Id
            ];
        } else {
            boats = [
                    SELECT Name,Description__c,
                            Price__c,Length__c,
                            Contact__r.Name,
                            Contact__r.Email,
                            Contact__r.HomePhone,
                            BoatType__r.Name,
                            Picture__c,
                            Geolocation__Longitude__s,
                            Geolocation__Latitude__s
                    FROM Boat__c
                    ORDER BY Id
            ];
        }

        return boats;

    }

}