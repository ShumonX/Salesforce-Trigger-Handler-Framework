/**
 * A simple Salesforce Trigger Handler Framework 🛠️👨‍💻
 * @author  Shumon Saha
 * @see     salesforceben.com/the-salesforce-trigger-handler-framework
 * @see     bit.ly/sf-coding-standards
 * @since   28 February 2022
 * @version 2.0: Moved the "Run All Triggers" Org-Specific Setting checkbox ✅
 * from Custom Metadata Type to a Custom Setting because its records should NOT
 * be deployable, completely indepenent, and manually set.
 * @version 2.1: Implemented a clean Guard Clause to exit early &keep logic flat
 * @version 2.2: Strictly enforced the 80 column limit so our eyes don't have to
 * scan from left-to-right 👀
 * @version 3.0: Moved the Switch outside the If-block, to reduce nesting.
 *               Exits early when the Run All Triggers Custom Setting is set and explicitly unchecked/unticked.
 *               Otherwise, runs by default even when the Custom Setting is not set, i.e., doesn't have an Organisation Default Value.
 * ⚠️ Don't forget to un-comment your required lines of code ⚠️
 */

trigger AccountTrigger on Account
(
    before insert, before update, before delete,
     after insert,  after update,  after delete,  after undelete
)
{
    /*
     * GUARD CLAUSE: Exit immediately if Run_All_Triggers__c is unchecked.
     * Uses Safe Navigation Operator (?.)
     */
    if (Org_Specific_Custom_Setting__c.getInstance()?.Run_All_Triggers__c == false)
    {
        return;
    }
    
    /*
     * The main part of our Trigger Handler Framework.
     * Runs by default, even if Org_Specific_Custom_Setting__c is null.
     */
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
    } // End of Switch
} // End of Trigger
