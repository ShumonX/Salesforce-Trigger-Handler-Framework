/**
 * @author ShumonX
 * @see salesforceben.com/the-salesforce-trigger-handler-framework
 * @since 28 February 2022
 * @version 2.0: Moved the "Run All Triggers" Org-Specific Setting checkbox ✅
 * from Custom Metadata Type to a Custom Setting because its records should NOT
 * be deployable, completely indepenent, and manually set.
 */
trigger AccountTrigger on Account
(
    before insert, before update, before delete,
     after insert,  after update,  after delete,  after undelete
)
{
    /*
     * Using Safe Navigation Operator (?.) and Null Coalescing Operator (??) so
     * that this Trigger by default runs by default even when the Org-Specific
     * Custom Setting doesn't have a "Default Organization Level Value" set.
     */
    if (Org_Specific_Custom_Setting__c.getInstance()?.Run_All_Triggers__c ?? true)
    {
        TriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
        switch on Trigger.operationType
        {
            when BEFORE_INSERT
            {
                // handler.beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE
            {
                // handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when BEFORE_DELETE
            {
                // handler.beforeDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_INSERT
            {
                // handler.afterInsert(Trigger.new, Trigger.newMap);
            }
            when AFTER_UPDATE
            {
                // handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when AFTER_DELETE
            {
                // handler.afterDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_UNDELETE
            {
                // handler.afterUndelete(Trigger.new, Trigger.newMap);
            }
        }
    }
}
