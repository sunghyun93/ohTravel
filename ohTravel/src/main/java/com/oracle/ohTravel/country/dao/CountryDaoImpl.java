package com.oracle.ohTravel.country.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CountryDaoImpl implements CountryDao {
	@Autowired
	private SqlSession session;
	
	private String namespace = "";
}
