<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Subscription_Expiry_Alert</fullName>
        <description>Subscription Expiry Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Subscription_Expiry_Alert</template>
    </alerts>
    <rules>
        <fullName>SMS test</fullName>
        <actions>
            <name>VTSMS</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Phone</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Subscription Expiry Alert</fullName>
        <active>true</active>
        <formula>AND( 
TODAY() = Expiry_Date__c - 15,
 Primary_Email__c &lt;&gt; &apos;&apos; )</formula>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Subscription_Expiry_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Account.Expiry_Date__c</offsetFromField>
            <timeLength>-15</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <offsetFromField>Account.Expiry_Date__c</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <offsetFromField>Account.Expiry_Date__c</offsetFromField>
            <timeLength>-5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Subscription_Expiry_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Account.Expiry_Date__c</offsetFromField>
            <timeLength>-10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>VTSMS</fullName>
        <assignedTo>sfdc.crm22@sfdc.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>{
  &quot;sfTemplate&quot; : &quot;T0002&quot;,
  &quot;sfSenderId&quot; : &quot;15415161800&quot;,
  &quot;sfobject&quot; : &quot;Account&quot;,
  &quot;sfmField&quot; : &quot;Phone&quot;
}</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.SLAExpirationDate__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>VTSMS</subject>
    </tasks>
</Workflow>
