import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

public class GetTableID {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@603-4:1521:orcl";
	public static final String USERNAME = "jjm";
	public static final String PASSWORD = "jjm";
	public static int getIdk() {
		Connection conn = null;
		CallableStatement cstate = null;//专门用于调用存储过程和函数的操作接口
		int result_ = 0;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			//调用存储过程
			String sql = "{? = call getidk}";
			cstate = conn.prepareCall(sql);
			cstate.registerOutParameter(1, java.sql.Types.INTEGER);//定义返回值的类型
			cstate.execute();//执行
			result_ = cstate.getInt(1);//取得返回值
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				cstate.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result_;
	}
}
