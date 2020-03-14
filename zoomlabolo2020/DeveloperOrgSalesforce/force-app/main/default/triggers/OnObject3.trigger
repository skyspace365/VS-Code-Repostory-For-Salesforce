trigger OnObject3 on Custom_object3__c (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            Object3TriggerHandler.updateField(Trigger.New,Trigger.Old);
        }
    }

}