public class MyClass {
	@AuraEnabled(cacheable=true)
	public static List<Ticket__c> getTickets() {
		return [SELECT Name, Id FROM Ticket__c];
	}
}