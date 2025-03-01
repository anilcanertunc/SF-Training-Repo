public with sharing class AccountTriggerLogic extends TriggerStructure{

    //DML Operation Methods
    public void beforeInsert() {
        //Not Implemented
    }    
    public void afterInsert() {
        //Not Implemented
    }
    public void beforeUpdate() {
        debuggerMethod('beforeUpdate'); 
    } 
    public void afterUpdate() {
        debuggerMethod('afterUpdate'); 
    }
    
    public void beforeDelete() {
        //Not Implemented
    } 
    
    public void afterDelete() {
        //Not Implemented
    } 
    
    private void debuggerMethod(String value1) {
        System.debug(value1 + ' method in logic class'); 
    }
}