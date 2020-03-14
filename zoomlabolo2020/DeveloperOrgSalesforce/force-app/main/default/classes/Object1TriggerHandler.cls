public class Object1TriggerHandler {
    public static void callingQueueableApex(Map<ID,Custom_Object1__c> newRecords){
        //Taking the ID
        List<ID> lstId=new List<Id>();
        for(Id id:newRecords.keyset()){
            lstId.add(id);
        }
        //Querying the data of the child object Object2
        List<Custom_Object1__c> lstObject1Records=new List<Custom_Object1__c>();
        List<Custom_object2__c> lstObject2Records=new List<Custom_object2__c>();
        List<Id> lstIDObject2=new List<ID>();
        if(lstId!=null){
            for(List<Custom_Object1__c> lstObject1:[Select ID,Obj1Field2__c,(Select Id,Status__c from Custom_object2__r) from Custom_Object1__c where Id IN:lstId]){
                for(Custom_Object1__c obj1:lstObject1){
                    newRecords.get(obj1.id).Obj1Field2__c='Not Completed';
                    //obj1.Obj1Field2__c='Not Completed';
                    lstObject1Records.add(obj1);
                    for(Custom_object2__c obj2:obj1.Custom_object2__r){
                        obj2.Status__c='Not Completed';
                        lstIDObject2.add(obj2.Id);
                        lstObject2Records.add(obj2);
                    }
                }
            }
        }
        update lstObject2Records;
        //Querying the data and updating the child object Object3
        List<Custom_object3__c> lstObject3=new List<Custom_object3__c>();
        for(List<Custom_object2__c> lstObj2:[Select ID,(Select ID,Status__c from Custom_object3__r) from Custom_object2__c where ID In:lstIDObject2]){
            for(Custom_object2__c obj2:lstObj2){
                for(Custom_object3__c obj3:obj2.Custom_object3__r){
                    obj3.Status__c='Not Completed';
                    lstObject3.add(obj3);
                }
            }
        }
       
        //getting all 3 list(lstObject1Records,lstObject2Records,lstObject3) calling Queueable Class
        Map<Integer,List<Sobject>> indexMap=new Map<Integer,List<Sobject>>();
        //indexMap.put(0,lstObject1Records);
        indexMap.put(0,lstObject2Records);
        indexMap.put(1,lstObject3);
        Integer StartIndex=0;
        system.enqueueJob(new QueueableForObject123(StartIndex,indexMap));
    }
    
    //Future Method
    @future
    public Static void futureMethodExecution(){
        system.debug('MA');
    }
     @future
    public Static void futureMethodExecutionForBatch(){
        system.debug('MA');
    }
    
}