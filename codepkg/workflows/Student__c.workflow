<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Meal_Plan_Activation_Email_Alert</fullName>
        <description>Meal Plan Activation Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Student_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Meal_Plan_Activation_Alert_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Updating_Allocated_to_field_of_Room_reco</fullName>
        <field>Allotted_To__c</field>
        <formula>Name</formula>
        <name>Updating Allocated to field of Room reco</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Room_Allocated__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Meal Plan Activated</fullName>
        <actions>
            <name>Meal_Plan_Activation_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Student__c.Meal_Plan__c</field>
            <operation>equals</operation>
            <value>YES</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Student Room Allotment Alert</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Student__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Updating Allocated to field of Room record</fullName>
        <actions>
            <name>Updating_Allocated_to_field_of_Room_reco</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updating Allocated to field of Room record</description>
        <formula>Room_Allocated__c  &lt;&gt; &apos;&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
