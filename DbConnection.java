package testBazy;

import java.sql.*;

public class DbConnection {

	static Zapytania o = new Zapytania();
	static String showSilnik = "selectResult2.getString(\"NrSilnika\") + \" \" + selectResult2.getString(\"Pojemnosc\") + \" \" + selectResult2.getString(\"Moc\")\r\n"
			+ "+ \" \" + selectResult2.getString(\"MomentObrotowy\")";

	public static void main(String[] args) {

		try {
			Connection myConn = DriverManager.getConnection(
					"jdbc:sqlserver://localhost;databaseName=BazaDanychJava;integratedSecurity=true;\r\n" + "");


			Statement st = myConn.createStatement();
			st.executeUpdate(o.insertIntoMarka("Francja", "Citroen"));
			st.executeUpdate(o.insertIntoMarka("Niemcy", "Opel"));
			st.executeUpdate(o.insertIntoMarka("Polska", "Polonez"));
			st.executeUpdate(o.insertIntoModel("sedan", "508", "czarny", "2008", "32131", "Peugeot"));
			System.out.println("Insert completed");
			ResultSet rs = st.executeQuery("select NazwaModelu, NazwaMarki, Pojemnosc from Model, Silnik where model.NrSilnika = Silnik.NrSilnika");
			while(rs.next()) {
				System.out.println(rs.getString("NazwaMarki") + " " + rs.getString("NazwaModelu") + " " + rs.getString("Pojemnosc"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
