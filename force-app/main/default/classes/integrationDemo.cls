@RestResource(urlMapping='/Accountmg/')
global class integrationDemo {
	@httpGet
    global static List<Account> getAccouunts(){
        List<Account> acclist=[Select id,name,industry,Rating,annualrevenue from Account];
        return acclist;
        
    }
}