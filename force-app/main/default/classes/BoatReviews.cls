/**
 * Created by vdobatovkin on 11/15/2019.
 */

public with sharing class BoatReviews {

    @AuraEnabled
    public static List<BoatReview__c> getAll(String boatId) {

        List<BoatReview__c> reviews = [
                SELECT Id,
                        Name,
                        Comment__c,
                        Rating__c,
                        LastModifiedDate,
                        CreatedDate,
                        CreatedBy.Name,
                        CreatedBy.SmallPhotoUrl,
                        CreatedBy.CompanyName
                FROM BoatReview__c
                WHERE Boat__c = :boatId
        ];
        return reviews;

    }

}