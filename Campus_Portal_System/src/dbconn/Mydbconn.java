package dbconn;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Mydbconn implements ServletContextListener 
{
	Connection con=null;
	@Override
	public void contextInitialized(ServletContextEvent event) 
	{
		// TODO Auto-generated method stub
		
		try
		{
			//using context parameter
			String driverclass=event.getServletContext().getInitParameter("DriverClass");
			String connectionstring =event.getServletContext().getInitParameter("ConnectionString");
			String username=event.getServletContext().getInitParameter("UserName");
			String password=event.getServletContext().getInitParameter("PassWord");
			
			Class.forName(driverclass);
			con=DriverManager.getConnection(connectionstring,username,password);
		}
		catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Sorry class not found....");
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		event.getServletContext().setAttribute("dbconnection",con);
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) 
	{
		// TODO Auto-generated method stub

	}
	
}
