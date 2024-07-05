public class AccountTriggerHandler {
    public static void updateOpportunitiesOnAccountUpdate (List<Account> updatedAccounts){
        Set<Id> accids=new Set<Id>();
    for(Account acc:updatedAccounts){
        accids.add(acc.Id);
    }
    DateTime dt=System.now()-30;
    List<Opportunity> oppupdatelist=new List<Opportunity>();
    List<Opportunity> opplist=[Select id,AccountId,CreatedDate,CloseDate,StageName from Opportunity where AccountId in
                              :accids];
    if(opplist.Size()>0){
	for(Opportunity opp:opplist){
        if(opp.CreatedDate<dt && opp.StageName!='Closed Won'){
            opp.StageName='Closed Lost';
            opp.CloseDate=system.today();
            oppupdatelist.add(opp);
        }
    }        
    }
    if(oppupdatelist.Size()>0){
        Update oppupdatelist;
    }   
    }
    public static void updateShippingAddress (List<Account> updateAddress ){
        for(Account acc:updateAddress){
        if(acc.BillingCity!=null){
            acc.ShippingCity=acc.BillingCity;
        }
        if(acc.BillingStreet!=null){
            acc.ShippingStreet=acc.BillingStreet;
        }
        if(acc.BillingState!=null){
			acc.ShippingState=acc.BillingState;
		}
        if(acc.BillingPostalCode!=null){
        	acc.ShippingPostalCode=acc.BillingPostalCode;
        }
        if(acc.BillingCountry!=null){
        	acc.ShippingCountry=acc.BillingCountry;
        }
    }
    }
    public static void updateRating(List<Account> acclist){
        for(Account acc:acclist){
            if(acc.Industry!=null && acc.Industry=='Media'){
                acc.Rating='Hot';
            }
        }
    }
    public static void oppCreate(List<Account> acclist){
        List<Opportunity> OPPlist=new List<Opportunity>();
        for(Account acc:acclist){
            Opportunity opp=new Opportunity();
             
                opp.Name = acc.Name + 'opp';
                opp.AccountId = acc.Id;
                opp.StageName = 'Prospecting';
                opp.CloseDate = System.today();
                OPPlist.add(opp);
        }
        if(!OPPlist.isEmpty()){
            insert OPPlist;
        }
    }
    public static void preventdelifCasesforacc(List<Account> newList){
        List<Account> acclist=[Select Id,(Select Id from Cases) From Account];
        for(Account acc:acclist){
            if(acc.Cases.Size()>0){
                acc.addError('You can not delete account where cases are available');
            }
        }
    }
    public static void ChangeConowner(List<Account> acclist,Map<Id,Account> oldmap,Map<Id,Account> newmap){
        Set<Id> accids=new Set<Id>();
        for(Account acc:acclist){
            if(acc.OwnerId!=oldmap.get(acc.Id).OwnerId){
                accids.add(acc.Id);
            }
        }
        List<Contact> conlist=[Select id,OwnerId,AccountId from Contact where AccountId IN:accids];
        for(Contact con:conlist){
            con.OwnerId=newmap.get(con.AccountId).OwnerId;
        }
        if(conlist.size()>0){
            update conlist;
        }
        
    }
}   