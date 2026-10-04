/**
 * This is a Java Interface ☕ (not related to user interface).
 * 
 * @author  Shumon Saha
 * @see     salesforceben.com/the-salesforce-trigger-handler-framework
 * @see     https://en.wikipedia.org/wiki/Interface_(Java)
 * @see     https://en.wikipedia.org/wiki/Interface_(object-oriented_programming)
 * @since   28 February 2022
 * @version 1.0: Part of a simple Salesforce Trigger Handler Framework.
 * A Java Interface. This is the first code file to be written,
 * before anything else can be written. Because everything is dependent on this.
 */

public interface TriggerHandler
{
    /*
     * ⏪ All “BEFORE” function-headers ⏪
     */
    void beforeInsert(List <SObject>newRecordss);                                 // 1 of 7
    void beforeUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<ID, SObject> oldRecordMap, Map<ID, SObject> newRecordMap);    // 2 of 7
    void beforeDelete(List<SObject> oldRecords, Map<ID, SObject> oldRecordMap);   // 3 of 7
    
    /*
     * ⏩ All “AFTER” function-headers ⏩
     */
    void afterInsert(List<SObject> newRecords, Map<ID, SObject> newRecordMap);    // 4 of 7
    void afterUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<ID, SObject> oldRecordMap, Map<ID, SObject> newRecordMap);    // 5 of 7
    void afterDelete(List<SObject> oldRecords, Map<ID, SObject> oldRecordMap);    // 6 of 7
    void afterUndelete(List<SObject> newRecords, Map<ID, SObject> newRecordMap);  // 7 of 7    
}
