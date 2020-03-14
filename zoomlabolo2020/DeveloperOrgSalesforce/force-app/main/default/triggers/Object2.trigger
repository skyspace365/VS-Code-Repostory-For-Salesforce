trigger Object2 on Custom_object2__c (before insert,before update,before delete,after insert,after update,after delete,after undelete)
{
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            //Calling triggerhandler class
            Object2TriggerHandler.updateAllObjects(Trigger.NewMap);
        }
    }//End of before trigger
    
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            Object2TriggerHandler.updateObject1(Trigger.newMap);
        }
    }

}