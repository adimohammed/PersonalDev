<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_an_email1</fullName>
        <ccEmails>adiludm@gmail.com</ccEmails>
        <description>Send an email1</description>
        <protected>false</protected>
        <recipients>
            <recipient>adiludm@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/ChangePwdEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>hasactivityhistory</fullName>
        <field>HasActivityHistory__c</field>
        <literalValue>1</literalValue>
        <name>hasactivityhistory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Activity</fullName>
        <actions>
            <name>hasactivityhistory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>LastActivityDate  = null</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>test class</fullName>
        <actions>
            <name>Send_an_email1</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>startsWith</operation>
            <value>a</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
