package com.tn.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tn.domain.MonitorInfoBean;
import com.tn.service.MonitorService;

public class MonitorTnfoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//MonitorService monitorService =new MonitorService();
		//MonitorInfoBean monitorInfoBean=monitorService.getMonitorInfo();
		//System.out.println(monitorInfoBean);
		//resp.sendRedirect("/WEB-INF/MonitorTnfo.jsp");
		//request.setAttribute("cpuRatio", monitorInfoBean.getCpuRatio());
		//request.setAttribute("memoryRatio", monitorInfoBean.getUsedMemoryRatio());
		//PrintWriter out = response.getWriter();
		//out.println(monitorInfoBean.getCpuRatio());
		request.getRequestDispatcher("/WEB-INF/MonitorTnfo.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MonitorService monitorService =new MonitorService();
		MonitorInfoBean monitorInfoBean=monitorService.getMonitorInfo();
		System.out.println(monitorInfoBean);
		//resp.sendRedirect("/WEB-INF/MonitorTnfo.jsp");
		PrintWriter out = response.getWriter();
		
		out.println(String.format("%.2f", monitorInfoBean.getCpuRatio())+"||"+String.format("%.2f", monitorInfoBean.getUsedMemoryRatio()));
	}

}
