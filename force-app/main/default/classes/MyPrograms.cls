public class MyPrograms {
    @AuraEnabled
    public static List<Program__c> fetchPrograms(String searchKeyWord) {
        List<Program__c> returnList = new List<Program__c>();
        String searchKey = String.isBlank(searchKeyWord) ? '%%' : searchKeyWord+'%';
        
        returnList = [Select Id
                     , Name,
                      Name__c
                     , Date__c
                     , Description__c
                     , Program__c
                      , Stage__c
                     from Program__c
                     where Description__c
                     like :searchKey
                     Limit 15];
        return returnList;
    }
    
    @AuraEnabled
    public static Program__c createProgram(Program__c program){
        upsert program;
        return program;
    }


}