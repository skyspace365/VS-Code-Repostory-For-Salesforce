global class BatchClass1 implements Database.Batchable<sobject>{
    String query='Select ID,Obj1Field2__c from Custom_Object1__c';
    global Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('MA+Start method from Batch class');
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<sobject> lstRecords){
        system.debug('MA+Execute method from batch');
    }
    global void finish(Database.BatchableContext bc){
        system.debug('MA+Finish method from finish');
        Object1TriggerHandler.futureMethodExecutionForBatch();
    }
}