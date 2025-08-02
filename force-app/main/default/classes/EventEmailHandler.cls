global class EventEmailHandler implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        try {
            // Extract information from the email subject or body
            String subject = email.subject;
            String body = email.plainTextBody;
            
            Ticket_Details__c t = new Ticket_Details__c();
            t.PNR__c = getValue(body, 'PNR NO.');
            upsert t;

            result.success = true;
        } catch (Exception ex) {
            result.success = false;
            System.debug('Error: ' + ex.getMessage());
        }
        return result;
    }
    
    private static String getValue(String body, String key) {
        String escapedKey = Pattern.quote(key.trim());

        	// Build regex: \s*<key>\s:\s*\*([^*]+)\*
        	String patternStr = '\\s*' + escapedKey + '\\s*:\\s*\\*([^*]+)\\*';
        	Pattern p = Pattern.compile(patternStr);
        	Matcher m = p.matcher(body);
    		return m.find() ? m.group(1).trim() : null;
    }
}