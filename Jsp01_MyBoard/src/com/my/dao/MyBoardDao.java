package com.my.dao;

import static com.my.db.JDBCTemplate.close;
import static com.my.db.JDBCTemplate.commit;
import static com.my.db.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.my.dto.MyBoardDto;

public class MyBoardDao {
	public List<MyBoardDto> selectList() {
		Connection con = getConnection();

		String sql = " SELECT MYNO, MYNAME, MYTITLE, MYCONTENT, MYDATE FROM MYBOARD ORDER BY MYNO DESC ";

		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MyBoardDto> list = new ArrayList<MyBoardDto>();

		try {
			pstm = con.prepareStatement(sql);

			rs = pstm.executeQuery();
			while (rs.next()) {
				MyBoardDto dto = new MyBoardDto(rs.getInt("MYNO"), rs.getString("MYNAME"), rs.getString("MYTITLE"),
						rs.getString("MYCONTENT"), rs.getDate("MYDATE"));
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

	public MyBoardDto selectOne(int myno) {
		Connection con = getConnection();

		String sql = " SELECT MYNO, MYNAME, MYTITLE, MYCONTENT, MYDATE FROM MYBOARD WHERE MYNO = ? ";

		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyBoardDto dto = null;

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);

			rs = pstm.executeQuery();
			while (rs.next()) {
				dto = new MyBoardDto(rs.getInt("MYNO"), rs.getString("MYNAME"), rs.getString("MYTITLE"),
						rs.getString("MYCONTENT"), rs.getDate("MYDATE"));
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

	public int insert(MyBoardDto dto) {
		Connection con = getConnection();

		String sql = " INSERT INTO MYBOARD VALUES(MYBOARDSEQ.NEXTVAL, ?, ?, ?, SYSDATE) ";

		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyname());
			pstm.setString(2, dto.getMytitle());
			pstm.setString(3, dto.getMycontent());

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

	public int update(MyBoardDto dto) {
		Connection con = getConnection();

		String sql = " UPDATE MYBOARD SET MYTITLE = ?, MYCONTENT = ? WHERE MYNO = ? ";

		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMytitle());
			pstm.setString(2, dto.getMycontent());
			pstm.setInt(3, dto.getMyno());

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

	public int delete(int myno) {
		Connection con = getConnection();

		String sql = " DELETE FROM MYBOARD WHERE MYNO = ? ";

		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);

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

}
