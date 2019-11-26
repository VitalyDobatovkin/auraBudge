/**
 * Created on 9/23/2019.
 *
 * @author vdobatovkin
 * @version 1.0
 */

@isTest
public with sharing class Task31ControllerPart1Test {

    @testSetup
    static void createRecords(){
        Campaign campaign = new Campaign();
        campaign.StartDate = Date.newInstance(2019,10,01);
        campaign.EndDate = Date.newInstance(2019,10,30);
        campaign.Name = 'Task31Campaign';

        insert campaign;
    }


    @isTest
    static void getDateTest(){
        Task31ControllerPart1 instance = new Task31ControllerPart1();
        System.assertEquals(true,instance.getDate());

    }

    @isTest
    static void getDateNegativeTest(){
        Task31ControllerPart1 instance = new Task31ControllerPart1();
        
        Campaign campaign = [SELECT StartDate FROM Campaign WHERE Name = 'Task31Campaign'].get(0);
        campaign.StartDate = Date.today() + 1;

        update campaign;

        System.assertEquals(false,instance.getDate());

    }

}