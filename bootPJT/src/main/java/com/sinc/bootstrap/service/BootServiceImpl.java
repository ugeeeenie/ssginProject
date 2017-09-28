package com.sinc.bootstrap.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sinc.bootstrap.model.sql.BootDao;
import com.sinc.bootstrap.model.sql.BootDaoImpl;
import com.sinc.bootstrap.model.vo.BootVO;
import com.sinc.bootstrap.model.vo.ImgVO;

@Service("bootService")	//변수의 객체를 지정하는 것도 가능
public class BootServiceImpl implements BootService{
	@Resource(name="bootDao")
	private BootDao dao;
	
	@Override
	public List<BootVO> tabService() {
		System.out.println("Service tabService");
		List<BootVO> list=new ArrayList<BootVO>();
		list.add(new BootVO("admin", "admin", "관리자"));
		list.add(new BootVO("jslim", "jslim", "섭섭해"));
		list.add(new BootVO("hjkim", "sinc", "신세계아이앤씨"));
		
		return list;
	}

	@Override
	public BootVO ajaxService(BootVO boot) {
		// TODO Auto-generated method stub
		System.out.println("Service ajaxService");
		
	
		return dao.ajaxRow(boot);
	}

	@Override
	public Map<String, List> imgService() {
		Map<String, List> map=new HashMap<String, List>();
		map.put("row01", dao.imgRow());
		map.put("row02", dao.imgRow());
		
		return map;
	}

	
}
