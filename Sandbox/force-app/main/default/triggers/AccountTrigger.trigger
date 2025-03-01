trigger AccountTrigger on Account (before insert) {
    AccountTriggerController triggerClass = new AccountTriggerController();
    triggerClass.runAll();  
}