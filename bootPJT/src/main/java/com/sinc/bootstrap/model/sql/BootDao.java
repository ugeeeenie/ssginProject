package com.sinc.bootstrap.model.sql;

import java.util.List;

import com.sinc.bootstrap.model.vo.BootVO;
import com.sinc.bootstrap.model.vo.ImgVO;

public interface BootDao {
	public BootVO ajaxRow(BootVO boot);
	public List<ImgVO> imgRow();
}
