/**
 * @author  Shumon Saha
 * @see     salesforceben.com/the-salesforce-trigger-handler-framework
 * @see     https://en.wikipedia.org/wiki/Interface_(Java)
 * @see     https://en.wikipedia.org/wiki/Interface_(object-oriented_programming)
 * @since   28 February 2022
 * @version 1.0: Part of a simple Salesforce Trigger Handler Framework.
 * A Java Interface. This is the first code file to be written,
 * before anything else can be written. Because everything is dependent on this.
 */

public interface TriggerHandlerJavaInterface
{
    /*
     * All "BEFORE" function-headers
     */
    void beforeInsert(List <SObject> newRecords);
    void beforeUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<ID, SObject> oldRecordMap, Map<ID, SObject> newRecordMap);
    void beforeDelete(List<SObject> oldRecords, Map<ID, SObject> oldRecordMap);
    
    /*
     * All "AFTER" function-headers
     */
    void afterInsert(List<SObject> newRecords, Map<ID, SObject> newRecordMap);
    void afterUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<ID, SObject> oldRecordMap, Map<ID, SObject> newRecordMap);
    void afterDelete(List<SObject> oldRecords, Map<ID, SObject> oldRecordMap);
    void afterUndelete(List<SObject> newRecords, Map<ID, SObject> newRecordMap);
}
