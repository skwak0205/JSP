package com.muldel.dao;

import static com.muldel.db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muldel.dto.MDBoardDto;

public class MDBoardDaoImpl implements MDBoardDao {

	@Override
	public List<MDBoardDto> selectList() {
		Connection con = getConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MDBoardDto> list = new ArrayList<MDBoardDto>();

		try {
			pstm = con.prepareStatement(SELECT_LIST_SQL);

			rs = pstm.executeQuery();
			while (rs.next()) {
				MDBoardDto dto = new MDBoardDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getDate(5));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return list;
	}

	@Override
	public MDBoardDto selectOne(int seq) {
		Connection con = getConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;
		MDBoardDto dto = null;

		try {
			pstm = con.prepareStatement(SELECT_ONE_SQL);
			pstm.setInt(1, seq);

			rs = pstm.executeQuery();
			while (rs.next()) {
				dto = new MDBoardDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return dto;
	}

	@Override
	public int insert(MDBoardDto dto) {
		Connection con = getConnection();

		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(INSERT_SQL);
			pstm.setString(1, dto.getWriter());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());

			res = pstm.executeUpdate();
			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}

	@Override
	public int update(MDBoardDto dto) {
		Connection con = getConnection();

		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(UPDATE_SQL);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());

			res = pstm.executeUpdate();
			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}

	@Override
	public int delete(int seq) {
		Connection con = getConnection();

		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(DELETE_SQL);
			pstm.setInt(1, seq);

			res = pstm.executeUpdate();
			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}

	@Override
	public int multiDelete(String[] seqs) {
		Connection con = getConnection();

		PreparedStatement pstm = null;
		int res = 0;
		int[] cnt = null;

		try {
			pstm = con.prepareStatement(DELETE_SQL);

			for (int i = 0; i < seqs.length; i++) {
				pstm.setString(1, seqs[i]);

				// 메모리에 SQL문을 적재 후, executeBatch() 메소드가 호출되면 한 번에 실행!
				pstm.addBatch();
				System.out.println("삭제할 번호 : " + seqs[i]);
			}

			// 메모리에 저장된 SQL문을 한번에 실행!
			// 리턴 : int[]
			// 성공 : -2 / 실패 : -3
			cnt = pstm.executeBatch();

			for (int i = 0; i < cnt.length; i++) {
				if (cnt[i] == -2) {
					// 성공인 갯수 카운트
					res++;
				}
			}

			if (seqs.length == res) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}

}
