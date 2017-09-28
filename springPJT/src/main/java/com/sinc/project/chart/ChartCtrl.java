package com.sinc.project.chart;

import java.util.ArrayList;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/charts")
public class ChartCtrl {

	@RequestMapping("/chartjs.sinc")
	public String line(Model model) {
		System.out.println();
		
		ArrayList<Integer> ary01 = new ArrayList<Integer>();
		ArrayList<Integer> ary02 = new ArrayList<Integer>();
		
		ary01.add(80);
		ary01.add(90);
		ary01.add(100);
		ary01.add(110);
		ary01.add(120);
		ary01.add(130);
		ary01.add(140);
		
		ary02.add(140);
		ary02.add(130);
		ary02.add(120);
		ary02.add(110);
		ary02.add(100);
		ary02.add(90);
		ary02.add(80);
		
		JSONArray jAry01 = new JSONArray(ary01);
		JSONArray jAry02 = new JSONArray(ary02);
		
		model.addAttribute("data01", jAry01.toString());
		model.addAttribute("data02", jAry02.toString());
		
		return "charts/chart";
	}
}
