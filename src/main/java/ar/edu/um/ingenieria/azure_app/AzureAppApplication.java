package ar.edu.um.ingenieria.azure_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.microsoft.applicationinsights.attach.ApplicationInsights;
import com.microsoft.applicationinsights.connectionstring.ConnectionString;

@SpringBootApplication
public class AzureAppApplication {

	public static void main(String[] args) {
		ApplicationInsights.attach();
		ConnectionString.configure("InstrumentationKey=<Your Instrumentation Key>");
		SpringApplication.run(AzureAppApplication.class, args);
	}

}
