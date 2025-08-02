public class AccountController {
	@AuraEnabled(cacheable=true)
	public static List<Account> getAccounts() {
		return [SELECT Id, Name, Industry FROM Account];
	}
}