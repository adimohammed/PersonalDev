<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>email_alert_for_years</fullName>
        <ccEmails>arun.shindey@gmail.com</ccEmails>
        <description>email alert for years</description>
        <protected>false</protected>
        <recipients>
            <recipient>adiludm@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/test</template>
    </alerts>
    <fieldUpdates>
        <fullName>cuurent_field</fullName>
        <field>Current_Employer__c</field>
        <formula>&quot;SYMANTEC&quot;</formula>
        <name>cuurent field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>field_uupdates</fullName>
        <field>Current_Employer__c</field>
        <formula>$Organization.Name</formula>
        <name>field uupdates</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Arun_class</fullName>
        <actions>
            <name>cuurent_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Candidate__c.Currently_Employed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Current Employed</fullName>
        <actions>
            <name>field_uupdates</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Candidate__c.Currently_Employed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Start Visa Processing</fullName>
        <actions>
            <name>Assign_the_visa</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Candidate__c.Visa_Required__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>year of exp</fullName>
        <actions>
            <name>email_alert_for_years</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>Years_Of_Experience__c  &gt; 2</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Assign_the_visa</fullName>
        <assignedTo>adiludm@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Assign the visa</subject>
    </tasks>
</Workflow>
