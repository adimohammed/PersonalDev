<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Extend Offer Letter</fullName>
        <actions>
            <name>Extend_an_Offer</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job_Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Extend an Offer</value>
        </criteriaItems>
        <description>Make an offer when a hiring manager changes
the status of a job application to Extend Offer.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Rejection Letter</fullName>
        <actions>
            <name>Send_Rejection_letter</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job_Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <description>Send a rejection letter when a
hiring manager changes the status of a job application to
Rejected.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Rejection Letter5</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Job_Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>offer letter</fullName>
        <actions>
            <name>offer_letter</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job_Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Extend an Offer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>send rejection letter1</fullName>
        <actions>
            <name>send_rejection_letter1</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job_Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Job_Application__c.CreatedDate</offsetFromField>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Extend_an_Offer</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Extend an Offer</subject>
    </tasks>
    <tasks>
        <fullName>Send_Rejection_letter</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Send Rejection letter</subject>
    </tasks>
    <tasks>
        <fullName>offer_letter</fullName>
        <assignedTo>adiludm@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Job_Application__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>offer letter</subject>
    </tasks>
    <tasks>
        <fullName>send_rejection_letter1</fullName>
        <assignedTo>adiludm@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>User.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>send rejection letter1</subject>
    </tasks>
</Workflow>
