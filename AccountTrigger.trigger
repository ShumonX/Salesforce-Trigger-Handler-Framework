/**
 * A simple Salesforce Trigger Handler Framework 🛠️
 * @author  Shumon Saha
 * @see     salesforceben.com/the-salesforce-trigger-handler-framework
 * @see     bit.ly/sf-coding-standards
 * @since   28 February 2022
 * @version 3.0: Moved the Switch outside the If-block, reducing nesting.
 * ⚠️ Don't forget to un-comment your required lines of code ⚠️
 */

trigger AccountTrigger on Account
(
    before insert, before update, before delete,
     after insert,  after update,  after delete,  after undelete
)
{
    if (Org_Specific_Custom_Setting__c.getInstance()?.Run_All_Triggers__c == false)
    {
        return;
    }
    
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
