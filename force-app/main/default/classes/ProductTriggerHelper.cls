public class ProductTriggerHelper {
    public static void checkBeforeInsertUpdate(List<Product__c> productList){
        checkBefore(productList);
    }
    
    private static void checkBefore(List<Product__c> productList){
        List<Product__c> newProductList = productList;
        for(Product__c item : newProductList){
            if(item.Amount__c > 0){
                item.Available__c = true;
            }
            if(item.Amount__c == 0){
                item.Available__c = false;
            }
            if(item.Added_Date__c ==null){
                item.Added_Date__c = System.now();
            }
        }
    }
}