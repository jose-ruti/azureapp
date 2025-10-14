package ar.edu.um.ingenieria.azure_app.service;

import java.util.Optional;




public class AzureInsightService {
    public static String getConnectionString() {
        String correct = System.getenv("APPLICATION_INSIGHTS_CONNECTION_STRING");
        if (Optional.ofNullable(correct).isPresent()) {
            return correct;
        }
        return "";
    }
    
}
