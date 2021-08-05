package com.dept.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dept.dto.DeptDto;

public class DeptDao {
	public List<DeptDto> selectList() {
		// 1. driver 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		// 2. 계정 연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String password = "kh";

		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 3. query 준비
		String sql = " SELECT DEPTNO, DNAME, LOC FROM DEPT ORDER BY DEPTNO ";

		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<DeptDto> list = new ArrayList<DeptDto>();

		try {
			pstm = con.prepareStatement(sql);

			// 4. query 실행 및 리턴
			rs = pstm.executeQuery();
			while (rs.next()) {
				DeptDto dto = new DeptDto();
				dto.setDeptno(rs.getInt(1));
				dto.setDname(rs.getString(2));
				dto.setLoc(rs.getString(3));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// 5. db 종료
				rs.close();
				pstm.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}
}
