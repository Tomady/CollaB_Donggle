package co.Donggle.CollaB;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ErrorController {
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex) {
		
		return "errorPage";
	}
}
