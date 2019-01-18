public with sharing class ContactiCenteraIntegration
{
    public String documentSearchString
    {
        get;
        set;
    }
    public Boolean isInDocument
    {
        get;
        set;
    }

    public List < SelectOption > productList
    {
        get;
        set;
    }
    public String productVal
    {
        get;
        set;
    }
    public String sortField
    {
        get;
        set;
    }
    public String previousSortField
    {
        get;
        set;
    }
    public String defaultSortField
    {
        get;
        set;
    }
    public string docIDString
    {
        get;
        set;
    }
    public List < SelectOption > solutionList
    {
        get;
        set;
    }
    public String solutionVal
    {
        get;
        set;
    }
    public String Order = 'descending';
    public String apiServerURL
    {
        get;
        set;
    }
    public String apiServerSession
    {
        get;
        set;
    }
    public String description
    {
        get;
        set;
    }
    //public list<HelpText__c> custom {get; set;}

    public List < Document > documentList
    {
        get;
        set;
    }
    public string selecttitle
    {
        get;
        set;
    }
    public Boolean showPrevious
    {
        get;
        set;
    }
    public Boolean showNext
    {
        get;
        set;
    }
    public Integer firstRecPosition
    {
        get;
        set;
    }

    private String email
    {
        get;
        set;
    }
    private String resBody
    {
        get;
        set;
    }
    public Integer PageNum
    {
        get;
        set;
    }
    private Contact c;

    public Integer rowLimit
    {
        get;
        set;
    }
    public String isDynamic
    {
        get;
        set;
    }
    public String iscustomized
    {
        get;
        set;
    }
    public Integer FirstPageCount
    {
        get;
        set;
    }
    public Integer LastPageCount
    {
        get;
        set;
    }
    public Integer TotalPageCount
    {
        get;
        set;
    }
   
    private String tokenVal = '';
    private String testVar = '';

    private String endpointurl = 'http://api.icentera.com/v1Sandbox/';

    public String myapiServerSession = null;

public ContactiCenteraIntegration(ApexPages.StandardController sc)
    {

        c = (Contact) sc.getRecord();
        documentList = null;
        c = [select id, name, email from Contact where id = : c.id];
 system.debug('Contact:'+c);
        showPrevious = showNext = false;
        rowLimit = 20;
        documentSearchString = '';
        PageNum = 1;

    }
 Private void setPageNum(Integer P)
    {
        system.debug('pppxx' + P);
        PageNum = P;

    }
 public void search()
    {
        order = 'descending';
        if (documentList != null) documentList.clear();
        HttpRequest req = new HttpRequest();
        setPageNum(1);
        //379 QTM
        //364 TR 
        //12 Apps
        //326 

        if (myapiServerSession == null) // For some reason we were getting a differnet apiServerSession for the first get() and all subsequent get() ??
        myapiServerSession = apiServerSession; // Now we are getting the apiServersession only once in this object instance

        String endPoint = endpointurl + 'AuthenticationService.svc/json/AuthenticateSFSessionByEmail?siteid=364&email=clesinski@icentera.com&sessionid=' + myapiServerSession + '&instanceUrl=' + apiServerURL;
        req.setMethod('GET');
        HTTPResponse res;

        // system.debug('API URL is :::: '+apiServerURL);

        req.setEndpoint(endPoint);
        req.setTimeout(60000);

        Http http = new Http();
        resBody = null;
        if (testVar == '')
        {
            res = http.send(req);
            if (res != null) resBody = res.getBody();
        }
        else resBody = '{"d":"c577d54db33f416ab2e28b2ae00098b8"}';
        if (resBody != null)
        {
            JSONParser parser = JSON.createParser(resBody);
            tokenVal = '';
            string errStr = '';
            while (parser != null && parser.nextToken() != null)
            {
                system.debug('PRINT' + parser.getText());
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'd'))
                {
                    if (parser.nextToken() != null)
                    {
                        tokenVal = parser.getText();
                        if (tokenVal.tolowercase().contains('error'))
                        {
                            errStr = tokenVal;
                        }

                        break;
                    }
                }
            }


            if (errStr == '')
            {
                req = new HttpRequest();
                endPoint = endpointurl + 'TestService.svc/json/SearchDocuments?token=' + tokenVal + '&search=' + documentSearchString + '&sortField=lastupdated&sortOrder=' + order + '&pageSize=20&sensitivity=1&page=' + PageNum + '&productIds=&solutionIds=';
                system.debug('XXXX' + documentSearchString);
                req.setMethod('GET');
                req.setEndpoint(endPoint);
                req.setTimeout(60000);
                http = new Http();
                if (testVar == '')
                {
                    res = http.send(req);
                    resBody = res.getBody();
                }
                else resBody = '{"d":{"__type":"DocumentSearchResult:#iCenteraServices","Documents":[{"__type":"SimpleDocument:#iCenteraServices","ResultCount":120,"CustomerReady":true,"Description":null,"FileType":"xls","Id":1042,"InternalOnly":false,"NDARequired":false,"PartnerReady":true,"Rating":4,"Title":"ROI Worksheet - REVENUE VERSION","URL":""}]}}';
                system.debug('qqq' + resBody);
                parser = JSON.createParser(resBody);
                system.debug('callingcreate');
                if (parser != null) createDocuments(parser);
                if (documentList != null && documentList.size() < rowLimit)
                {
                    showNext = false;

                }
                else
                {
                    showNext = True;
                }
                showPrevious = False;
                sortField = previousSortField = 'lastupdated';

            }
            else ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Error occurred while calling iCentera authenticateSFSession'));
        }
    }






 public void createDocuments(JSONParser parser)
    {
    showPrevious = showNext = false;
        if (parser != null)
        {
            documentList = new List < Document > ();
            Document doc = null;
            Integer position = 0;
            String doccount = '0';

            while (parser.nextToken() != null)
            {
                JSONToken CurrentToken = parser.getCurrentToken();
                system.debug(LoggingLevel.DEBUG, 'CurrentToken ' + CurrentToken + 'getText='+parser.getText());
                
                if (CurrentToken == JSONToken.FIELD_NAME && parser.getText().equalsignorecase('Resultcount'))
                {
                    parser.nextToken();
                    docCount = parser.getText();
                }                
                else if (CurrentToken == JSONToken.FIELD_NAME && parser.getText().equalsignorecase('documents'))
                {
                    while (parser.nextToken() != null)
                    {
                        CurrentToken = parser.getCurrentToken();
                        if (CurrentToken == JSONToken.START_OBJECT)
                        {
                            doc = new Document();
                        }
                        else if (CurrentToken == JSONToken.FIELD_NAME)
                        {
                            if ( parser.getText() == 'title')
                            {
                                parser.nextToken();
                                doc.title = parser.getText();
                            }
                            else if (parser.getText() == 'id')
                            {
                                parser.nextToken();
                                doc.id = parser.getText();
                            }
                            else if (parser.getText() == 'description')
                            {
                                parser.nextToken();
                                doc.description = parser.getText();
                            }
                            else if (parser.getText() == 'url')
                            {
                                parser.nextToken();
                                doc.url = parser.getText();
                            }
                            else if (parser.getText() == 'filetype')
                            {
                                parser.nextToken();
                                doc.fileType = parser.getText();
                            }
                            else if (parser.getText() == 'rating')
                            {
                                parser.nextToken();
                                doc.rating = parser.getText();
                            }
                            else if (parser.getText() == 'lastupdated')
                            {
                                parser.nextToken();
                                doc.lastupdated = parser.getText();
                                doc.st = ((doc.lastupdated.split('\\.', 2).get(0)).split('T', 2)).get(0) + ' ' + ((doc.lastupdated.split('\\.', 2).get(0)).split('T', 2)).get(1);
                                doc.st = doc.st.substring(0, doc.st.indexOf(' '));
                                system.debug('Doc Date:' + doc.st);
                            }
                            else if (parser.getText() == 'totalViews')
                            {
                                parser.nextToken();
                                doc.internalOnly = Boolean.valueOf(parser.getText());
                            }
                            else
                            {
                                system.debug('Token Value:' + parser.getText());
                            }
                        }
                        else if (CurrentToken == JSONToken.END_OBJECT && doc != null)
                        {
                            doc.position = position;
                            position++;
                            documentList.add(doc);
                            doc = null;
                        }
                        
                    }
                }
                else 
                    system.debug('CurrentToken  :' + CurrentToken);
            }
            
            if (documentList.isEmpty())
            {
                documentList = null;
                showPrevious = showNext = false;
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'No results were found for the search string \'' + documentSearchString + '\'.'));
            }
            else 
            {
                FirstPageCount = (PageNum-1)*20+1;
                LastPageCount = PageNum*20;
                
                if(documentList.size() < rowLimit)
                     ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Showing ' +FirstPageCount + ' to '+docCount+' of  ' + docCount));
                else
                     ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Showing ' +FirstPageCount + ' to '+LastPageCount+' of  ' + docCount));
                if (documentList.size() > rowLimit)
                {
                    showNext = true;
                }
                }
            }
        else 
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Document Parser is Null '));

    }

 public void showNextRecs()
    {
        String endPoint;
        HTTPResponse res;
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        setPageNum(PageNum + 1);

        endPoint = endpointurl + 'TestService.svc/json/SearchDocuments?token=' + tokenVal + '&search=' + documentSearchString + '&sortField=' + sortField + '&sortOrder=' + order + '&sensitivity=1&pageSize=20&page=' + PageNum + '&productIds=&solutionIds=';
        req.setMethod('GET');
        req.setEndpoint(endPoint);
        req.setTimeout(60000);
        http = new Http();
        if (testVar == '')
        {
            res = http.send(req);
            resBody = res.getBody();
        }
        else resBody = '{"d":{"__type":"DocumentSearchResult:#iCenteraServices","Documents":[{"__type":"SimpleDocument:#iCenteraServices","CustomerReady":true,"Description":null,"FileType":"xls","Id":1042,"InternalOnly":false,"NDARequired":false,"PartnerReady":true,"Rating":4,"Title":"ROI Worksheet - REVENUE VERSION","URL":""}]}}';

        JSONParser parser = JSON.createParser(resBody);

        if (parser != null) createDocuments(parser);

        if (documentList != null && documentList.size() < rowLimit)
        {
            showNext = false;
            ShowPrevious = True;
        }
        else
        {
            showPrevious = true;
            showNext = True;
        }

        //  ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Next '+rowLimit+' of '+dList.size())); 

    }


    public void showPreviousRecs()
    {
        String endPoint;
        HTTPResponse res;
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        if (PageNum > 1) setPageNum(PageNum - 1);
        List < Document > dList = new List < Document > ();


        endPoint = endpointurl + 'TestService.svc/json/SearchDocuments?token=' + tokenVal + '&search=' + documentSearchString + '&sortField=' + sortfield + '&sortOrder=' + order + '&pageSize=' + rowLimit + '&sensitivity=1&page=' + PageNum + '&productIds=&solutionIds=';
        req.setMethod('GET');
        req.setEndpoint(endPoint);
        req.setTimeout(60000);
        http = new Http();
        if (testVar == '')
        {
            res = http.send(req);
            resBody = res.getBody();
        }
        else resBody = '{"d":{"__type":"DocumentSearchResult:#iCenteraServices","Documents":[{"__type":"SimpleDocument:#iCenteraServices","CustomerReady":true,"Description":null,"FileType":"xls","Id":1042,"InternalOnly":false,"NDARequired":false,"PartnerReady":true,"Rating":4,"Title":"ROI Worksheet - REVENUE VERSION","URL":""}]}}';
        JSONParser parser = JSON.createParser(resBody);
        //parser = JSON.createParser(resBody);
        system.debug('callingcreate');
        if (parser != null) createDocuments(parser);

        if (PageNum == 1)
        {
            showNext = True;
            ShowPrevious = False;
        }
        else
        {
            showPrevious = true;
            showNext = True;
        }

        //     ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Size '+rowLimit+' of ')); 
    }

    public void populateDocString()
    {

        String title = '';
        Integer numberOfSelected = 0;
        if (documentList != null && documentList.size() > 0)
        {
            for (Document d: documentList)
            {
                if (d.isChecked)
                {
                    numberOfSelected++;
                    if (numberOfSelected == 1) title = d.title;

                }
            }
        }

        if (numberOfSelected == 1)
        {
            docIDString = title;
        }
        else if (numberOfSelected > 0)
        {
            numberOfSelected = numberOfSelected - 1;
            docIDString = title + ' ' + numberOfSelected + ' other(s)';
        }
        else docIDString = null;
    }




    public void sendMailAndCreateTask(List < Document > dList)
    {
        List < Task > taskList = new List < Task > ();
        String endPoint;
        HTTPResponse res;
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        String customizedEmailText = '';
        String customizedEmailSub = '';
        String docIdsSelected = '';

        selecttitle = '';

        if (dList != null)
        {
            if (dList.size() > 0)
            {
                docIdsSelected = dList[0].id;
                if (dList.size() > 1)
                {
                    Integer ra = dList.size() - 1;
                    for (Integer i = 1; i < dList.size(); i++)
                    {
                        docIdsSelected = docIdsSelected + ',' + dList[i].id;
                        system.debug('Docdocdoc' + docIdsSelected);
                    }
                    selecttitle = dList[0].title + ' ' + 'and' + ' ' + ra + ' ' + 'other(s)';
                    system.debug('yyy' + selecttitle);
                }
                else selecttitle = dList[0].title;

                selecttitle = EncodingUtil.UrlEncode(selecttitle, 'UTF-8');
                system.debug('rrrr' + selecttitle);

                Contact_Email__c[] ce = [select Subject__c, description__c from Contact_Email__c where user__c = : UserInfo.getUserId()];

                if (ce != null && ce.size() > 0 && ce[0].description__c != null && ce[0].subject__c != null)
                {
                    customizedEmailText = EncodingUtil.UrlEncode(ce[0].description__c, 'UTF-8');
                    customizedEmailSub = EncodingUtil.UrlEncode(ce[0].Subject__c, 'UTF-8');
                }
                else
                {
                    customizedEmailText = '';
                    customizedEmailSub = selecttitle;
                }
                if (isDynamic == 'true') endPoint = endpointurl + 'TestService.svc/json/EmailDocuments?token=' + tokenVal + '&docids=' + docIdsSelected + '&recipient=' + c.Email + '&subject=' + customizedEmailSub + '&sfdccontactid=' + c.id + '&isDynamic=true' + '&body=' + customizedEmailText;
                else endPoint = endpointurl + 'TestService.svc/json/EmailDocuments?token=' + tokenVal + '&docids=' + docIdsSelected + '&recipient=' + c.Email + '&subject=' + customizedEmailSub + '&sfdccontactid=' + c.id + '&body=' + customizedEmailText;


                if (testVar == '')
                {
                    // Send email by posting to endpoint
                    req.setMethod('GET');
                    req.setTimeout(60000);

                    req.setEndpoint(endPoint);
                    system.debug('eee' + endpoint);

                    res = http.send(req);
                    JSONParser parser = JSON.createParser(res.getBody());
                    while (parser.nextToken() != null)
                    {
                        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'd'))
                        {
                            parser.nextToken();
                            if (parser.getText() == 'true')
                            {
                                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Email sent successfully for the selected documents.'));

                                // When successful create a task for each document in the list
                                for (Document d: dList)
                                {
                                    Task t = new Task();
                                    t.WhoId = c.id;
                                    t.Subject = 'iCentera Dynamic Email sent for ' + d.title;
                                    t.status = 'Completed';
                                    t.type = 'Email';
                                    String comments = d.title + '\n\n';
                                    comments += 'Please download and save the following linked file:\n';
                                    comments += '\nTitle:' + d.title;
                                    comments += '\nFormat:' + d.filetype;
                                    comments += '\nDescription:' + d.description;

                                    t.description = comments;
                                    taskList.add(t);
                                }
                                if (taskList.size() > 0) insert taskList;
                            }
                            else
                            {
                                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Email could not be sent.'));
                            }
                        }
                    }
                }
            }
        }
    }

    public void doSort()
    {
        setPageNum(1);

        String endPoint;
        HTTPResponse res;
        HttpRequest req = new HttpRequest();
        Http http = new Http();

        if (previousSortField == sortField)
        {
            if (order == 'ascending') order = 'descending';
            else order = 'ascending';
        }
        else
        {
            order = 'ascending';

        }

        endPoint = endpointurl + 'TestService.svc/json/SearchDocuments?token=' + tokenVal + '&search=' + documentSearchString + '&sortField=' + sortfield + '&sortOrder=' + order + '&sensitivity=1&pageSize=20&page=' + PageNum + '&productIds=&solutionIds=';
        req.setMethod('GET');
        req.setEndpoint(endPoint);
        req.setTimeout(60000);
        http = new Http();
        if (testVar == '')
        {
            res = http.send(req);
            resBody = res.getBody();
        }
        else resBody = '{"d":{"__type":"DocumentSearchResult:#iCenteraServices","Documents":[{"__type":"SimpleDocument:#iCenteraServices","CustomerReady":true,"Description":null,"FileType":"xls","Id":1042,"InternalOnly":false,"NDARequired":false,"PartnerReady":true,"Rating":4,"Title":"ROI Worksheet - REVENUE VERSION","URL":""}]}}';
        JSONParser parser = JSON.createParser(resBody);
        //parser = JSON.createParser(resBody);
        system.debug('callingcreate');
        if (parser != null) createDocuments(parser);
        system.debug('ppp' + PageNum);
        if (documentList != null && documentList.size() < rowLimit)
        {
            showNext = false;

        }
        else
        {
            showNext = True;
        }
        showPrevious = false;
        previousSortField = sortField;
    }



    public class Document
    {
        public String type
        {
            get;
            set;
        }
        public String description
        {
            get;
            set;
        }
        public String fileType
        {
            get;
            set;
        }
        public String id
        {
            get;
            set;
        }
        public String rating
        {
            get;
            set;
        }
        public String title
        {
            get;
            set;
        }
        public String url
        {
            get;
            set;
        }
        public Integer position
        {
            get;
            set;
        }
        public Boolean internalOnly
        {
            get;
            set;
        }
        public Boolean isChecked
        {
            get;
            set;
        }
        public string lastupdated
        {
            get;
            set;
        }
        public String st
        {
            get;
            set;
        }
        Public String ResultCount
        {
            get;
            set;
        }
        public Document()
        {
            type = null;
            description = null;
            fileType = null;
            id = null;
            rating = null;
            title = null;
            url = null;
            internalOnly = false;
            isChecked = false;
            lastupdated = null;
            // st = null;
        }

    }

    public void sendEmail()
    {
       List < Document > tempDocumentList = new List < Document > ();
      
       if(documentList!=null)
       {
        for (Document d: documentList)
        {
            if (d.isChecked)
            {
                // ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,d.title+' =========== '+d.isChecked));
                //System.debug(d.title+' =========== '+d.isChecked);
                tempDocumentList.add(d);
                //System.debug('TTTt'+tempDocumentList );
            }
        }
       }
        sendMailAndCreateTask(tempDocumentList);
       contact_email__c[] ceList = [select id, Subject__c, description__c, user__c from contact_email__c where user__c = : UserInfo.getUserId()];
        if (celist.size() > 0) 
            delete ceList;
    }

    public void reset()
    {
        if (documentList != null) documentList = null;
        documentSearchString = null;
        showPrevious = showNext = false;
    }
    public class custom
    {

        }

    public static testMethod void testICentera()
    {
        PageReference pageRef = Page.ContactiCenteraIntegration;
       // Test.setCurrentPage(pageRef);
        Contact ct = new Contact(Email = 'imohamme@calliduscloud.com', lastname = 'Ahmed');
        insert ct;
        Contact c = [select id from Contact where id = : ct.id];
        ApexPages.StandardController sc = new ApexPages.standardController(c);
        ContactiCenteraIntegration controller = new ContactiCenteraIntegration(sc);
        controller.testVar = 'in Test';
        controller.search();
        ContactiCenteraIntegration.Document d = new ContactiCenteraIntegration.Document();
        controller.sortField = 'Title';
        controller.previousSortField = 'lastupdated';
        controller.previousSortField = 'Title';

        controller.dosort();
        controller.documentList = new List < Document > ();
        d = new ContactiCenteraIntegration.Document();
        d.title = 'iCentera';
        d.fileType = 'xls';
        d.position = 0;
        d.st = '2012-07-09';
        controller.documentList.add(d);

        controller.populatedocstring();
        controller.showNextRecs();
        controller.showpreviousRecs();
        controller.sendMailAndCreateTask(controller.documentList);
        controller.sortField = 'Title';
        controller.previousSortField = 'lastupdated';

        d = new ContactiCenteraIntegration.Document();
        d.title = 'iCentera1';
        d.fileType = 'xls';
        d.position = 1;
        d.st = '2012-07-09';
        controller.showpreviousRecs();
        controller.documentList = new List < Document > ();
        d = new ContactiCenteraIntegration.Document();
        d.title = 'iCentera';
        d.fileType = 'xls';
        d.position = 0;
        d.st = '2012-07-09';
        controller.documentList.add(d);
        controller.showNextRecs();

        controller.documentList = new List < Document > ();
        d = new ContactiCenteraIntegration.Document();
        d.title = 'iCentera';
        d.fileType = 'xls';
        d.position = 0;
        d.st = '2012-07-09';
        controller.documentList.add(d);
        controller.sendMailAndCreateTask(controller.documentList);
        controller.sendemail();
        controller.reset();

        controller.dosort();
    }
}