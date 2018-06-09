package com.kh.farm.visit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.farm.visit.model.dao.VisitDao;
/*@Controller*/
public class VisitSessionListener implements HttpSessionListener{
	/*@Autowired
	private VisitDao visitDao;*/
	@Override
	public void sessionCreated(HttpSessionEvent sessionv) {
		VisitDao visitDao = new VisitDao();
		if(sessionv.getSession().isNew()) {
			int result = visitDao.visitCount();
			System.out.println(result);
			int todayCount = visitDao.getTodayCount();
			int totalCount = visitDao.getTotalCount();
			HttpSession session =sessionv.getSession();
			
			session.setAttribute("totalCount", totalCount);
			session.setAttribute("todayCount", todayCount);
		}
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	
	
}
