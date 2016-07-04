1. http://localhost:8080/WebReparo/index.jsp

2. When you encounter the following error，please restart Tomcat.
org.hyperic.sigar.SigarException: Native Library D:\Tomcat 7.0\webapps\WebReparo\WEB-INF\lib\sigar-x86-winnt.dll already loaded in another classloader
	at org.hyperic.sigar.Sigar.loadLibrary(Sigar.java:172)
	at org.hyperic.sigar.Sigar.<clinit>(Sigar.java:100)
	at org.hyperic.sigar.OperatingSystem.getInstance(OperatingSystem.java:89)
	at com.tn.service.MonitorService.getMonitorInfo(MonitorService.java:23)
	at com.tn.servlet.MonitorTnfoServlet.doPost(MonitorTnfoServlet.java:36)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:641)