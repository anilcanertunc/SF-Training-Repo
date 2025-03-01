trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete) {
    AccountTriggerLogic triggerClass = new AccountTriggerLogic();
    triggerClass.runAll();  
}