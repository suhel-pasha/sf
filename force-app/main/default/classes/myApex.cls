public class myApex {

@AuraEnabled
public static List<Ticket__c> getRecords() {

	return [SELECT Name FROM Ticket__c];

}

}