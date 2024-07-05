public class BmiClass {
    public static Decimal Bmi(Decimal weight,Decimal height){
        Decimal result=weight/(height*height);
        return result;
    }
    public static Decimal  calPace(Decimal distance,Decimal minutes){
        Decimal hr=minutes/60;
        Decimal pace=distance/hr;
        return pace;
    }
}