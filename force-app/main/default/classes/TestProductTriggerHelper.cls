@isTest
public class TestProductTriggerHelper {

    static ProductTriggerHelper testItem = new ProductTriggerHelper();
    
    static List<Product__c> productListExpected = new List<Product__c>();
    static Product__c product = new Product__c();
    static List<Product__c> productListActual = new List<Product__c>();
    static Product__c productActual = new Product__c();       
    
    @isTest static void testProductTrigger(){
        
        product.Amount__c = 5;
        
        productListExpected.add(product);
        for(Product__c item : productListExpected){
            if(item.Amount__c>0){
                item.Available__c = true;
            }
            if(item.Amount__c == 0){
                item.Available__c = false;
            }
            if(item.Added_Date__c ==null){
                item.Added_Date__c = System.now();
            }
        }
                
        productActual.Amount__c = 10;
        productListActual.add(productActual);
        ProductTriggerHelper.checkBeforeInsertUpdate(productListActual);
        
        System.assertEquals(productListExpected.get(0).Available__c, productListActual.get(0).Available__c);
        System.assertEquals(productListExpected.get(0).Added_Date__c, productListActual.get(0).Added_Date__c);
        
        
                
    }
     @isTest static void testProductTriggerNull(){
        
        product.Amount__c = 0;
        
        productListExpected.add(product);
        for(Product__c item : productListExpected){
            
            if(item.Amount__c == 0){
                item.Available__c = false;
            }
            
        }
                
        productActual.Amount__c = 0;
        productListActual.add(productActual);
        ProductTriggerHelper.checkBeforeInsertUpdate(productListActual);
        
        System.assertEquals(productListExpected.get(0).Available__c, productListActual.get(0).Available__c);
        
        
        
                
    }
}