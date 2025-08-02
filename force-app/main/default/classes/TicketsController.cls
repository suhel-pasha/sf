public with sharing class TicketsController {
    @AuraEnabled(cacheable=true)
    public static String getTicektsData() {
        List<String> dates = new List<String>{'29/07/2025', '05/08/2025', '12/08/2025', '19/08/2025', '26/08/2025', '02/09/2025', '09/09/2025', '16/09/2025', '23/09/2025'};
        Map<String,List<String>> data = new Map<String,List<String>>();
        for(String doj: dates) {
            List<Ticket__c> tickets = [Select Date__c, Office__c, Home__c from Ticket__c where Date__c=:doj];
            String homeStatus = '';
            String officeStatus = '';
            if(tickets.size() != 0) {
                homeStatus = tickets.get(0).Home__c ? 'Booked' : checkAvailab('home', doj);
                officeStatus = tickets.get(0).Office__c ? 'Booked' : checkAvailab('office', doj);
            } else {
                homeStatus = checkAvailab('home', doj);
                officeStatus = checkAvailab('office', doj);
            }
            Map<String,List<String>> day = new Map<String,List<String>>();
            List<String> status = new List<String>{officeStatus, homeStatus};
            data.put(doj, status); 
        }
        return JSON.serialize(data);
        //return '';
    }

    public static String checkAvailablity() {
        // Check Availability
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://railways.easemytrip.com/Train/AvailToCheck');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(new Map<String, Object>{
            'cls'      => 'SL',
            'trainNo' => '16227',
            'quotaSelectdd' => 'GN',
            'fromstation' => 'SBC',
            'tostation' => 'SMET',
            'e'=> '05/08/2025',
            'Searchsource'=>'',
            'Searchdestination'=> ''
        }));

        HttpResponse res = http.send(req);
        return res.getBody();
    }
    
    public static string checkAvailab (String journey, String doj) {
                Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://railways.easemytrip.com/Train/AvailToCheck');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        String cls;
        String trainNo;
        String fromstation;
        String tostation;
        if(journey == 'home') {
            cls = 'SL';
            trainNo = '16227';
            fromstation = 'SBC';
            tostation = 'SMET';
        } else {
            cls = '2S';
            trainNo = '12090';
            fromstation = 'SMET';
            tostation = 'SBC';
        }
        req.setBody(JSON.serialize(new Map<String, Object>{
            'cls'      => cls,
            'trainNo' => trainNo,
            'quotaSelectdd' => 'GN',
            'fromstation' => fromstation,
            'tostation' => tostation,
            'e'=> doj,
            'Searchsource'=>'',
            'Searchdestination'=> ''
        }));

        HttpResponse res = http.send(req);
        System.debug(res.getBody());
        return parseResult(res.getBody());
    }
    
    public static string parseResult(String raw) {
        Map<String, Object> obj = (Map<String, Object>)JSON.deserializeUntyped(raw);
        List<Object> avlDayList = (List<Object>)obj.get('avlDayList');
        Map<String, Object> avl = (Map<String, Object>)avlDayList.get(0);
        return (String)avl.get('availablityStatusNew');
    }
}