package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	

	 	public String hello() {
			
			String aa = "나와라ㅏㅏ";
			
			return aa;
		} 
	
	
	private static SqlSessionFactory sqlSessionFactory1;
	
	static {
		String myxml="/META-INF/mybatis/Mybatis-config.xml"; // Mybatis-config.xml 환경설정 파일을 받아서 
		InputStream istream=null;
		
		try {
			istream=Resources.getResourceAsStream(myxml);  // Mybatis-config.xml을 읽어들임
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		// Mybatis-configuration file(구성파일)을 읽어 SqlSessionFactory 객체가 생성된다. 
		
		sqlSessionFactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	
	public static List <MemberVO> memberAllDate() {
		
		return sqlSessionFactory1.openSession().selectList("memberAllData");
		 //sqlSessionFactory가 query 가동   ->  mapper.xml의 select문을 통해 실행된 결과가 selectList로 전부 출력된다. 
	}
	

	public static MemberVO login(MemberVO vo) {
	
	  return (MemberVO) sqlSessionFactory1.openSession().selectOne("login",vo);
			   
	}

	public static MemberVO chkrnum(MemberVO vo) {
		
		  return (MemberVO) sqlSessionFactory1.openSession().selectOne("chkrnum",vo);
				   
		}
	
	public static int idchk(String id) {
		
		  return sqlSessionFactory1.openSession().selectOne("idchk",id);
				   
		}
	
	public static void signup(MemberVO vo) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("signup", vo);
		sqlsession1.commit();
		sqlsession1.close();
				   
		}
	
	
	public static void update(MemberVO vo) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("update", vo);
		sqlsession1.commit();
		sqlsession1.close();
				   
		}
	
	
	public static int adminset(String id) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("adminset", id);
		sqlsession1.commit();
		sqlsession1.close();
		return 1;
				   
		}	
	
	public static int admindel(String id) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("admindel", id);
		sqlsession1.commit();
		sqlsession1.close();
		return 0;
				   
		}	
	
}
	
	
	
