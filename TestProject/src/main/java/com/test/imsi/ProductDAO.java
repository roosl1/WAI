package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ProductDAO {
	
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
	
	public static List <ProductVO> productAllData()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ProductVO> list1 = sqlsession1.selectList("productAllData");
		sqlsession1.close();
		return list1;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	
	public static ProductVO productViewData(String productcode)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		ProductVO pvo = sqlsession1.selectOne("productViewData",productcode);
		sqlsession1.close();
		return pvo;
	}
	
	public static int productNum()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = sqlsession1.selectOne("productdNum");
		sqlsession1.close();
		return totalnum;
	}
	
	public static List <ProductVO> productPaging(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ProductVO> list1= sqlsession1.selectList("productPaing",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static void productInsert(ProductVO pvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("productInsert",pvo);
		System.out.println("ㄱㄱ");
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void productUpdate(ProductVO pvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("productUpdate",pvo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void productDelete(String productcode)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.delete("productDelete",productcode);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static int productMaxNum()
	{
		System.out.println("사이즈 계산중");
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		System.out.println("왜 안나옴?");
		
		int num = 0;
		
		if(sqlsession1.selectOne("productMaxNum")!=null)
			num = sqlsession1.selectOne("productMaxNum");
		
		System.out.println("어이가없네");
		sqlsession1.close();
		return num;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	public static List <ProductVO> productSameData(String productsubject)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <ProductVO> list1 = sqlsession1.selectList("productSameData",productsubject);
	      sqlsession1.close();
	      return list1;
	      //여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
	      //전체 추출된 결과가 selectList()로 전부 보이게
	   }
	
	public static List <ProductVO> mainProductList(String categori)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <ProductVO> list1 = sqlsession1.selectList("mainProductList",categori);
	      sqlsession1.close();
	      return list1;
	     
	   }
	public static String productMapping(ProductVO pvo)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      String productcode = sqlsession1.selectOne("productMapping",pvo);
	      sqlsession1.close();
	      return productcode;
	   }
	
	
}
