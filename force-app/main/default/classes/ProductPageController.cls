public class ProductPageController {
   
   /* public Integer size{get;set;}*/
    public Integer noOfRecords{get;set;}
    public Product__c newProduct{get;set;}
    public String searchValue{get;set;}
    public String searchRadioValue{get;set;}
    public String sortValue{get;set;}
    public List<Product__c> prList{get;set;}
          
    public Product__c prToEdit {get;set;}
        
    public ProductPageController(){
        this.newProduct = new Product__c();
        this.searchValue = '';
        this.searchRadioValue = 'Name';
        this.sortValue = 'Name';
        this.prList = getByName();
        
    }
    
    public void getElement(){
        
        String myId = System.currentPageReference().getParameters().get('rowId');
        prToEdit  = [SELECT Name,Price__c,Amount__c,Type__c,Added_Date__c,Release_Date__c,Available__c
                                           FROM Product__c WHERE ID =:myId ];
        
    }
    
     public void deleteRecord(){
     String myId = System.currentPageReference().getParameters().get('rowId');	

		for(Product__c item : prList){
            if(item.Id.equals(myId)){
                try{
                   delete item; 
                 }
                catch(DMLException e){
                    
                }
                
            }
            
		}	
        searchValue = '';
        search();
        
        
    }
    
    public void search(){
        prList = getByName();
    }
    
    public List<Product__c> getByName(){
       List<Product__c> resultList = new List<Product__c>();
        String regExp = '[\\W]';
        String replacement = '/';
        String newSearchValue = searchValue.replaceAll(regExp, replacement);
        for(Product__c item : getProducts()){
            if(searchRadioValue.equals('Name')){
               if(item.Name.containsIgnoreCase(searchValue)){
                resultList.add(item);
                continue;
              }  
            }
         
            else if(searchRadioValue.equals('Added Date')){
                
                 if(String.valueOf(item.Added_Date__c.format()).contains(newSearchValue)){
                    resultList.add(item); 
                 }
                 
                
            }
            
            
           }
        return resultList;
    }
    
    public ApexPages.StandardSetController setCon {
        
        get {
        /*size = 2;*/
            
            
            if(sortValue.equals('Name')){
                
                 setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                                           [SELECT Name,Price__c,Amount__c,Type__c,Added_Date__c,Release_Date__c,Available__c
                                           FROM Product__c
                                           ORDER BY Name 
                                           ]));
                
            }
            else if(sortValue.equals('Added Date')){
                
                 setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                                           [SELECT Name,Price__c,Amount__c,Type__c,Added_Date__c,Release_Date__c,Available__c
                                           FROM Product__c
                                           ORDER BY Added_Date__c 
                                           ]));
                
            }
            else if(sortValue.equals('Release Date')){
                
                 setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                                           [SELECT Name,Price__c,Amount__c,Type__c,Added_Date__c,Release_Date__c,Available__c
                                           FROM Product__c
                                           ORDER BY Release_Date__c 
                                           ]));
                
            }
            else if(sortValue.equals('Price')){
                
                 setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                                           [SELECT Name,Price__c,Amount__c,Type__c,Added_Date__c,Release_Date__c,Available__c
                                           FROM Product__c
                                           ORDER BY Price__c 
                                           ]));
                
            }
            
           
           
               /** setCon.setPageSize(size); */
                noOfRecords = setCon.getResultSize(); 

            return setCon;
        }
        set;
    }
    public List<Product__c> getProducts() {
        
        return (List<Product__c>) setCon.getRecords();

    }
    /****************************************/
    public boolean displayPopup {get; set;}

    public void closePopup() {

        displayPopup = false;
        saveProduct();
        
    }
    public void cancel() {

        displayPopup = false;
        
    }
    
    public void showPopup() {
        displayPopup = true;
    }
    /*****************************************/
     public boolean displayPopupForm {get; set;}

    public void updatePopupForm() {

        displayPopupForm = false;
        
        if(prToEdit.Price__c >=0 && prToEdit.Amount__c >= 0 ||prToEdit.Price__c >=0 &&prToEdit.Amount__c == null
           ||prToEdit.Price__c ==null && prToEdit.Amount__c >= 0){
         try{
            update prToEdit;
                            
           }
           catch(DMLException e){ 
           
           } 
        }
        else if(prToEdit.Price__c==null && prToEdit.Amount__c==null ){
         try{
            update prToEdit;
                
           }
           catch(DMLException e){ 
           
           } 
        }
        else if(prToEdit.Price__c < 0 || prToEdit.Amount__c < 0 ){
         ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Price and Amount can not be < 0')); 
        }
    }
    public void cancelForm() {
        
        displayPopupForm = false;
        
    }
    
    public void showPopupForm() {
        getElement();
        displayPopupForm = true;
        
    }
    //////////////////***********************///////
    
    
    
    public void saveProduct(){
        if(newProduct.Price__c >=0 && newProduct.Amount__c >= 0 ||newProduct.Price__c >=0 &&newProduct.Amount__c == null
           ||newProduct.Price__c ==null && newProduct.Amount__c >= 0){
         try{
            insert newProduct;
            newProduct.clear();
            search();   
           }
           catch(DMLException e){ 
           
           } 
        }
        else if(newProduct.Price__c==null && newProduct.Amount__c==null ){
         try{
            insert newProduct;
            newProduct.clear();
            search(); 
           }
           catch(DMLException e){ 
           
           } 
        }
        else if(newProduct.Price__c < 0 || newProduct.Amount__c < 0 ){
         ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Price and Amount can not be < 0')); 
        }
        
    }
    
        
    public List<SelectOption> getOptionsForSort(){
        List<SelectOption> optionsForSort = new List<SelectOption>();
        optionsForSort.add(new SelectOption('Name','Name'));
        optionsForSort.add(new SelectOption('Added Date','Added Date'));
        optionsForSort.add(new SelectOption('Release Date','Release Date'));
        optionsForSort.add(new SelectOption('Price','Price'));
        
        return optionsForSort;
        
    }
    public List<SelectOption> getOptionsForSearch(){
        List<SelectOption> optionsForSearch = new List<SelectOption>();
        optionsForSearch.add(new SelectOption('Name','Name'));
        optionsForSearch.add(new SelectOption('Added Date','Added Date'));
        
        
        return optionsForSearch;
        
    }
}