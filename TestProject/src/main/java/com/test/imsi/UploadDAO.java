package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UploadDAO {

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
		//���̹�Ƽ�� configuration file(��������)�� �о�
		//SqlSessionFactory��ü�� �����ȴ�
		sqlSessionFactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	
	public static int uploadMaxNum()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int num = 0;
		
		if(sqlsession1.selectOne("uploadMaxNum")!=null)
			num = sqlsession1.selectOne("uploadMaxNum");

		sqlsession1.close();
		return num;
		//���⼭ sqlSessionFactory�� query ���� --> mapper.xml�� select�� ����
		//��ü ����� ����� selectList()�� ���� ���̰�
	}
	
	public static void uploadInsert(UploadVO uvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("uploadInsert",uvo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static List <UploadVO> uploadData(String productcode)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <UploadVO> list1 = sqlsession1.selectList("uploadData",productcode);
		sqlsession1.close();
		return list1;
	}
	
}
