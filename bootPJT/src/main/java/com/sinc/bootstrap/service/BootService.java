package com.sinc.bootstrap.service;

import java.util.List;
import java.util.Map;

import com.sinc.bootstrap.model.vo.BootVO;
import com.sinc.bootstrap.model.vo.ImgVO;

public interface BootService {
	public List<BootVO> tabService();
	public BootVO 	      ajaxService(BootVO boot);
	public Map<String, List> imgService();
}
