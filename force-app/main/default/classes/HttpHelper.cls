public class HttpHelper {
    private static Boolean isSandbox = Utility.getEnvType();
    private static Integration_Credentials__c ic = Integration_Credentials__c.getOrgDefaults();
    class Credentials {
        String token;
        String url;
    }
    
    public static void sendToSF(String uri, String jsonBody) { //uri = '/services/data/v60.0/composite'
        Credentials crd = getSFCredentials();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');   
        req.setTimeout(60000);
        req.setEndpoint(crd.url + uri);    
        req.setHeader('Content-Type', 'application/json');    
        req.setHeader('Authorization', crd.token);          
        req.setBody(jsonBody);        
        HttpResponse res =  new Http().send(req);
        System.Debug(res);
        System.Debug(res.getStatusCode());
        System.Debug(res.getBody());
    }
    
    @future(callout=true)
    public static void sendToSF_Future(String uri, String jsonBody) {
        sendToSF(uri, jsonBody);
    }
    
    private static Credentials  getSFCredentials() {
        
        final String CLIENT_ID = ic.Client_Id__c ;
        final String CLIENT_SECRET = ic.Client_Secret__c;
        final String USER_NAME = ic.User_Name__c;
        final String PASSWORD = ic.Password__c;
        final String ENV_TYPE = isSandbox ? 'test': 'login' ;
        
        String endpointString = 'https://'+ ENV_TYPE +'.salesforce.com/services/oauth2/token?grant_type=password&client_id='+ 
            CLIENT_ID +'&client_secret='+ CLIENT_SECRET +'&username='+ USER_NAME + '&password='+ PASSWORD;
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');   
        req.setTimeout(60000);
        req.setEndpoint(endpointString);             
        HttpResponse res =  new Http().send(req);
        System.Debug(res);
        System.Debug(res.getBody());
        Map<String, String> responseMap = (Map<String, String>) JSON.deserialize(res.getBody(), Map<String, String>.class);
        
        Credentials crd = new Credentials();
        crd.token= 'Bearer ' + responseMap.get('access_token'); //Access Token
        crd.url= responseMap.get('instance_url'); //Instance URL
        
        return crd; 
    }

}