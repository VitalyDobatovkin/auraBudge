/**
 * Created by vdobatovkin on 11/12/2019.
 */

public with sharing class BoatController {

    @AuraEnabled
    public static String getBoatsFromDataBase(){
        List<BoatType__c> boatTypes = [SELECT Id,Name FROM BoatType__c];

        return JSON.serialize(boatTypes);
    }

}