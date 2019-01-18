public class BMIController {
    @AuraEnabled
    public static Decimal getBMI(Decimal height, Decimal weight){
        System.debug('height'+height);
        System.debug('weight'+height);
        return weight/(height * height) ;
    }

}