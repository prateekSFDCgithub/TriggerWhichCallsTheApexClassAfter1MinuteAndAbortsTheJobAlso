public class AbortScheduledJobQueueable implements Queueable {
    private String schedulableJobId;

    public AbortScheduledJobQueueable(String schedulableJobId) {
        this.schedulableJobId = schedulableJobId;
    }

    public void execute(QueueableContext context) {
        if (schedulableJobId != null) {
            System.abortJob(schedulableJobId);
            System.debug('Aborted scheduled job with ID: ' + schedulableJobId);
        }
    }
}