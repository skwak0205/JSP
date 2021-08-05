package com.my.biz;

import java.util.List;

import com.my.dao.MyBoardDao;
import com.my.dto.MyBoardDto;

public class MyBoardBiz {
	private MyBoardDao dao = new MyBoardDao();

	public List<MyBoardDto> selectList() {
		return dao.selectList();
	}

	public MyBoardDto selectOne(int myno) {
		return dao.selectOne(myno);
	}

	public int insert(MyBoardDto dto) {
		return dao.insert(dto);
	}

	public int update(MyBoardDto dto) {
		return dao.update(dto);
	}

	public int delete(int myno) {
		return dao.delete(myno);
	}
}
