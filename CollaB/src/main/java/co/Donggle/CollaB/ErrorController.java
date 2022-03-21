package co.Donggle.CollaB;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ErrorController {
	
	private Logger logger = LoggerFactory.getLogger(ErrorController.class);
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex) {
		
		logger.error(ex.getMessage());
		
		return "errorPage";
	}
}
