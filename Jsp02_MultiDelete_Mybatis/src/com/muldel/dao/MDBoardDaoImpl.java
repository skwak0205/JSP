package com.muldel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.muldel.dto.MDBoardDto;

public class MDBoardDaoImpl extends SqlMapConfig implements MDBoardDao {

	private String namespace = "muldel.mapper.";

	@Override
	public List<MDBoardDto> selectList() {
		List<MDBoardDto> list = new ArrayList<MDBoardDto>();

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "selectList");
		}

		return list;
	}

	@Override
	public MDBoardDto selectOne(int seq) {
		MDBoardDto dto = null;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "selectOne", seq);
		}

		return dto;
	}

	@Override
	public int insert(MDBoardDto dto) {
		int res = 0;

		// DML은 자동으로 commit이 되지 않기 때문에 openSession(boolean autocommit)을 true로 해줌
		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.insert(namespace + "insert", dto);
		}

		return res;
	}

	@Override
	public int update(MDBoardDto dto) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.update(namespace + "update", dto);
		}

		return res;
	}

	@Override
	public int delete(int seq) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.delete(namespace + "delete", seq);
		}

		return res;
	}

	@Override
	public int multiDelete(String[] seqs) {
		int count = 0;

		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", seqs);

		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace + "multiDelete", map);

			if (count == seqs.length) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}

}
