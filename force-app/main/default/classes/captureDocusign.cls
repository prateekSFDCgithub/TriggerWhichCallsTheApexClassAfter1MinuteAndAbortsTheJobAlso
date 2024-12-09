@RestResource(urlMapping='/captureDoc/*')
    global class captureDocusign {

    @HttpPost
    global static void debugDocInfo() {
    RestRequest request = RestContext.request;
    Blob body = request.requestBody;
    system.debug('body: ' + body);

    // Convert Blob to string for parsing
    String bodyString = body.toString();
    system.debug('bodyString: ' + bodyString);

    // Parse the JSON response
    Map<String, Object> jsonBody = (Map<String, Object>) JSON.deserializeUntyped(bodyString); 
    Map<String, Object> data = (Map<String, Object>) jsonBody.get('data');
    Map<String, Object> envelopeSummary = (Map<String, Object>) data.get('envelopeSummary');
    Map<String, Object> recipients = (Map<String, Object>) envelopeSummary.get('recipients');
    List<Object> signers = (List<Object>) recipients.get('signers');
    Map<String, Object> signer = (Map<String, Object>) signers[0]; // Assuming the first signer is the one you need
    Map<String, Object> tabs = (Map<String, Object>) signer.get('tabs');

    // DBA NAME
    String targetTabLabelDBA = 'DBA Name';
    String tabValueForTargetLabelDBA = getTabValue(tabs, targetTabLabelDBA);
    system.debug(targetTabLabelDBA + ' value: ' + tabValueForTargetLabelDBA);

    // BUSINESS NAME 
    String targetTabLabelName = 'Business Name';
    String tabValueForTargetLabelName = getTabValue(tabs, targetTabLabelName);

    // Amount Requested
    String targetTabLabelAmount = 'Amount Requested';
    String tabValueForTargetLabelAmount = getTabValue(tabs, targetTabLabelAmount);
    system.debug(targetTabLabelAmount + ' value: ' + tabValueForTargetLabelAmount); 
    if (tabValueForTargetLabelAmount.contains('$')) {
        tabValueForTargetLabelAmount = tabValueForTargetLabelAmount.replace('$','');
    }
    if (tabValueForTargetLabelAmount.contains(',')) {
        tabValueForTargetLabelAmount = tabValueForTargetLabelAmount.replace(',','');
    }

    // Annual Revenue
    String targetTabLabelRevenue = 'Annual Revenue';
    String tabValueForTargetLabelRevenue = getTabValue(tabs, targetTabLabelRevenue);
    system.debug(targetTabLabelRevenue + ' value: ' + tabValueForTargetLabelRevenue);
    if (tabValueForTargetLabelRevenue.contains('$')) {
        tabValueForTargetLabelRevenue = tabValueForTargetLabelRevenue.replace('$','');
    }
        if (tabValueForTargetLabelRevenue.contains(',')) {
        tabValueForTargetLabelRevenue = tabValueForTargetLabelRevenue.replace(',','');
    }
    // Federal Tax Id
    String targetTabLabelTaxId = 'Federal Tax Id';
    String tabValueForTargetLabelTaxId = getTabValue(tabs, targetTabLabelTaxId);
    system.debug(targetTabLabelTaxId + ' value: ' + tabValueForTargetLabelTaxId);

    // Phone Number
    String targetTabLabelPhone = 'Phone Number';
    String tabValueForTargetLabelPhone = getTabValue(tabs, targetTabLabelPhone);
    system.debug(targetTabLabelPhone + ' value: ' + tabValueForTargetLabelPhone);

    // Website
    String targetTabLabelWebsite = 'Website';
    String tabValueForTargetLabelWebsite = getTabValue(tabs, targetTabLabelWebsite);
    system.debug(targetTabLabelWebsite + ' value: ' + tabValueForTargetLabelWebsite);

    // Business Start Date
    String targetTabLabelStartDate = 'Business Start Date';
    String tabValueForTargetLabelStartDate = getTabValue(tabs, targetTabLabelStartDate);
    system.debug(targetTabLabelStartDate + ' value: ' + tabValueForTargetLabelStartDate);

    // Industry
    String targetTabLabelIndustry = 'Industry';
    String tabValueForTargetLabelIndustry = getTabValue(tabs, targetTabLabelIndustry);
    system.debug(targetTabLabelIndustry + ' value: ' + tabValueForTargetLabelIndustry);

    // Business Address
    String targetTabLabelBusinessAddress = 'Business Address';
    String tabValueForTargetLabelBusinessAddress = getTabValue(tabs, targetTabLabelBusinessAddress);
    system.debug(targetTabLabelBusinessAddress + ' value: ' + tabValueForTargetLabelBusinessAddress);

    // Use of Proceeds
    String targetTabLabelUseOfProceeds = 'Use of Proceeds';
    String tabValueForTargetLabelUseOfProceeds = getTabValue(tabs, targetTabLabelUseOfProceeds);
    system.debug(targetTabLabelUseOfProceeds + ' value: ' + tabValueForTargetLabelUseOfProceeds);

    // City
    String targetTabLabelCity = 'city';
    String tabValueForTargetLabelCity = getTabValue(tabs, targetTabLabelCity);
    system.debug(targetTabLabelCity + ' value: ' + tabValueForTargetLabelCity);

    // State
    String targetTabLabelState = 'state';
    String tabValueForTargetLabelState = getTabValue(tabs, targetTabLabelState);
    system.debug(targetTabLabelState + ' value: ' + tabValueForTargetLabelState);

    // Zip
    String targetTabLabelZip = 'zip';
    String tabValueForTargetLabelZip = getTabValue(tabs, targetTabLabelZip);
    system.debug(targetTabLabelZip + ' value: ' + tabValueForTargetLabelZip);

    // Entity Type
    String targetTabLabelEntityType = 'entity_type';
    String tabValueForTargetLabelEntityType = getTabValue(tabs, targetTabLabelEntityType);
    system.debug(targetTabLabelEntityType + ' value: ' + tabValueForTargetLabelEntityType);

    // W2 Employees 21-22
    String targetTabLabelW2Employees = 'w2_employees_21_22';
    String tabValueForTargetLabelW2Employees = getTabValue(tabs, targetTabLabelW2Employees);
    system.debug(targetTabLabelW2Employees + ' value: ' + tabValueForTargetLabelW2Employees);

    // Most Important
    String targetTabLabelMostImportant = 'most_important';
    String tabValueForTargetLabelMostImportant = getTabValue(tabs, targetTabLabelMostImportant);
    system.debug(targetTabLabelMostImportant + ' value: ' + tabValueForTargetLabelMostImportant);

    // Process Credit Card
    String targetTabLabelProcessCreditCard = 'Process Credit Card';
    String tabValueForTargetLabelProcessCreditCard = getTabValue(tabs, targetTabLabelProcessCreditCard);
    system.debug(targetTabLabelProcessCreditCard + ' value: ' + tabValueForTargetLabelProcessCreditCard);

    // Interested
    String targetTabLabelInterested = 'Interested';
    String tabValueForTargetLabelInterested = getTabValue(tabs, targetTabLabelInterested);
    system.debug(targetTabLabelInterested + ' value: ' + tabValueForTargetLabelInterested);

    // Monthly CC Processing
    String targetTabLabelMonthlyCCProcessing = 'monthly_cc_processing';
    String tabValueForTargetLabelMonthlyCCProcessing = getTabValue(tabs, targetTabLabelMonthlyCCProcessing);
    system.debug(targetTabLabelMonthlyCCProcessing + ' value: ' + tabValueForTargetLabelMonthlyCCProcessing);

    // Description of busineess
    String targetTabLabelDescription = 'Description of busineess';
    String tabValueForTargetLabelDescription = getTabValue(tabs, targetTabLabelDescription);
    system.debug(targetTabLabelDescription + ' value: ' + tabValueForTargetLabelDescription);

    // Owner Name 1
    String targetTabLabelOwnerName1 = 'Owner Name 1';
    String tabValueForTargetLabelOwnerName1 = getTabValue(tabs, targetTabLabelOwnerName1);
    system.debug(targetTabLabelOwnerName1 + ' value: ' + tabValueForTargetLabelOwnerName1);

    // Owner Name 2
    String targetTabLabelOwnerName2 = 'Owner Name 2';
    String tabValueForTargetLabelOwnerName2 = getTabValue(tabs, targetTabLabelOwnerName2);
    system.debug(targetTabLabelOwnerName2 + ' value: ' + tabValueForTargetLabelOwnerName2);

    // DOB 1
    String targetTabLabelDOB1 = 'DOB 1';
    String tabValueForTargetLabelDOB1 = getTabValue(tabs, targetTabLabelDOB1);
    system.debug(targetTabLabelDOB1 + ' value: ' + tabValueForTargetLabelDOB1);

    // DOB 2
    String targetTabLabelDOB2 = 'DOB 2';
    String tabValueForTargetLabelDOB2 = getTabValue(tabs, targetTabLabelDOB2);
    system.debug(targetTabLabelDOB2 + ' value: ' + tabValueForTargetLabelDOB2);

    // SSN 1
    String targetTabLabelSSN1 = 'SSN 1';
    String tabValueForTargetLabelSSN1 = getTabValue(tabs, targetTabLabelSSN1);
    system.debug(targetTabLabelSSN1 + ' value: ' + tabValueForTargetLabelSSN1);

    // SSN 2
    String targetTabLabelSSN2 = 'SSN 2';
    String tabValueForTargetLabelSSN2 = getTabValue(tabs, targetTabLabelSSN2);
    system.debug(targetTabLabelSSN2 + ' value: ' + tabValueForTargetLabelSSN2);

    // % Ownership 1 
    String targetTabLabelOwnership1 = '% Ownership 1';
    String tabValueForTargetLabelOwnership1 = getTabValue(tabs, targetTabLabelOwnership1);
    system.debug(targetTabLabelOwnership1 + ' value: ' + tabValueForTargetLabelOwnership1);

    // % Ownership 2 (Assuming you meant to include this field as well)
    String targetTabLabelOwnership2 = '% Ownership 2';
    String tabValueForTargetLabelOwnership2 = getTabValue(tabs, targetTabLabelOwnership2);
    system.debug(targetTabLabelOwnership2 + ' value: ' + tabValueForTargetLabelOwnership2);

    // Owner Address 1
    String targetTabLabelOwnerAddress1 = 'Owner Address 1';
    String tabValueForTargetLabelOwnerAddress1 = getTabValue(tabs, targetTabLabelOwnerAddress1);
    system.debug(targetTabLabelOwnerAddress1 + ' value: ' + tabValueForTargetLabelOwnerAddress1);

    // Owner Address 2
    String targetTabLabelOwnerAddress2 = 'Owner Address 2';
    String tabValueForTargetLabelOwnerAddress2 = getTabValue(tabs, targetTabLabelOwnerAddress2);
    system.debug(targetTabLabelOwnerAddress2 + ' value: ' + tabValueForTargetLabelOwnerAddress2);

    // Owner City 1
    String targetTabLabelOwnerCity1 = 'Owner City 1';
    String tabValueForTargetLabelOwnerCity1 = getTabValue(tabs, targetTabLabelOwnerCity1);
    system.debug(targetTabLabelOwnerCity1 + ' value: ' + tabValueForTargetLabelOwnerCity1);

    // Owner City 2
    String targetTabLabelOwnerCity2 = 'Owner City 2';
    String tabValueForTargetLabelOwnerCity2 = getTabValue(tabs, targetTabLabelOwnerCity2);
    system.debug(targetTabLabelOwnerCity2 + ' value: ' + tabValueForTargetLabelOwnerCity2);

    // Owner State 1
    String targetTabLabelOwnerState1 = 'Owner State 1';
    String tabValueForTargetLabelOwnerState1 = getTabValue(tabs, targetTabLabelOwnerState1);
    system.debug(targetTabLabelOwnerState1 + ' value: ' + tabValueForTargetLabelOwnerState1);

    // Owner State 2
    String targetTabLabelOwnerState2 = 'Owner State 2';
    String tabValueForTargetLabelOwnerState2 = getTabValue(tabs, targetTabLabelOwnerState2);
    system.debug(targetTabLabelOwnerState2 + ' value: ' + tabValueForTargetLabelOwnerState2);

    // Owner Zip 1
    String targetTabLabelOwnerZip1 = 'Owner Zip 1';
    String tabValueForTargetLabelOwnerZip1 = getTabValue(tabs, targetTabLabelOwnerZip1);
    system.debug(targetTabLabelOwnerZip1 + ' value: ' + tabValueForTargetLabelOwnerZip1);

    // Owner Zip 2
    String targetTabLabelOwnerZip2 = 'Owner Zip 2';
    String tabValueForTargetLabelOwnerZip2 = getTabValue(tabs, targetTabLabelOwnerZip2);
    system.debug(targetTabLabelOwnerZip2 + ' value: ' + tabValueForTargetLabelOwnerZip2);

    // Owner Phone 1
    String targetTabLabelOwnerPhone1 = 'Owner Phone 1';
    String tabValueForTargetLabelOwnerPhone1 = getTabValue(tabs, targetTabLabelOwnerPhone1);
    system.debug(targetTabLabelOwnerPhone1 + ' value: ' + tabValueForTargetLabelOwnerPhone1);

    // Owner Phone 2
    String targetTabLabelOwnerPhone2 = 'Owner Phone 2';
    String tabValueForTargetLabelOwnerPhone2 = getTabValue(tabs, targetTabLabelOwnerPhone2);
    system.debug(targetTabLabelOwnerPhone2 + ' value: ' + tabValueForTargetLabelOwnerPhone2);

    // Owner Email Address 1
    String targetTabLabelOwnerEmail1 = 'Owner email address 1'; 
    String tabValueForTargetLabelOwnerEmail1 = getTabValue(tabs, targetTabLabelOwnerEmail1);
    system.debug(targetTabLabelOwnerEmail1 + ' value: ' + tabValueForTargetLabelOwnerEmail1);

    // Owner Email Address 2
    String targetTabLabelOwnerEmail2 = 'Owner email addres 2'; 
    String tabValueForTargetLabelOwnerEmail2 = getTabValue(tabs, targetTabLabelOwnerEmail2);
    system.debug(targetTabLabelOwnerEmail2 + ' value: ' + tabValueForTargetLabelOwnerEmail2);

    // Owner Credit 1
    String targetTabLabelOwnerCredit1 = 'Owner Credit 1';
    String tabValueForTargetLabelOwnerCredit1 = getTabValue(tabs, targetTabLabelOwnerCredit1);
    system.debug(targetTabLabelOwnerCredit1 + ' value: ' + tabValueForTargetLabelOwnerCredit1);

    // Owner Credit 2
    String targetTabLabelOwnerCredit2 = 'Owner Credit 2';
    String tabValueForTargetLabelOwnerCredit2 = getTabValue(tabs, targetTabLabelOwnerCredit2);
    system.debug(targetTabLabelOwnerCredit2 + ' value: ' + tabValueForTargetLabelOwnerCredit2);

    // Extract email
    String email = String.valueOf(signer.get('email')); 
    system.debug('Email: ' + email); 

    Id leadId = null;

    // Create a new Lead object
    list<lead>leadListToCheck = [select id,email from lead where email =:email and isconverted = false limit 1];
    Lead l = new Lead();
    if(leadListToCheck.isEmpty()){        
    // Initialize name parts by splitting and handling spaces
    String name = tabValueForTargetLabelName.trim();
 name = tabValueForTargetLabelName.trim().replaceAll('\\s+', ' ');
List<String> nameParts = name.split(' ');

// Assign values to FirstName, MiddleName, and LastName based on the number of words
if (nameParts.size() == 1) {
    l.FirstName = nameParts[0];
    l.LastName = nameParts[0];
} else if (nameParts.size() == 2) {
    l.FirstName = nameParts[0];
    l.LastName = nameParts[1];
} else if (nameParts.size() == 3) {
    l.FirstName = nameParts[0];
    l.MiddleName = nameParts[1];
    l.LastName = nameParts[2];
} else {
    // For more than three words, assign the first to FirstName, the second to MiddleName,
    // and combine the rest for LastName
    l.FirstName = nameParts[0];
    l.MiddleName = nameParts[1];
    
    // Create a new list from the third element onward and join it
    List<String> remainingParts = new List<String>();
    for (Integer i = 2; i < nameParts.size(); i++) {
        remainingParts.add(nameParts[i]);
    }
    
    // Join remaining parts for LastName
    l.LastName = String.join(remainingParts, ' ');
}
        system.debug(targetTabLabelName + ' value: ' + tabValueForTargetLabelName);
        l.Company = tabValueForTargetLabelName;
        l.Status = 'Interested';
        if (String.isNotBlank(email)) {
            l.email= email;
        }
        if (String.isNotBlank(tabValueForTargetLabelWebsite)) {
            l.website = tabValueForTargetLabelWebsite;
        }
        if (String.isNotBlank(tabValueForTargetLabelPhone)) {
            l.phone = tabValueForTargetLabelPhone;
        }
        if (String.isNotBlank(tabValueForTargetLabelCity)) {
            l.city = tabValueForTargetLabelCity;
        }
        if (String.isNotBlank(tabValueForTargetLabelState)) {
            l.state = tabValueForTargetLabelState;
        }
        if (String.isNotBlank(tabValueForTargetLabelZip) && tabValueForTargetLabelZip.length() <= 6 ) {
            l.postalcode = tabValueForTargetLabelZip;
        }
        l.OwnerId = '005Kd0000046oLoIAI';
        insert l; 
    }
    else{
        leadId = leadListToCheck[0].id;
    }

    try {
        Database.LeadConvert lc = new Database.LeadConvert();
        if(leadId!=null){
            lc.setLeadId(leadid);
        }
        else{
            lc.setLeadId(l.id);
        }
        
        LeadStatus convertStatus = [SELECT Id, ApiName FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.ApiName);
        
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        system.debug('lcr: '+lcr);
        set<id>OppID= new set<id>();
        Lead convertedLead ;
        if(leadId!=null){
                convertedLead = [SELECT Id, IsConverted,convertedaccountid,convertedcontactid,convertedopportunityid FROM Lead WHERE Id = :leadid];
            
        }
        else{
            convertedLead = [SELECT Id, IsConverted,convertedaccountid,convertedcontactid,convertedopportunityid FROM Lead WHERE Id = :l.id];
        }
        system.debug('ConvertedopportunityId: '+convertedLead.convertedopportunityid);
        if (convertedLead.isConverted) {
            system.debug('runing after conversion');
            // --- Opportunity Mapping ---
            Id opportunityId = lc.getOpportunityId();
            system.debug('opportunityId: '+opportunityId);
            Opportunity opp = [SELECT Id,WhatIsMostImportant__c,MinimumMonthlyRevenue__c,UseofProceeds__c,product__c,CreditScore__c,MainContactEmail__c,MainContactPhone__c,Amount,Owner__c,owner2__c FROM Opportunity WHERE Id =: convertedLead.convertedopportunityid]; 
            opp.WhatIsMostImportant__c = tabValueForTargetLabelMostImportant;
            opp.MainContact__c = convertedLead.convertedcontactid;
            opp.Owner__c = convertedLead.convertedcontactid;
            
            if (tabValueForTargetLabelAmount != '') {  // Changed String.isNotBlank to != ''
                opp.Amount = decimal.valueOf(tabValueForTargetLabelAmount);
            }
            if (tabValueForTargetLabelOwnerCredit1 != '') {  // Changed String.isNotBlank to != ''
                opp.CreditScore__c = decimal.valueOf(tabValueForTargetLabelOwnerCredit1);
            }
            if (tabValueForTargetLabelUseOfProceeds != '') {  // Changed String.isNotBlank to != ''
                opp.UseofProceeds__c = tabValueForTargetLabelUseOfProceeds;
            }
            if (tabValueForTargetLabelRevenue != '') {  // Changed String.isNotBlank to != ''
                opp.MinimumMonthlyRevenue__c = decimal.valueOf(tabValueForTargetLabelRevenue);
            }
            
             // --- Account Mapping ---
            Id accountId = lc.getAccountId();
            Account acc = [SELECT Id,name,DBAName__c,Industry,numberofemployees,FederalTaxID__c,LegalEntity__c,MinimumMonthlyRevenue__c,billingAddress,Description FROM Account WHERE Id = :convertedLead.convertedaccountid]; // Replace 'Industry__c' with your custom field
            
            if (tabValueForTargetLabelDBA != '') {  // Changed String.isNotBlank to != ''
                acc.DBAName__c = tabValueForTargetLabelDBA;
            }
            if (tabValueForTargetLabelCity != '') {  // Changed String.isNotBlank to != ''
                acc.billingcity = tabValueForTargetLabelCity;
            }
            if (tabValueForTargetLabelState != '') {  // Changed String.isNotBlank to != ''
                acc.BillingState = tabValueForTargetLabelState;
            }
            if (tabValueForTargetLabelBusinessAddress != '') {  // Changed String.isNotBlank to != ''
                acc.BillingStreet = tabValueForTargetLabelBusinessAddress;
            }
            if (tabValueForTargetLabelZip != '' && tabValueForTargetLabelZip.length() <= 6) {  // Changed String.isNotBlank to != ''
                acc.BillingPostalCode = tabValueForTargetLabelZip;
            }
            if (tabValueForTargetLabelDescription != '') {  // Changed String.isNotBlank to != ''
                acc.Description = tabValueForTargetLabelDescription;
            }
            if (tabValueForTargetLabelIndustry != '') {  // Changed String.isNotBlank to != ''
                acc.Industry = tabValueForTargetLabelIndustry;
            }
            if (tabValueForTargetLabelTaxId != '') {  // Changed String.isNotBlank to != ''
                acc.FederalTaxID__c = tabValueForTargetLabelTaxId;
            }
            if (tabValueForTargetLabelEntityType != '') {  // Changed String.isNotBlank to != ''
                acc.LegalEntity__c = tabValueForTargetLabelEntityType;
            }
            if (tabValueForTargetLabelRevenue != '') {  // Changed String.isNotBlank to != ''
                acc.annualrevenue = decimal.valueOf(tabValueForTargetLabelRevenue); 
            }
            if (tabValueForTargetLabelAmount != '') {  // Changed String.isNotBlank to != ''
                acc.MinimumMonthlyRevenue__c = decimal.valueOf(tabValueForTargetLabelAmount);
            }
            if (tabValueForTargetLabelWebsite != '') {  // Changed String.isNotBlank to != ''
                acc.website = tabValueForTargetLabelWebsite;
            }
            if (tabValueForTargetLabelPhone != '') {  // Changed String.isNotBlank to != ''
                acc.phone = tabValueForTargetLabelPhone;
            }
            if (tabValueForTargetLabelStartDate != '') {  // Changed String.isNotBlank to != ''
                // acc.FoundingDate__c = tabValueForTargetLabelStartDate;  //Business date
            }
            
            update acc;
            
            // --- primary Contact  ---
            Id contactId = lc.getContactId();
            Contact con = [SELECT Id,SSN__c,Ownership__c,firstname,lastname,CreditScore__c,Department,phone,mailingAddress FROM Contact WHERE Id = :convertedLead.ConvertedContactId]; 
            if (tabValueForTargetLabelSSN1 != '') {
                con.SSN__c = tabValueForTargetLabelSSN1;
            }
            if(tabValueForTargetLabelOwnerName1 != ''){
                if (tabValueForTargetLabelOwnerName1.contains(' ')) {
                    List<String> namePartss = tabValueForTargetLabelOwnerName1.split(' ');
                    con.FirstName = namePartss[0];
                    con.LastName = namePartss[1];
                } else {
                    con.LastName = tabValueForTargetLabelOwnerName1;
                }
            }
            if (tabValueForTargetLabelOwnership1 != '') {
                system.debug ('runing tabValueForTargetLabelOwnership1');
                con.Ownership__c = decimal.valueOf(tabValueForTargetLabelOwnership1);
            }
            if (tabValueForTargetLabelOwnerEmail1 != '') { // Changed null to ''
                con.email = tabValueForTargetLabelOwnerEmail1;
            }
            if (tabValueForTargetLabelOwnerCredit1 != '') { // Changed null to ''
                con.CreditScore__c = decimal.valueOf(tabValueForTargetLabelOwnerCredit1);
            }
            if (tabValueForTargetLabelIndustry != '') { // Changed null to ''
                con.Department = tabValueForTargetLabelIndustry; 
            }
            if (tabValueForTargetLabelOwnerPhone1 != '') { // Changed null to ''
                con.phone = tabValueForTargetLabelOwnerPhone1;
            }
            if (tabValueForTargetLabelOwnerAddress1 != '') { // Changed null to ''
                con.MailingStreet = tabValueForTargetLabelOwnerAddress1;
            }
            if (tabValueForTargetLabelOwnerCity1 != '') { // Changed null to ''
                con.MailingCity = tabValueForTargetLabelOwnerCity1;
            }
            if (tabValueForTargetLabelOwnerState1 != '') { // Changed null to ''
                con.MailingState = tabValueForTargetLabelOwnerState1;
            }
            if (tabValueForTargetLabelOwnerZip1 != '' && tabValueForTargetLabelOwnerZip1.length() <= 6) { // Changed null to ''
                con.MailingPostalCode = tabValueForTargetLabelOwnerZip1;
            }
            
            // Add secondary Contact 
            update con;
            if(tabValueForTargetLabelOwnerName2 != ''){
                contact c = new contact();
                c.AccountId = acc.id;
                
                
                if (tabValueForTargetLabelOwnerName2.contains(' ')) {
                    List<String> namePartss = tabValueForTargetLabelOwnerName2.split(' ');
                    c.FirstName = namePartss[0];
                    c.LastName = namePartss[1];
                } else {
                    c.LastName = tabValueForTargetLabelOwnerName2;
                }
                
                
                if (tabValueForTargetLabelOwnerEmail2 != '') {  // Changed null to ''
                    c.Email = tabValueForTargetLabelOwnerEmail2;
                }
                if (tabValueForTargetLabelOwnerPhone2 != '') {  // Changed null to ''
                    c.Phone = tabValueForTargetLabelOwnerPhone2;
                }
                if (tabValueForTargetLabelOwnership2 != '') {  // Changed null to ''
                    c.Ownership__c = decimal.valueOf(tabValueForTargetLabelOwnership2);
                }
                if (tabValueForTargetLabelSSN2 != '') {  // Changed null to ''
                    c.SSN__c = tabValueForTargetLabelSSN2;
                }
                if (tabValueForTargetLabelOwnerCredit2 != '') {  // Changed null to ''
                    c.CreditScore__c = decimal.valueOf(tabValueForTargetLabelOwnerCredit2);
                }
                if (tabValueForTargetLabelIndustry != '') {  // Changed null to ''
                    c.Department = tabValueForTargetLabelIndustry;
                }
                if (tabValueForTargetLabelOwnerAddress2 != '') {  // Changed null to ''
                    c.MailingStreet = tabValueForTargetLabelOwnerAddress2; 
                }
                if (tabValueForTargetLabelOwnerCity2 != '') {  // Changed null to ''
                    c.MailingCity = tabValueForTargetLabelOwnerCity2; 
                }
                if (tabValueForTargetLabelOwnerState2 != '') {  // Changed null to ''
                    c.MailingState = tabValueForTargetLabelOwnerState2;
                }
                if (tabValueForTargetLabelOwnerZip2 != '' && tabValueForTargetLabelOwnerZip2.length() <= 6) {  // Changed null to ''
                    c.MailingPostalCode = tabValueForTargetLabelOwnerZip2;
                }
                
                insert c;
                if(c.Id!=null){
                    opp.Owner2__c = c.Id;
                }
                
            }
            update opp;
            // --- Attachment and PDF Processing ---
            List<Object> envelopeDocuments = (List<Object>) envelopeSummary.get('envelopeDocuments');
            
            list<ContentVersion>ContentVersionToinsert = new list<ContentVersion>();
            list<ContentDocumentLink>ContentDocumentLinkToInsert = new list<ContentDocumentLink>();
            system.debug('envelopeDocumentsSize: ' + envelopeDocuments.size());
            for (Object docObj : envelopeDocuments) {
                Map<String, Object> document = (Map<String, Object>) docObj;
                String documentId = String.valueOf(document.get('documentId'));
                String pdfBase64 = String.valueOf(document.get('PDFBytes'));
                
                try {
                    if (pdfBase64 != null && pdfBase64 != '') {
                        ContentVersion cv = new ContentVersion();
                        cv.VersionData = EncodingUtil.base64Decode(pdfBase64);
                        cv.Title = 'Document ' + documentId + ' - ' + acc.Name; 
                        cv.PathOnClient = 'Document ' + documentId + ' - ' + acc.Name + '.pdf';
                        ContentVersionToinsert.add(cv);
                    }
                } catch (Exception e) {
                    System.debug('Error saving document ' + documentId + ': ' + e.getMessage());
                }
            }
            system.debug('ContentVersionToinsert: '+ContentVersionToinsert);
            system.debug('ContentDocumentLinkToInsert: '+ContentDocumentLinkToInsert);
            
            insert ContentVersionToinsert;
            
            for (ContentVersion cv : ContentVersionToinsert) {
                ContentDocumentLink cdl = new ContentDocumentLink();
                cdl.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :cv.Id].ContentDocumentId;
                cdl.LinkedEntityId = opp.Id; 
                cdl.ShareType = 'V'; 
                cdl.Visibility = 'AllUsers'; 
                ContentDocumentLinkToInsert.add(cdl);
            }
            insert ContentDocumentLinkToInsert;
        }
    } catch (Exception e) {
        System.debug('Error converting lead: ' + e.getMessage());
    }
    // }
    }

    private static String getTabValue(Map<String, Object> tabs, String targetTabLabel) {
    for (String tabType : tabs.keySet()) { 
        List<Object> tabList = (List<Object>) tabs.get(tabType);
        for (Object tabObj : tabList) {
            Map<String, Object> tab = (Map<String, Object>) tabObj;
            String tabLabel = String.valueOf(tab.get('tabLabel'));
            if (tabLabel == targetTabLabel) {
                return String.valueOf(tab.get('value'));
            }
        }
    }
    return ''; 
    }
    }