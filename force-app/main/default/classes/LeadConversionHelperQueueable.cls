public class LeadConversionHelperQueueable implements Queueable {
    private Set<Id> leadIdsToConvert;
    private String schedulableJobId;
    

    // Constructor to pass lead IDs and the schedulable job ID
    public LeadConversionHelperQueueable(Set<Id> leadIdsToConvert, String schedulableJobId) {
        this.leadIdsToConvert = leadIdsToConvert;
        this.schedulableJobId = schedulableJobId;
    }
    
    // Execute method of Queueable Apex
    public void execute(QueueableContext context) {
         
        // Prepare LeadConvert objects for conversion
        List<Database.LeadConvert> leadConversions = new List<Database.LeadConvert>();
        for (Id leadId : leadIdsToConvert) {
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(leadId);
            lc.setConvertedStatus('Closed'); // Adjust based on available statuses
            lc.setDoNotCreateOpportunity(false);
            leadConversions.add(lc);
        }
        
        // Perform lead conversion
        List<Database.LeadConvertResult> conversionResults = Database.convertLead(leadConversions, false);
        
        // Fetch converted Account, Contact, and Opportunity IDs
        List<Account> accountsToUpdate = new List<Account>();
        List<Contact> contactsToUpdate = new List<Contact>();
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        string accIdd = '';
        for (Database.LeadConvertResult result : conversionResults) {
            if (result.isSuccess()) {
                  Lead leadd = [SELECT Id, Email,Website,annual_revenue__c, Owner_1_Credit_Score__c, Owner_1_Phone_Number__c, 
                                   Owner_1_City__c,Owner_2_Name__c,Owner_1_Name__c, Owner_1_State__c, PostalCode, Name, AnnualRevenue, 
                                   DBA_Name__c, City, State, Street, Description, Federal_Tax_Id__c, 
                                   Legal_Entity__c, Owner_2_SSN__c, Owner_2_Ownership__c, Owner_1_SSN__c, 
                                   Owner_1_Ownership__c,Owner_1_Zip__c,Owner_2_Zip__c, Owner_2_Credit_Score__c, Owner_2_Phone_Number__c, 
                                   Owner_2_City__c, Owner_2_State__c,Phone_Number__c,convertedcontactId,convertedaccountid,convertedopportunityid,
                                   Amount_Requested__c, Use_of_Proceeds__c, What_is_most_important_to_you__c ,Owner_1_Email__c,Owner_2_Email__c,Owner_1_Address__c,Owner_2_Address__c
                            FROM Lead WHERE Id= :result.getLeadId()];
                // Query and update converted Account, Contact, and Opportunity (if needed)
                if (result.getAccountId() != null) {
                    Account acc = [SELECT Id, Name,annualrevenue FROM Account WHERE Id = :result.getAccountId()];
                    accIdd = acc.id;
                    acc.annualrevenue = leadd.annual_revenue__c;
                    acc.DBAName__c = leadd.dba_name__c;
                    acc.billingcity = leadd.City;
                    acc.BillingState = leadd.State;
                    acc.BillingStreet = leadd.Street;
                    acc.BillingPostalCode = leadd.PostalCode;
                    acc.Description = leadd.Description;
                    acc.FederalTaxID__c = leadd.Federal_Tax_Id__c;
                    acc.LegalEntity__c = leadd.Legal_Entity__c;
                    acc.MinimumMonthlyRevenue__c = leadd.annual_revenue__c;
                    acc.website = leadd.Website;
                    acc.phone = leadd.Phone_Number__c;
                    acc.ownerId = '005Kd0000046oLoIAI';
                    accountsToUpdate.add(acc);
                }
                
                if (result.getContactId() != null) {
                    Contact con = [SELECT Id, LastName FROM Contact WHERE Id = :result.getContactId()];
                    con.LastName = leadd.Owner_1_Name__c;
                    con.SSN__c = leadd.Owner_1_SSN__c;
                    con.Ownership__c = leadd.Owner_1_Ownership__c;
                    con.email = leadd.Owner_1_Email__c ;
                    con.CreditScore__c = leadd.Owner_1_Credit_Score__c ;
                    con.phone = leadd.Owner_1_Phone_Number__c ; 
                    con.mailingstreet = leadd.Owner_1_Address__c;
                    con.MailingCity = leadd.Owner_1_City__c ;
                    con.MailingState = leadd.Owner_1_State__c ;
                    con.MailingPostalCode = string.valueOf(leadd.Owner_1_Zip__c) ;
                    con.ownerId = '005Kd0000046oLoIAI';
                    contactsToUpdate.add(con) ;
                }
              string  con2id ='';
                if(leadd.Owner_2_Name__c != null){
                   contact con2 = new contact();
                    con2.LastName = Leadd.Owner_2_Name__c;
                    if(accIdd!=''){
                        con2.AccountId = accIdd;
                    }
                    con2.SSN__c = leadd.Owner_2_SSN__c;
                    con2.Ownership__c = leadd.Owner_2_Ownership__c;
                    con2.email = leadd.Owner_2_Email__c ;
                    con2.CreditScore__c = leadd.Owner_2_Credit_Score__c ;
                    con2.phone = leadd.Owner_2_Phone_Number__c ;
                    con2.MailingStreet = leadd.Owner_2_Address__c;
                    con2.MailingCity = leadd.Owner_2_City__c ;
                    con2.MailingState = leadd.Owner_2_State__c ;
                    con2.MailingPostalCode = string.valueOf(leadd.Owner_2_Zip__c);
                    con2.ownerId = '005Kd0000046oLoIAI';
                    insert con2 ;
                    con2id = con2.id;
                }
                
                if (result.getOpportunityId() != null) {
                    Opportunity opp = [SELECT Id, Name FROM Opportunity WHERE Id = :result.getOpportunityId()];
                    opp.WhatIsMostImportant__c = leadd.What_is_most_important_to_you__c;
                    opp.MainContact__c = Leadd.convertedcontactid;
                    opp.Owner__c = Leadd.convertedcontactid;
                    if(con2Id != ''){
                       opp.owner2__c = con2id; 
                     }
                    opp.Amount =   leadd.Amount_Requested__c;
                    opp.CreditScore__c = leadd.Owner_1_Credit_Score__c;
                    opp.UseofProceeds__c = leadd.Use_of_Proceeds__c;
                    opp.MinimumMonthlyRevenue__c = leadd.Annual_Revenue__c;
                    opp.ownerId = '005Kd0000046oLoIAI';
                    opportunitiesToUpdate.add(opp);
                }
            }
        }
        
        // Perform bulk updates
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
        }
        
        if (!opportunitiesToUpdate.isEmpty()) {
            update opportunitiesToUpdate;
        }
        if (schedulableJobId != null) {
            System.enqueueJob(new AbortScheduledJobQueueable(schedulableJobId));
        }
    }
}