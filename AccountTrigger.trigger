/**
 * A simple Salesforce Trigger Handler Framework 🛠️👨‍💻
 * 
 * @author  Shumon Saha <https://www.salesforce.com/trailblazer/shumon>
 * @see     SalesforceBen <salesforceben.com/the-salesforce-trigger-handler-framework>
 * @see     SF Coding Standards <bit.ly/sf-coding-standards>
 * @since   28 February 2022
 * @version 1.0: I wrote for SalesforceBen.com
 * @version 2.0: Moved "Run All Triggers" from Custom Metadata Type to Custom Setting,
 * because its records should NOT be deployable, completely independent, and manually set.
 * @version 3.0: Implemented a clean Guard Clause to exit early, keep logic flat,
 * and most importantly — reduce nesting 🪺
 * 
 * ⚠️ Don't forget to un-comment your required lines of code ⚠️
 * ⚠️    in line numbers: 48, 53, 58, 63, 68, 73, and 78.    ⚠️
 */

trigger AccountTrigger on Account
(
    before insert,    // 1 of 7
    before update,    // 2 of 7
    before delete,    // 3 of 7
     after insert,    // 4 of 7
     after update,    // 5 of 7
     after delete,    // 6 of 7
     after undelete   // 7 of 7
)
{
    /*
     * GUARD CLAUSE: Exit immediately if "Run All Triggers" is unchecked.
     * Uses Safe Navigation Operator (?.)
     */
    if (Org_Specific_Custom_Setting__c.getInstance()?.Run_All_Triggers__c == false)
    {
        return; // 🚶‍♂️ 🚪 ⛔
    }
    
    /*
     * The main part of our Trigger Handler Framework.
     * Runs by default, i.e., even if "Org-Specific Custom Setting" above, was null.
     */
    TriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
    switch on Trigger.operationType
    {
        when BEFORE_INSERT   // 1 of 7
        {
            // 👇 Un-comment BELOW line if needed. Do not delete THIS line 🛑
            // handler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE   // 2 of 7
        {
            // 👇 Un-comment BELOW line if needed. Do not delete THIS line 🛑
            // handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when BEFORE_DELETE   // 3 of 7
        {
            // 👇 Un-comment BELOW line if needed. Do not delete THIS line 🛑
            // handler.beforeDelete(Trigger.old, Trigger.oldMap);
        }
        when AFTER_INSERT    // 4 of 7
        {
            // 👇 Un-comment BELOW line if needed. Do not delete THIS line 🛑
            // handler.afterInsert(Trigger.new, Trigger.newMap);
        }
        when AFTER_UPDATE    // 5 of 7
        {
            // 👇 Un-comment BELOW line if needed. Do not delete THIS line 🛑
            // handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when AFTER_DELETE    // 6 of 7
        {
            // 👇 Un-comment BELOW line if needed. Do not delete THIS line 🛑
            // handler.afterDelete(Trigger.old, Trigger.oldMap);
        }
        when AFTER_UNDELETE  // 7 of 7
        {
            // 👇 Un-comment BELOW line if needed. Do not delete THIS line 🛑
            // handler.afterUndelete(Trigger.new, Trigger.newMap);
        }
    }       // 🔚 End of Switch
}           // 🔚 End of Trigger
