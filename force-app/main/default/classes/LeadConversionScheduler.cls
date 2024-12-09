public class LeadConversionScheduler implements Schedulable {
    private Set<Id> leadIdsToConvert;

    // Constructor to pass lead IDs
    public LeadConversionScheduler(Set<Id> leadIdsToConvert) {
        this.leadIdsToConvert = leadIdsToConvert;
    }

    // Execute method of the Schedulable class
    public void execute(SchedulableContext context) {
        // Pass the scheduled job ID to the queueable class
        System.enqueueJob(new LeadConversionHelperQueueable(leadIdsToConvert, context.getTriggerId()));
    }
}