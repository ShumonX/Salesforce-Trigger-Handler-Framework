/**
 * @author ShumonX
 * @see salesforceben.com/the-salesforce-trigger-handler-framework
 * @since 28 February 2022
 * @version 1.0
 * 
 */
trigger AccountTrigger on Account
(
	before insert, before update, before delete,
	 after insert,  after update,  after delete,  after undelete
)
{
	// if (Org_Specific_Setting__mdt.getInstance('Run_All_Triggers')?.Value__c == true) // The Safe Navigation Operator (?.)
	/*
	 * Using the Safe Navigation Operator (?.):
	 * If the Custom Setting returns a record, the Safe Navigation Operator (?.)
	 * gets the record's Run_All_Triggers__c field value (true/false).
	 * If the Custom Setting doesn't return a record, i.e., even at the least,
	 * does't have a "Default Organization Level Value" set,
	 * the Safe Navigation Operator (?.) return nulls.
	 * 
	 * Using the Operator (??):
	 * If the expression returns a true or a false, the (??) operator takes it.
	 * Else if the expression returns a null, the ?? operator returns true.
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
