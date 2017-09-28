package com.sinc.project.board.ctrl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sinc.project.board.model.vo.BoardVO;
import com.sinc.project.board.model.vo.ReplyVO;
import com.sinc.project.board.service.BoardService;
import com.sinc.project.board.util.PagingDTO;



@Controller
@RequestMapping("/board")
public class BoardCtrl {

	@Resource(name="boardService")
	private BoardService service;
	
	@RequestMapping("/listPage.sinc")
	public String list(Model model, PagingDTO pagingDTO, String pageNo){
		System.out.println("BoardCtrl list");
		pagingDTO.setPageSize(10); // 한 페이지에 보일 게시글 수
		pagingDTO.setPageNo(1); // 현재 페이지 번호
		if(pageNo != null){
			pagingDTO.setPageNo(Integer.parseInt(pageNo));
		}
		pagingDTO.setBlockSize(10);
		pagingDTO.setTotalCount(service.getCount()); // 게시물 총 개수
		
		List<Object> list = service.listService(pagingDTO) ; 
		
		model.addAttribute("paging", pagingDTO);
		model.addAttribute("list", list); 
		
		return "board/listPage" ;  
	}
	
	@RequestMapping("/register.sinc")
	public String registerForm() {
		System.out.println("BoardCtrl registerFrom");
		
		return "/board/register";
	}
	
	@RequestMapping("/readPage.sinc")
	public String read(BoardVO board, Model model) {
		System.out.println("BoardCtrl read");
		
		model.addAttribute("boardVO", service.readService(board));
		
		return "board/read";
	}
	
	@RequestMapping("/reply.sinc")
	@ResponseBody
	public List<Object> replyInsert(ReplyVO reply) {
		System.out.println("BoardCtrl replyInsert");
		
		List<Object> list = service.replyInsertService(reply);		
		return list;
	}
}
