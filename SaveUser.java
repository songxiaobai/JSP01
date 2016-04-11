import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SaveUser {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@603-4:1521:orcl";
	public static final String USERNAME = "jjm";
	public static final String PASSWORD = "jjm";
	public static int saveuser(String userName,String userImg) {
		Connection conn = null;
		PreparedStatement pstate = null;
		int flag = -1;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			String sql = "insert into USERT_INFO(USER_ID,USER_NAME,USER_IMG) values(?,?,?)";
			pstate = conn.prepareStatement(sql);
			pstate.setInt(1,GetTableID.getIdk());
			pstate.setString(2,userName);
			pstate.setString(3,userImg);
			pstate.execute();
			flag = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				pstate.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return flag;
	}
}
