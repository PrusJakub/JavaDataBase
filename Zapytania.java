package testBazy;

public class Zapytania {

	public static String selectAll() {
		return "select * from ";
	}

	public static String insert() {
		return "insert into Silnik  values (51234, 2.0 ,140 ,260)";
	}

	public String insertIntoModel(String nadwozie1, String nazwaModelu, String kolor, String Rok, String NrSilnika,
			String NazwaMarki) {
		String a = "insert into Model values ('";
		a = a + nadwozie1;
		a += "' , '";
		a += nazwaModelu;
		a += "', '";
		a += kolor;
		a += "' , '";
		a += Rok;
		a += "' , '";
		a += NrSilnika;
		a += "' , '";
		a += NazwaMarki;
		a += "')";
		return a;
	}

	public String insertIntoMarka(String krajpochodzenia, String nazwamarki) {
		String a = "insert into Marka values ('";
		a += krajpochodzenia;
		a += "' , '";
		a += nazwamarki;
		a += "')";
		return a;
	}

	public String insertIntoRocznik(String rok) {
		String a = "insert into Rocznik values ('";
		a += rok;
		a += "')";
		return a;
	}

	public String insertIntoSilnik(String nrsilnika, String pojemnosc, String moc, String moment) {
		String a = "insert into Silnik values ('";
		a += nrsilnika;
		a += "' , '";
		a += pojemnosc;
		a += "' , '";
		a += moc;
		a += "' , '";
		a += moment;
		a += "')";
		return a;
	}
}
