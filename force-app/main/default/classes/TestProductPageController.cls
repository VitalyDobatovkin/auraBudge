@isTest
public class TestProductPageController {
    static ProductPageController testItem = new ProductPageController();
    
    Product__c prToEdit = new  Product__c();
    static List<Product__c> testList = new List<Product__c>();
    static void insertList(){
        insert testList; 
    }
    static List<Product__c> returnTestValues(){
        
        Product__c prOne = new  Product__c();
        
        prOne.Name = 'Apple';
        prOne.Added_Date__c = Datetime.newInstance(2019, 5, 5);
        prOne.Available__c = false;
        testList.add(prOne);
        
        return testList;
    }    
    @isTest static void testgetByName(){
        
       List<Product__c> resultListExpected = new List<Product__c>();
        String searchValue = 'Apple';
        String searchRadioValue = 'Name';
        
        String regExp = '[\\W]';
        String replacement = '/';
        String newSearchValue = searchValue.replaceAll(regExp, replacement);
        for(Product__c item : returnTestValues()){
            if(searchRadioValue.equals('Name')){
               if(item.Name.containsIgnoreCase(searchValue)){
                resultListExpected.add(item);
                continue;
              }  
            }
       }
        insertList();
        
        testItem.searchRadioValue = 'Name';
        testItem.searchValue = 'Apple';
        List<Product__c> resultListActual = testItem.getByName();
      
        
      System.assertEquals(resultListExpected.get(0).Id,resultListActual.get(0).Id);
    }
    @isTest static void testgetByName2(){
        
       List<Product__c> resultListExpected = new List<Product__c>();
        String searchValue = '5/5/2019';
        String searchRadioValue = 'Added Date';
        String sortValue = 'Added Date';
        String regExp = '[\\W]';
        String replacement = '/';
        String newSearchValue = searchValue.replaceAll(regExp, replacement);
        for(Product__c item : returnTestValues()){
            if(searchRadioValue.equals('Added Date')){
                
                 if(String.valueOf(item.Added_Date__c.format()).contains(newSearchValue)){
                    resultListExpected.add(item); 
                 }
                 
                
            }
       }
        insertList();
        
        testItem.searchRadioValue = 'Added Date';
        testItem.searchValue = '5/5/2019';
        testItem.sortValue = 'Added Date';
        List<Product__c> resultListActual = testItem.getByName();
      
        
      System.assertEquals(resultListExpected.get(0).Id,resultListActual.get(0).Id);
    }
    //////////////////////////////////*****************************/////////////
    
    @isTest static void testgetByNameSortValuePrice(){
        
       List<Product__c> resultListExpected = new List<Product__c>();
        String searchValue = '5/5/2019';
        String searchRadioValue = 'Added Date';
        String sortValue = 'Price';
        String regExp = '[\\W]';
        String replacement = '/';
        String newSearchValue = searchValue.replaceAll(regExp, replacement);
        for(Product__c item : returnTestValues()){
            if(searchRadioValue.equals('Added Date')){
                
                 if(String.valueOf(item.Added_Date__c.format()).contains(newSearchValue)){
                    resultListExpected.add(item); 
                 }
                 
                
            }
       }
        insertList();
        
        testItem.searchRadioValue = 'Added Date';
        testItem.searchValue = '5/5/2019';
        testItem.sortValue = 'Price';
        List<Product__c> resultListActual = testItem.getByName();
      
        
      System.assertEquals(resultListExpected.get(0).Id,resultListActual.get(0).Id);
    }
    
    @isTest static void testgetByNameSortValueReleaseDate(){
        
       List<Product__c> resultListExpected = new List<Product__c>();
        String searchValue = '5/5/2019';
        String searchRadioValue = 'Added Date';
        String sortValue = 'Release Date';
        String regExp = '[\\W]';
        String replacement = '/';
        String newSearchValue = searchValue.replaceAll(regExp, replacement);
        for(Product__c item : returnTestValues()){
            if(searchRadioValue.equals('Added Date')){
                
                 if(String.valueOf(item.Added_Date__c.format()).contains(newSearchValue)){
                    resultListExpected.add(item); 
                 }
                 
                
            }
       }
        insertList();
        
        testItem.searchRadioValue = 'Added Date';
        testItem.searchValue = '5/5/2019';
        testItem.sortValue = 'Release Date';
        List<Product__c> resultListActual = testItem.getByName();
      
        
      System.assertEquals(resultListExpected.get(0).Id,resultListActual.get(0).Id);
    }
     /****************************************/
    @isTest static void testClosePopup(){
       
        boolean expectedDisplayPopup = false;
        testItem.closePopup();
        boolean actualDisplayPopup = testItem.displayPopup;
        
        System.assertEquals(expectedDisplayPopup,actualDisplayPopup);
        
    }
    @isTest static void testCancel(){
        boolean expectedDisplayPopup = false;
        testItem.cancel();
        boolean actualDisplayPopup = testItem.displayPopup;
        
        System.assertEquals(expectedDisplayPopup,actualDisplayPopup);  
        
    }
    @isTest static void testShowPopup(){
        boolean expectedDisplayPopup = true;
        testItem.showPopup();
        boolean actualDisplayPopup = testItem.displayPopup;
        
        System.assertEquals(expectedDisplayPopup,actualDisplayPopup);  
        
    }
    @isTest static void testSaveProduct(){
        Product__c product = new Product__c();
        product.Price__c = 26;
        product.Amount__c = 1;
        boolean expected = false;    
        try{
           insert product;
        }
        catch(DMLException e){ 
            
        } 
        testItem.newProduct.Price__c = 26;
        testItem.newProduct.Amount__c = 1;
        testItem.closePopup();
        boolean actual = testItem.displayPopup;  
        
        System.assertEquals(expected,actual);  
        
    }
    @isTest static void testSaveProductNull(){
        Product__c product = new Product__c();
        
        boolean expected = false;    
        try{
           insert product;
        }
        catch(DMLException e){ 
            
        } 
        
        testItem.closePopup();
        boolean actual = testItem.displayPopup;  
        
        System.assertEquals(expected,actual);  
        
    }
    @isTest static void testSaveProductNegative(){
       Product__c product = new Product__c();
        product.Price__c = -5;
        product.Amount__c = -5;
        boolean expected = false;    
        try{
           insert product;
        }
        catch(DMLException e){ 
            
        } 
        testItem.newProduct.Price__c = -5;
        testItem.newProduct.Amount__c = -5;
        testItem.closePopup();
        boolean actual = testItem.displayPopup;  
        
        System.assertEquals(expected,actual); 
        
    }
     /****************************************/
    @isTest static void testUpdatePopupForm(){
        
        returnTestValues();
        insertList();
        testItem.prToEdit = testList.get(0);
        testItem.displayPopupForm = false;
        testItem.prToEdit.Price__c = 20;
        testItem.prToEdit.Amount__c = 20;
        testItem.updatePopupForm();
          
        
        System.assertEquals(20,testItem.prToEdit.Price__c);  
        
    }
    @isTest static void testUpdatePopupFormNull(){
        
        returnTestValues();
        insertList();
        testItem.prToEdit = testList.get(0);
        testItem.displayPopupForm = false;
        
        testItem.updatePopupForm();
          
        
        System.assertEquals(null,testItem.prToEdit.Price__c);  
        
    }
    @isTest static void testUpdatePopupFormNegative(){
        
        returnTestValues();
        insertList();
        testItem.prToEdit = testList.get(0);
        testItem.displayPopupForm = false;
        testItem.prToEdit.Price__c = -5;
        testItem.prToEdit.Amount__c = -5;
        testItem.updatePopupForm();
          
        
        System.assertEquals(-5,testItem.prToEdit.Price__c);  
        
    }
    @isTest static void testCancelForm(){
        
        boolean expectedDisplayPopup = false;
        testItem.cancelForm();
        boolean actualDisplayPopup = testItem.displayPopupForm;
        
        System.assertEquals(expectedDisplayPopup,actualDisplayPopup);  

        
    }
    /*********************************************************/
    @isTest static void testGetOptionsForSort(){
        
        List<SelectOption> optionsForSort = new List<SelectOption>();
        optionsForSort.add(new SelectOption('Name','Name'));
        optionsForSort.add(new SelectOption('Added Date','Added Date'));
        optionsForSort.add(new SelectOption('Release Date','Release Date'));
        optionsForSort.add(new SelectOption('Price','Price'));
        
        System.assertEquals(optionsForSort,testItem.getOptionsForSort());  

    }
    @isTest static void testGetOptionsForSearch(){
        
        List<SelectOption> optionsForSearch = new List<SelectOption>();
        optionsForSearch.add(new SelectOption('Name','Name'));
        optionsForSearch.add(new SelectOption('Added Date','Added Date'));
        
        System.assertEquals(optionsForSearch,testItem.getOptionsForSearch());  

        
    }
    
    @isTest
    static void testDeleteRecord(){
        
        Product__c testProduct = new Product__c(Name = 'test', Available__c = false);
        
        insert testProduct;
        
        System.currentPageReference().getParameters().put('rowId',testProduct.Id);
        
        ProductPageController classObject = new ProductPageController();
        
        classObject.prList.add(testProduct);
        
        classObject.deleteRecord();
        
        List<Product__c> actualList = [
            SELECT Name,Available__c
            FROM Product__c
        ];
        
        System.assertEquals(0, actualList.size());
        
    }
    
    @isTest
    static void testGetElement(){
        
        Product__c testProduct = new Product__c(Name = 'test');
        testProduct.Added_Date__c = System.now();
        testProduct.Available__c = false;
        insert testProduct;
        
        System.currentPageReference().getParameters().put('rowId',testProduct.Id);
        
        ProductPageController classObject = new ProductPageController();
        classObject.getElement();
        Product__c actualPrToEdit = classObject.prToEdit;
        
        
        
        System.assertEquals(String.valueOf(testProduct.Id), String.valueOf(actualPrToEdit.Id));
        
    }
    
    @isTest
    static void testShowPopupForm(){
       Product__c testProduct = new Product__c(Name = 'test');
        testProduct.Added_Date__c = System.now();
        testProduct.Available__c = false;
        insert testProduct;
        
        System.currentPageReference().getParameters().put('rowId',testProduct.Id);
        
        ProductPageController classObject = new ProductPageController();
        /*classObject.getElement();*/
        
        boolean displayPopupFormExpected = true;
        
        classObject.showPopupForm();
        
        System.assertEquals(displayPopupFormExpected,classObject.displayPopupForm );
        
    }
    
    
}