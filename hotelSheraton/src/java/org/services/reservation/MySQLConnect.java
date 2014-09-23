/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.services.reservation;
import java.sql.*;
/**
 *
 * @author santu
 */
public class MySQLConnect {

        private Connection connection;
        private Statement stmt;
        private ResultSet rs;


        public MySQLConnect(String host,String dbname,String username,String password)
        {
			String url="jdbc:mysql://"+host+":3306/"+dbname;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				this.connection=DriverManager.getConnection(url,username,password);
				System.out.print("Connected\n");
			}
			catch(Exception e)
			{
			    System.out.println("In OracleConnect:OracleConnect - " + e);
			}
        }

        public int updateDB(String query)
        {
                int result = 0;
                try
                {
                        stmt=this.connection.createStatement();
                        result=this.stmt.executeUpdate(query);
                }
                catch (Exception e)
                {
                        result=-1;
                        System.out.println("In OracleConnect:updateDB - " + e);
                }
                return result;
        }

        public ResultSet searchDB(String query)
        {

                try
                {
                        stmt=connection.createStatement();
                        rs=stmt.executeQuery(query);
                }
                catch (Exception e)
                {

                        System.out.println("In OracleConnect:searchDB - " + e);
                }
                return rs;
        }
        public int executeProcedure(String prcedureName,int branch_id,int roomId,int customerId,String check_in_date,String check_out_date,double advance)
        {
                int result=0;
                try
                {
                        stmt=connection.createStatement();
                        CallableStatement cs = connection.prepareCall(prcedureName);
                        cs.registerOutParameter(1,java.sql.Types.INTEGER);
                        cs.setInt(2,  branch_id);
                        cs.setInt(3, roomId);
                        cs.setInt(4, customerId);
                        cs.setDate(5,Date.valueOf(check_in_date));
                        cs.setDate(6,Date.valueOf(check_out_date));
                        cs.setDouble(7, advance);
                        
                        cs.execute();
                        result=cs.getInt(1);
                }
                catch (Exception e)
                {

                        System.out.println("In Execute procedure - " + e);
                        return result;
                }
                return result;
        }



        public void close()
        {
                try
                {
                        connection.close();
                        System.out.println("Disconnected");
                }
                catch(Exception e)
                {
                        System.out.println("In OracleConnect:close - " + e);
                }

        }


}





