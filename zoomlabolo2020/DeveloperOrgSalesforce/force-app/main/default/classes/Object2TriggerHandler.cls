public class Object2TriggerHandler {
    //To Updat the Object2 and Object3
    public static void updateAllObjects(Map<Id,Custom_object2__c> mapNewData){
        //fetching the ID of Object2
        List<Id> lstIdOfObject2=new List<Id>();
        for(Id id:mapNewData.keyset()){
            lstIdOfObject2.add(id);
        }
        system.debug('MA1'+lstIdOfObject2);
        //Getting the value of Object2 and the child object Object3 using query and compareing the child object status 
        List<Custom_object2__c> lstObject2ToBeUpdated=new List<Custom_object2__c>();
        Integer countOfCompletedObject3Status=0;
        Integer countofTotalObject3UnderObject2=0;
        for(List<Custom_object2__c> lstObject2:[Select Id,Status__c,(Select ID,Status__c from Custom_object3__r) from Custom_object2__c where ID in:lstIdOfObject2]){
            for(Custom_object2__c obj2:lstObject2){
                for(Custom_object3__c obj3:obj2.Custom_object3__r){
                    countofTotalObject3UnderObject2++;//counting the record of Object3 under Object2
                    if(obj3.Status__c=='Complete'){
                        countOfCompletedObject3Status++;//Counting the record of Object3 under Object2 for which the status is "Completed"
                    }
                }//End of object3 loop
                system.debug('MA2'+countofTotalObject3UnderObject2);
                system.debug('MA3'+countOfCompletedObject3Status);
                if(countofTotalObject3UnderObject2==countOfCompletedObject3Status){
                    system.debug('MA4'+obj2);
                    obj2.Status__c='Completed';
                    lstObject2ToBeUpdated.add(obj2);
                }
            }//End of Object2 loop
        }
        system.debug('MA5'+lstObject2ToBeUpdated);
        //Updating the Status of Object2
        /*
        if(lstObject2ToBeUpdated.size()>0){
            //update lstObject2ToBeUpdated;
        }
        */
    }
    
    public Static void updateObject1(Map<ID,Custom_object2__c> mapNewRecords){
        List<Custom_Object1__c> lstObject2=new List<Custom_Object1__c>();
        Id object1Id;
        for(Id id:mapNewRecords.keyset()){
            object1Id=mapNewRecords.get(id).Obj1Field2Lookup__c;
            break;//because there is only one record
        }
        if(object1Id!=null){
            for(List<Custom_Object1__c> obj1:[Select Id,Obj1Field2__c from Custom_Object1__c where ID=:object1Id]){
                for(Custom_Object1__c obj:obj1){
                    obj.Obj1Field2__c='Completed';
                    lstObject2.add(obj);
                }
            }
            update lstObject2;
        }
    }
}