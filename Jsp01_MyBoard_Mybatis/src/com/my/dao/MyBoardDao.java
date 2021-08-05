package com.my.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.my.dto.MyBoardDto;

public class MyBoardDao extends SqlMapConfig {

	private String namespace = "com.my.mapper.";

	public List<MyBoardDto> selectList() {
		// SqlSession : mapper의 query문을 실행해 결과를 받아줌
		SqlSession session = getSqlSessionFactory().openSession();
		List<MyBoardDto> list = session.selectList("com.my.mapper.selectList");
		session.close();

		return list;
	}

	public MyBoardDto selectOne(int myno) {
		SqlSession session = null;
		MyBoardDto dto = null;

		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "selectOne", myno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}

	public int insert(MyBoardDto dto) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.insert(namespace + "insert", dto);
		}

		return res;
	}

	public int update(MyBoardDto dto) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.update(namespace + "update", dto);
		}

		return res;
	}

	public int delete(int myno) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.delete(namespace + "delete", myno);
		}

		return res;
	}

}
