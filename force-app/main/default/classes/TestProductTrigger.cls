@isTest
public class TestProductTrigger {
static Product__c product = new Product__c();
    static List<Product__c> productList = new List<Product__c>();
    @isTest static void testFirst(){
        product.Name = 'Apple';
        product.Added_Date__c = System.now();
        product.Available__c = false;
        productList.add(product);
        insert productList;
        Product__c actualProduct = [SELECT Name,Price__c,Amount__c,Type__c,Added_Date__c,Release_Date__c,Available__c
                                           FROM Product__c WHERE Name = 'Apple'];
        
        
        System.assertEquals(String.valueOf(productList.get(0).Id), String.valueOf(actualProduct.Id));
    }
    @isTest static void testSecond(){
        
        productList.add(product);
        insert productList;
        
        productList.get(0).Name = 'NewName';
            
        Product__c actualProduct = [SELECT Name,Price__c,Amount__c,Type__c,Added_Date__c,Release_Date__c,Available__c
                                           FROM Product__c];
        
        actualProduct.Name = 'NewName';
        update actualProduct;
        System.assertEquals(productList.get(0).Name, actualProduct.Name);
    }
}