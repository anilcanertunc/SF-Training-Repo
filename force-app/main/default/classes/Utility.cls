public class Utility {
    private static Boolean isSandbox;
    
    public static Boolean getEnvType() {
        if(isSandbox == null) {
            Organization org = [select IsSandbox from Organization where Id =:UserInfo.getOrganizationId()];      
            isSandbox = org.IsSandbox;  
        }
        
        return isSandbox;
    }
}