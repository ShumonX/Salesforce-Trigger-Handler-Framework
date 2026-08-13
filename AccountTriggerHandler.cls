/**
 * The Trigger Handler Apex Class 👨‍💻
 * @author  Shumon Saha
 * @see     salesforceben.com/the-salesforce-trigger-handler-framework
 * @see     https://en.wikipedia.org/wiki/Interface_(Java)
 * @see     https://en.wikipedia.org/wiki/Interface_(object-oriented_programming)
 * @since   28 February 2022
 * @version 1.0: Part of a simple Salesforce Trigger Handler Framework.
 * A Java Interface. This is the first code file to be written,
 * before anything else can be written. Because everything is dependent on this.
 */

public without sharing class AccountTriggerHandler implements TriggerHandlerJavaInterface
{
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public AccountTriggerHelper helper;

    /*
     * Constructor
     */
    public AccountTriggerHandler(boolean triggerIsExecuting, integer triggerSize)
    {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
        this.helper = new AccountTriggerHelper();
    }

    /*
     * All "BEFORE" functions
     */
    public void beforeInsert(List<Account> newAccounts)
    {
        helper.doTask1();
        helper.doTask2();
    }
    public void beforeUpdate(List<Account> oldAccounts, List<Account> newAccounts, Map<ID, SObject> oldAccountMap, Map<ID, SObject> newAccountMap)
    {
        helper.doTask3();
        helper.doTask4();
    }
    public void beforeDelete(List<Account> oldAccounts, Map<ID, SObject> oldAccountMap)
    {
        helper.doTask5();
        helper.doTask1();
    }

    /*
     * All "AFTER" functions
     */
    public void afterInsert(List<Account> newAccounts, Map<ID, SObject> newAccountMap)
    {
        helper.doTask2();
        helper.doTask3();
    }
    public void afterUpdate(List<Account> oldAccounts, List<Account> newAccounts, Map<ID, SObject> oldAccountMap, Map<ID, SObject> newAccountMap)
    {
        helper.doTask4();
        helper.doTask5();
    }
    public void afterDelete(List<Account> oldAccounts, Map<ID, SObject> oldAccountMap)
    {
        helper.doTask3();
        helper.doTask1();
    }
    public void afterUndelete(List<Account> newAccounts, Map<ID, SObject> newAccountMap)
    {
        helper.doTask4();
        helper.doTask2();
    }
}
