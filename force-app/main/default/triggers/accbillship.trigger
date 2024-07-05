trigger accbillship on Account (before insert,before update,after update,before delete) {
    if(trigger.isafter && trigger.isupdate){
        AccountTriggerHandler.updateOpportunitiesOnAccountUpdate(trigger.new);
        AccountTriggerHandler.ChangeConowner(trigger.new,trigger.oldmap,trigger.newmap);
       
    }
    if(trigger.isbefore && trigger.isinsert){
         
            AccountTriggerHandler.updateShippingAddress(trigger.new);
            AccountTriggerHandler.updateRating(trigger.new);
        }
        
    else if(trigger.isbefore && trigger.isupdate){
         
            AccountTriggerHandler.updateShippingAddress(trigger.new);
            AccountTriggerHandler.updateRating(trigger.new);
        
    }  
    else if(trigger.isAfter && trigger.isInsert){
        AccountTriggerHandler.oppCreate(Trigger.New);
        }
    //     else if(trigger.isbefore && trigger.isdelete){
         
    //         AccountTriggerHandler.preventdelifCasesforacc(trigger.old);
             
        
    // }  
        }