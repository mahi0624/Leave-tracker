@isTest
public class TestVerifyDate {
	@isTest
    public static void testdate(){
        Date date1=Date.newInstance(2024,5,1);
		Date date2=Date.newInstance(2024,5,20); 
        Date result=VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2,result);
    }
    @isTest
    public static void testdate1(){
        Date date1=Date.newInstance(2024,5,1);
		Date date2=Date.newInstance(2024,4,15); 
        Date result=VerifyDate.CheckDates(date1,date2);
        Date expectedEndofonth=Date.newInstance(2024,05,31);
        System.assertEquals(expectedEndofonth,result);
    }
}