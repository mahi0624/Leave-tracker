trigger opplineTrigger on OpportunityLineItem (After insert) {
    if(trigger.isAfter && trigger.isInsert){
        opptriggerhandler.oppAssetcreate(trigger.new);
    }
}