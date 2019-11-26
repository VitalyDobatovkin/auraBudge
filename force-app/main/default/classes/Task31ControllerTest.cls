/**
 * Created on 9/23/2019.
 *
 * @author vdobatovkin
 * @version 1.0
 */

@isTest
public with sharing class Task31ControllerTest {

    @testSetup
    static void createRecords() {
        /*Site site = new Site();
        site.Description = 'test description';
        insert site;*/
    }


    @isTest//
    static void getDescriptionTest() {
        List<Site> site = [SELECT Name FROM Site WHERE Name='vrptask31'];
        System.debug(site);

    }
}