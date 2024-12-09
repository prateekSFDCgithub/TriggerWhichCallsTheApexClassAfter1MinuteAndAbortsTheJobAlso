trigger LeadTriggerDoc on Lead (after update, after insert) {
    // Set of lead IDs to process
    Set<Id> leadIdsToConvert = new Set<Id>();

    if (Trigger.isInsert) {
        // For after insert: Process newly inserted leads
        for (Lead l : Trigger.new) {
            if (l.docusign_status__c == 'Docusign Completed') {
                leadIdsToConvert.add(l.Id);
            }
        }
    } else if (Trigger.isUpdate) {
        // For after update: Compare new and old values
        for (Lead l : Trigger.new) {
            Lead oldLead = Trigger.oldMap.get(l.Id);
            if (l.docusign_status__c == 'Docusign Completed' && oldLead.docusign_status__c != 'Docusign Completed') {
                leadIdsToConvert.add(l.Id);
            }
        }
    }

    if (!leadIdsToConvert.isEmpty()) {
        // Schedule a job to execute the queueable class after 1 minute
        System.schedule(
            'LeadConversionHelperQueueable_' + System.currentTimeMillis(), // Unique job name
            System.now().addMinutes(1).format('s m H d M ? yyyy'), // Cron expression for 1 minute delay
            new LeadConversionScheduler(leadIdsToConvert)
        );
    }
}