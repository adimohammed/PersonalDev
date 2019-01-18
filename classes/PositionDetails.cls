public class PositionDetails {

    public Position__c merch { get; set; }
    
    public PositionDetails() {
        this.merch = getPosition();
    }

    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Position__c.FieldSets.adiltest__Dimensions.getFields();
    }

    private Position__c getPosition() {
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id, Name,Java__c FROM Position__c LIMIT 1';
        return Database.query(query);
    }
}