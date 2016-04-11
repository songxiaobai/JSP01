import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FIleNameAuto {
	private String ip;

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public FIleNameAuto(String ip) {
		super();
		this.ip = ip;
	}

	public FIleNameAuto() {
		super();
	}
	public String getFileName(){
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String fileName = df.format(date);
		return fileName;
		
	}
	
}
