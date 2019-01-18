<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_New_Position_Alert</fullName>
        <description>Email New Position Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>CEO</recipient>
            <type>roleSubordinates</type>
        </recipients>
        <recipients>
            <recipient>adiludm@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Recruiting_App_New_Position_Alert</template>
    </alerts>
    <alerts>
        <fullName>Email_for_Approval</fullName>
        <description>Email for Approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>adiludm@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Training_SFDC1</template>
    </alerts>
    <alerts>
        <fullName>email_for_status</fullName>
        <description>email for status</description>
        <protected>false</protected>
        <recipients>
            <recipient>adiludm@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Recruiting_App_New_positions_Alert</template>
    </alerts>
    <alerts>
        <fullName>email_for_status1</fullName>
        <description>email for status1</description>
        <protected>false</protected>
        <recipients>
            <recipient>adiludm@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Recruiting_App_New_positions_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Field_Update_for_Approval</fullName>
        <field>Skills_Required__c</field>
        <formula>&quot;Apex is Required&quot;</formula>
        <name>Field Update for Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reassign_Position_to_Queue</fullName>
        <description>Assign the Position to the Unclaimed
Positions Queue.</description>
        <field>OwnerId</field>
        <lookupValue>UnclaimedPositionsQueue367711</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Reassign Position to Queue</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reassign_positions_to_queue</fullName>
        <field>OwnerId</field>
        <lookupValue>SFDCTraining</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Reassign positions to queue</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Close_Date_to_Today</fullName>
        <field>Close_Date__c</field>
        <formula>TODAY()</formula>
        <name>Set Close Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_to_Closed_Not_Approved</fullName>
        <field>Status__c</field>
        <literalValue>Closed - NotApproved</literalValue>
        <name>Set Status to Closed - Not Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_to_Open_Approved</fullName>
        <field>Status__c</field>
        <literalValue>Open -Approved</literalValue>
        <name>Set Status to Open Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_to_Pending_Approval</fullName>
        <description>While a position is in an approval
process, its status should be set to Pending Approval.</description>
        <field>Status__c</field>
        <literalValue>PendingApproval</literalValue>
        <name>Set Status to Pending Approval.</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Test</fullName>
        <field>Job_Level__c</field>
        <literalValue>• HR-400</literalValue>
        <name>Test</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Type_rule</fullName>
        <field>Type__c</field>
        <literalValue>Internship</literalValue>
        <name>Type rule</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign Position to Manager</fullName>
        <actions>
            <name>Reassign_positions_to_queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>equals</operation>
            <value>CFO,CEO</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Assign Position to Recruiter</fullName>
        <actions>
            <name>Reassign_Position_to_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>notEqual</operation>
            <value>Recruiter,Recruiting Manager</value>
        </criteriaItems>
        <description>Reassign position records to a
recruiter if they were created by another type of employee</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>send_java_material</name>
                <type>Task</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Email Alert</fullName>
        <actions>
            <name>email_for_status</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Position__c.Status__c</field>
            <operation>equals</operation>
            <value>Open -Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email New Position Alert</fullName>
        <actions>
            <name>Email_New_Position_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Position__c.Status__c</field>
            <operation>equals</operation>
            <value>Open -Approved</value>
        </criteriaItems>
        <description>Send an email to everyone whenever
a position record is opened.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Status-rule</fullName>
        <actions>
            <name>Type_rule</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Position__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed -Filled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>java material</fullName>
        <actions>
            <name>send_java_material</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Position__c.Java__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Assign_Unclaimed_Position_Record_to_Recruiter</fullName>
        <assignedTo>SVPHumanResources</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Assign Unclaimed Position Record to Recruiter.</subject>
    </tasks>
    <tasks>
        <fullName>approval</fullName>
        <assignedTo>adiludm@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>approval</subject>
    </tasks>
    <tasks>
        <fullName>checl</fullName>
        <assignedTo>adiludm@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Position__c.Open_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>checl</subject>
    </tasks>
    <tasks>
        <fullName>send_java_material</fullName>
        <assignedTo>adiludm@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Position__c.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>send java material</subject>
    </tasks>
</Workflow>
