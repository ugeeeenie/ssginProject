package com.sinc.bootstrap.model.sql;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sinc.bootstrap.model.vo.BootVO;
import com.sinc.bootstrap.model.vo.ImgVO;

@Repository("bootDao")
public class BootDaoImpl implements BootDao{

	@Resource(name="sqlSession")
	private SqlSession session;
	
	@Override
	public BootVO ajaxRow(BootVO boot) {
		System.out.println("Dao ajaxRow");
		
		return new BootVO("jslim", "jslim", "jslim");
	}

	@Override
	public List<ImgVO> imgRow() {
		System.out.println("Dao imgRow");
		return session.selectList("com.sinc.bootstrap.mapper.img.select");
	}

}
