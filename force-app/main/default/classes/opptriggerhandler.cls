public with sharing class opptriggerhandler {
    public static void oppAssetcreate(List<OpportunityLineItem> newList) {
        Set<Id> oppid=new Set<Id>();
        //List<Opportunity> opplist=[Select  from OpportunityLineItem];
        //Set<Id> accid=[Select AccountId,Account.name from Opportunity where  AccountId!=null and Id in:oppid];
         for(OpportunityLineItem opplt:newList){
            oppid.add(opplt.OpportunityId);
         }
             List<Asset> assetList=new List<Asset>();
                for(Opportunity opp:[Select AccountId,Account.name from Opportunity where  AccountId!=null and Id in:oppid]){
                     
                        Asset aset=new Asset();
                        aset.name=opp.Account.name;
                        aset.AccountId=opp.AccountId;
                        assetList.add(aset);                  
                }
                insert assetList;
            
         }
    }