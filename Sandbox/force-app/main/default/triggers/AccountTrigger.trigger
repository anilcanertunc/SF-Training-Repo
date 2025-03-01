trigger AccountTrigger on Account (before update, after update) {
    AccountTriggerLogic triggerClass = new AccountTriggerLogic();
    triggerClass.runAll();  
}