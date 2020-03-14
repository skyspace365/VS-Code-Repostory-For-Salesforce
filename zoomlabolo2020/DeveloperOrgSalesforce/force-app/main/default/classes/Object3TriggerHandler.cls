public class Object3TriggerHandler {
    public static void updateField(List<Custom_object3__c> newRecords,List<Custom_object3__c> oldRecords){
        List<Custom_object3__c> lstUpdatedRecord=new List<Custom_object3__c>();
        for(Integer i=0;i<newRecords.size();i++){
            Custom_object3__c newRecord=newRecords[i];system.debug('MA1'+newRecord);
            Custom_object3__c oldrecord;
            if(oldRecords!=null){
                oldrecord=oldRecords[i];system.debug('MA2'+oldrecord);
            }
            if(oldRecords!=null){
                if(newRecord.NewField__c!=oldrecord.NewField__c){
                    system.debug('MA3'+newRecord);
                    system.debug('MA4'+oldrecord);
                    newRecord.OldField__c=oldrecord.NewField__c;
                    lstUpdatedRecord.add(newRecord);
                }
            }
            
        }//End of for loop 
        
        //Error:Apex trigger OnObject3 caused an unexpected exception, contact your administrator: OnObject3: execution of BeforeUpdate caused by: System.SObjectException: DML statement cannot operate on trigger.new or trigger.old: Class.Object3TriggerHandler.updateField: line 22, column 1
        /*
        if(lstUpdatedRecord.size()>0){
            update lstUpdatedRecord;
        }
        */
    }
}