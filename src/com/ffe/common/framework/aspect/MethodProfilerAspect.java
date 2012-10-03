package com.ffe.common.framework.aspect;



import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;


public class MethodProfilerAspect {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());
	
	public Object profile(ProceedingJoinPoint call) throws Throwable {
		logger.debug("Entering method: {}",call.getSignature());
		StopWatch clock = new StopWatch("Profiling "
				+ call.getSignature());
		try {
			clock.start(call.toShortString());
			return call.proceed();
		} finally {
			clock.stop();
			logger.debug("Method execution time: {}",clock.shortSummary());
			logger.debug("Exiting method: {}",call.getSignature());
		}
	}

}
