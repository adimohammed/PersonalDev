trigger updatejobs on Review__c (after insert) {

for ( Review__c r : trigger.new) {

Set<Id> lijobIds = new Set<Id>();

Review__c rev =  new Review__c();

if ( rev.Rating__c == 2 )
lijobIds.add( rev.Job_Application__c);


List<Job_Application__c> job = new List<Job_Application__c>();
job = [ Select id, Status__c from Job_Application__c where id =: lijobIds  ];

for ( Job_Application__c jobs : job)
{
jobs.status__c = 'Hired';
}

//if ( job.size()>0)

update job ;

}
}