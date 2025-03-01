public abstract class TriggerStructure implements I_dmlOperations {
    
    private abstract void beforeInsert();
    private abstract void afterInsert();
    private abstract void beforeUpdate();
    private abstract void afterUpdate();
    private abstract void beforeDelete(); 
    private abstract void afterDelete(); 
    
    
    public void runAll(){ 
        
        switch on String.valueOf(Trigger.operationType) {
            when 'BEFORE_INSERT'{ this.beforeInsert();}
            when 'AFTER_INSERT'{ this.afterInsert();}
            when 'BEFORE_UPDATE'{ this.beforeUpdate();}
            when 'AFTER_UPDATE'{ this.afterUpdate();} 
        }
    }    
}