public with sharing class AccountAddressTriggerHandler {

	public static void updatePostalCode(List<Account> accounts){
		for (Account acc : accounts) {
			if(acc.Match_Billing_Address__c==true && acc.BillingPostalCode!=null) {
				acc.ShippingPostalCode =  acc.BillingPostalCode;
			}
		}

	}
}