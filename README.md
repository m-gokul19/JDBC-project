package jdbcproj;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.Statement;

public class sqlproject {
	
	public static void main(String []args) {
		try {
			String url="jdbc:mysql://localhost:3306/gl";
			String username="root";
			String password="gokul2001";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect=DriverManager.getConnection(url,username,password);
			System.out.println("connection established");
			
			String query="create table employee(id int primary key,name varchar(50),Email_id varchar(50),phone_number varchar(20))";
			String query1="insert into employee(id,name,email_id,phone_number) values(1,'gokul','gokul587','1235878468'),(2,'madan','madan234','9878795621'),(3,'hsmit','hsmit45','2589163145'),(4,'yuzbil','yuzbil112','6352412053'),(5,'kancit','kanchit88','4156908725')";
			
			String query2="alter table employee modify column email_id varchar(30) not null";
			
			String query3="insert into employee values(6,'rofert','rofert144','7485969872'),(7,'popet','popre78','1254879678')";
			
			String query4="update employee SET Name = 'Karthik', Phone_Number = '1234567890'"
					+ "WHERE Id = 3;";
			
			String query5="delete from employee where id in(3,4)";
			
			String query6="delete from employee";
			
			Statement st=connect.createStatement();
			
			st.execute(query);
			st.execute(query1);
			st.execute(query2);
			st.execute(query3);
			st.execute(query4);
			st.execute(query5);
			st.execute(query6);
			
			st.close();
			connect.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
