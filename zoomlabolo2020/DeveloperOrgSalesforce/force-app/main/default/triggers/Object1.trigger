trigger Object1 on Custom_Object1__c (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            Object1TriggerHandler.callingQueueableApex(Trigger.newMap);
        }
    }

}