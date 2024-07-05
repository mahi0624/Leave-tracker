@isTest
public class BmiClassTest {
    
    @isTest
    static void BmiTest() {
        // Test case for Bmi method
        Decimal weight = 100.0;
        Decimal height = 10.0;
        //Decimal expectedBmi = 1.0;
        
        Decimal actualBmi = BmiClass.Bmi(weight, height);
        system.assertequals(1.0, actualBmi, 'Bmi calculation is incorrect');
    }

	 @isTest
    static void CalPaceTest() {
        // Test case for calPace method
        Decimal distance = 10.0;
        Decimal minutes = 60.0;
        Decimal expectedPace = 10.0;
        
        Decimal actualPace = BmiClass.calPace(distance, minutes);
        System.assertEquals(expectedPace, actualPace, 'Pace calculation is incorrect');
    }
}