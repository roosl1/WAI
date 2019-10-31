package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAO {

	private static SqlSessionFactory sqlSessionFactory1;
	static 
	{
		String myxml = "/META-INF/mybatis/Mybatis-config.xml";
		InputStream istream=null;
		
		try {
			istream = Resources.getResourceAsStream(myxml);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//마이바티스 configuration file(구성파일)을 읽어
		//SqlSessionFactory객체가 생성된다
		sqlSessionFactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	
	public static List <BoardVO> boardAllData()
	{
		return sqlSessionFactory1.openSession().selectList("boardAllData");
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	
/*	public static EmployeeVO employeeSearchData(int employee_id)
	{
		return (EmployeeVO) sqlSessionFactory1.openSession().selectOne("employeeSearchData",employee_id);
	}
	
	public static EmployeeVO employeeDetailData(EmployeeVO vo1)
	{
		return (EmployeeVO) sqlSessionFactory1.openSession().selectOne("employeeDetailData",vo1);
	}*/
	
//	public static EmployeeVO employeeDetailData(int employee_id,String last_name)
//	{
//		HashMap hm1 = new HashMap();
//		hm1.put("employee_id", employee_id);
//		hm1.put("last_name", last_name);
//		return (EmployeeVO) sqlSessionFactory1.openSession().selectOne("employeeDetailData",hm1)
//	}
	
//	
//	public static int employeeInsertData(EmployeeVO employeeVO)
//	{
//		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
//		sqlsession1.insert("employeeInsertData",employeeVO);
//		sqlsession1.commit();
//		
////		return sqlsession1.insert("employeeInsertData",employeeVO);
//		return 1;
//		
////		HashMap hm1 = new HashMap();
////		hm1.put("employee_id", employee_id);
////		hm1.put("first_name", first_name);
////		hm1.put("last_name", last_name);
////		hm1.put("email", email);
////		hm1.put("phone_number", phone_number);
////		hm1.put("hire_date", hire_date);
////		hm1.put("salary", salary);
////		hm1.put("job_id", value);
//		
////		sqlSessionFactory1.openSession().selectOne("employeeInsertData",hm1);
//	}
//	
//	public static int employeeUpdateData(EmployeeVO employeeVO)
//	{
//		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
//		sqlsession1.update("employeeUpdateData",employeeVO);
//		sqlsession1.commit();	
//		
//		return 1;
//	}
//	
//	public static int employeeDeleteData(int employee_id)
//	{
//		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
//		sqlsession1.delete("employeeDeleteData",employee_id);
//		sqlsession1.commit();	
//		
//		return 1;
//	}
	
	
}
