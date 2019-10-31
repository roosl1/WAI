package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ReviewDAO {
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
	
	public static List <ReviewVO> getTotal(String productcode)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ReviewVO> total_list = sqlsession1.selectList("getTotal",productcode);
		sqlsession1.close();
		return total_list;
	}
	
	public static List <ReviewVO> reviewAllData()
	{
		System.out.println("리뷰다오옴");
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ReviewVO> reviewList = sqlsession1.selectList("reviewAllData");
		sqlsession1.close();
		System.out.println("사실상끝");
		return reviewList;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	
	public static List <LikeVO> likeAllData(String id)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <LikeVO> likeList = sqlsession1.selectList("likeAllData",id);
		sqlsession1.close();
		return likeList;
	}
	
	/*public static List <QnaboardVO> qnaboardAllData()
	{
		return sqlSessionFactory1.openSession().selectList("qnaboardAllData");
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}*/
	
	public static void insertReview(ReviewVO reviewvo) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("insertReview", reviewvo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static int reviewMaxNum()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		
		int num = 0;
		
		if(sqlsession1.selectOne("reviewMaxNum")!=null)
			num = sqlsession1.selectOne("reviewMaxNum");
		
		sqlsession1.close();
		return num;
	}
	
	public static int reviewNum(String productcode)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      int totalnum = sqlsession1.selectOne("reviewNum",productcode);
	      sqlsession1.close();
	      return totalnum;
	   }
	
	public static List <ReviewVO> reviewPaging1(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ReviewVO> list1= sqlsession1.selectList("reviewPaging1",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static List <ReviewVO> reviewPaging2(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ReviewVO> list1= sqlsession1.selectList("reviewPaging2",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static List <ReviewVO> reviewPaging3(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ReviewVO> list1= sqlsession1.selectList("reviewPaging3",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static List <ReviewVO> reviewPaging4(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ReviewVO> list1= sqlsession1.selectList("reviewPaging4",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static int check(HashMap map)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int result = 0;
		if(sqlsession1.selectOne("check",map)!=null)
			result = sqlsession1.selectOne("check",map);
		
		sqlsession1.close();
		return result;
	}
	
	public static void like_inc(int r_num)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("like_inc", r_num);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void like_insert(String id,int r_num) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		LikeVO likevo = new LikeVO();
		
		likevo.setR_num(r_num);
		likevo.setId1(id);
		likevo.setCheck_like(1);
		sqlsession1.insert("like_insert", likevo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void like_dec(int r_num)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("like_dec", r_num);
		sqlsession1.commit();
	}
	
	public static void dislike_inc(int r_num)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("dislike_inc", r_num);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void dislike_insert(String id,int r_num) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		LikeVO likevo = new LikeVO();
		
		likevo.setR_num(r_num);
		likevo.setId1(id);
		likevo.setCheck_like(-1);
		sqlsession1.insert("dislike_insert", likevo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void dislike_dec(int r_num)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("dislike_dec", r_num);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void like_delete(HashMap map) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("like_delete", map);
		sqlsession1.commit();
		sqlsession1.close();
	}

	public static int like_cnt(int r_num)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	
		int num = 0;
	
		if(sqlsession1.selectOne("count_like",r_num)!=null)
			num = sqlsession1.selectOne("count_like",r_num);
	
		sqlsession1.close();
		return num;
	}
	
	public static int dislike_cnt(int r_num)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	
		int num = 0;
	
		if(sqlsession1.selectOne("count_dislike",r_num)!=null)
			num = sqlsession1.selectOne("count_dislike",r_num);
	
		sqlsession1.close();
		return num;
	}
	
	public static void setZero() {
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("setZero");
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void setCheck(String id1) {
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("setLikeCheck",id1);
		sqlsession1.update("setDislikeCheck",id1);
		sqlsession1.commit();
		sqlsession1.close();
	}

}
