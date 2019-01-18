public class exampleCon {
    Integer count = 5;
            
    public PageReference incrementCounter() {
        count--;
        return null;
    }
            
    public Integer getCount() {
        return count;
    }
}