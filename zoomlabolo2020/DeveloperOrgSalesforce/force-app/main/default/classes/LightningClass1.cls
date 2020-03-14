//From VS code
public class LightningClass1 {
    @AuraEnabled
    public static String method1(String usernamefrommethod){
        if(usernamefrommethod!=null && !String.isBlank(usernamefrommethod)){
            system.debug('MAFromMethod'+usernamefrommethod);
            return usernamefrommethod;
        }
        else{
            
            return 'not given by the user';
        }
    }

}