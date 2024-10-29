public class ConsumerRecord {
    public static void sendEmailNotification (List<consumer__c> con){
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (consumer__c c : con) {
            // Check if email field is not null
            if (c.email__c != null) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                
                // Set email properties
                email.setToAddresses(new List<String> { c.email__c });
                email.setSubject('Welcome to our company');
                email.setPlainTextBody(
                    'Dear ' + c.Name + ',\n\n' + 
                    'Welcome to MY RICE! You have been seen as a valuable customer to us. Please continue your journey with us, while we try to provide you with good quality resources.\n\n' + 
                    'We are proud to associate with valuable customers like you and we look forward to collaborating with you by providing more exciting discounts and product offers too.\n\n' + 
                    'So why take a step back? Take a leap of faith and shop with us more, while we provide valuable products and offers.\n\n\n' + 
                    'Thank you for buying with us! Here are some products that customers who bought similar products also enjoyed.\n\n'
                );

                // Add email to list
                emails.add(email);
            }
        }

        // Send all emails in bulk
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}