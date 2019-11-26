/**
 * Created on 9/23/2019.
 *
 * @author vdobatovkin
 * @version 1.0
 */

public with sharing class Task31ControllerPart1 {

    
    public  Boolean getDate() {
        Campaign campaign = [SELECT id,StartDate,EndDate FROM Campaign WHERE Name = 'Task31Campaign'];
        Datetime todaysDatetime = System.now();

        if (todaysDatetime >= campaign.StartDate && todaysDatetime <= campaign.EndDate) {
            return true;
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR,'The granting period is finished. Please try next year!'));
            return false;
        }
    }

}