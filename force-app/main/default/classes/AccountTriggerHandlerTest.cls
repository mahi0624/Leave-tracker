@isTest
public class AccountTriggerHandlerTest {
    @isTest
    public static void updateOpportunitiesOnAccountUpdateTest(){
        //Account acc=new Account();
        List<Account> acclist=new List<Account>();
        for(Integer i=0;i<=5;i++){
            Account acc=new Account();
            acc.Name ='Accounttest'+i;
            acc.BillingCity='Bengaluru'+i;
            acc.BillingStreet='Pr layout'+i;
            acc.BillingPostalCode='560037'+i;
            acc.BillingCountry='India'+i;
            acclist.add(acc);
        }
        insert acclist;
        List<Opportunity> opplist=new List<Opportunity>();
        //DateTime dt=System.now()-30;
        for(Integer i=0;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='OPPtest'+i;
            opp.AccountId=acclist[i].Id;
            opp.CloseDate = Date.today().addDays(30);
           	opp.CreatedDate = System.now().addDays(-40);
            opp.StageName='Prospecting';
            opplist.add(opp);
        }
        insert opplist;
         for (Account acc : acclist) {
            acc.Name = acc.Name + ' Updated';
        }
        update acclist;
        List<Account> accaddresslist=[SELECT id,BillingCity,BillingStreet,BillingPostalCode,BillingCountry,ShippingCity,ShippingStreet,ShippingState,ShippingPostalCode,ShippingCountry
                                 From Account];
        System.debug(accaddresslist);
        
        
        for(Account acc:accaddresslist){ 
            System.assertEquals(acc.BillingCity,acc.ShippingCity);
            System.assertEquals(acc.ShippingCity,acc.ShippingCity);
        }
         List<Opportunity> updatedOpplist = [SELECT Id, StageName, CloseDate,CreatedDate 
                                            FROM Opportunity 
                                            WHERE AccountId IN :acclist];
         for (Opportunity opp : updatedOpplist) {
            if (opp.CreatedDate < System.now().addDays(-30) && opp.StageName != 'Closed Won') {
                System.assertEquals('Closed Lost', opp.StageName, 'Opportunity should be Closed Lost.');
                System.assertEquals(Date.today(), opp.CloseDate, 'Opportunity CloseDate should be today.');
            }
    }
        

}
}