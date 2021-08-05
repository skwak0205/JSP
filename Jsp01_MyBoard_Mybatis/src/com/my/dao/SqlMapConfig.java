package com.my.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// JDBCTemplate 역할
public class SqlMapConfig {

	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {

		String resource = "com/my/db/config.xml";

		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);

			// config.xml 파일을 읽어옴
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

			inputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sqlSessionFactory;
	}
}
