rem compile java files
javac -encoding UTF-8 -d WebContent\WEB-INF\classes -cp C:\pleiades\tomcat\9\lib\* ^
src\serverend\WSServlet.java ^
src\serverend\GetMessage.java ^
src\serverend\SendMessage.java

rem start Apache Tomcat
C:\pleiades\tomcat\9\bin\startup.bat