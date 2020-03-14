public class QueueableForObject123 implements  Queueable{
    
    Map<Integer,List<Sobject>> mapUpdate1=new Map<Integer,List<Sobject>>();
    Integer index1;
    public QueueableForObject123(Integer index,Map<Integer,List<Sobject>> mapUpdate){
        this.index1=index;
        this.mapUpdate1=mapUpdate;
    }
    //Writing execute method
    public void execute(QueueableContext qc){
        update mapUpdate1.get(index1);
        Integer indexIncrement=index1+1;
        if(mapUpdate1.containskey(indexIncrement)){
            system.enqueueJob(new QueueableForObject123(indexIncrement,mapUpdate1));
            //Object1TriggerHandler.futureMethodExecution();
            Database.executeBatch(new BatchClass1());
        }
        
    }
}