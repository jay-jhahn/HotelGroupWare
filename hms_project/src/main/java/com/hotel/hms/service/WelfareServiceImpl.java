package com.hotel.hms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.WelfareDAO;

import com.hotel.hms.vo.PagingVO;
import com.hotel.hms.vo.WelfareVO;

@Service
public class WelfareServiceImpl implements WelfareService {

	@Autowired
	WelfareDAO dao;
	
	// 쿠폰 리액트 화면 보여줄때 넘길 직원 정보 - 박상원
	@Override
	public void empDetail(HttpServletRequest req, Model model) {
		// 세션 사번 가져오기
		String empCode = (String) req.getSession().getAttribute("empCode");
		EmployeeVO vo = dao.empDetail(empCode);
		model.addAttribute("vo", vo);
	}
	
	
	// 마이쿠폰 목록 보기 - 박상원
	@Override
	public void myCuponList(HttpServletRequest req, Model model) {
		// 세션 사번 가저요기
		String empCode = (String) req.getSession().getAttribute("empCode");
		List<WelfareVO> list = dao.myCuponList(empCode);
		model.addAttribute("list", list);
	}

	// 복지쿠폰 목록 조회 - 박상원
	@Override
	public void welfareCuponList(HttpServletRequest req, Model model) {
		// 페이징
		String pageNum = req.getParameter("pageNum"); // 페이지 번호
		if(pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}
		PagingVO page = new PagingVO();		// 페이지 클래스 객체 생성
		page.setPageSize(10);		// 한 페이지당 출력할 글 개수
		page.setPageBlock(3);		// 한 블럭당 페이지 개수
		page.setPageNum(pageNum);	// 페이지 번호
		
		// 1. 카테고리에 따른 상품 개수 구하기
		page.setCnt(dao.welfareCuponCount());	// 쿠폰개수
		int cnt = page.getCnt();
		
		if (cnt > 0) {
			// 복지쿠폰 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStart());
			map.put("end", page.getEnd());
			List<WelfareVO> list = dao.welfareCuponList(map);
			
			model.addAttribute("list", list);
			model.addAttribute("startPage", page.getStartPage());		// 시작 페이지
			model.addAttribute("endPage", page.getEndPage());			// 마지막 페이지
			model.addAttribute("pageBlock", page.getPageBlock());		// 한 블럭당 페이지 개수
			model.addAttribute("pageCount", page.getPageCount());		// 페이지 개수
			model.addAttribute("currentPage", page.getCurrentPage());	// 현재 페이지
		}
		model.addAttribute("pageNum", pageNum);			// 페이지 번호
		model.addAttribute("cnt", cnt);					// 글개수
		model.addAttribute("number", page.getNumber());	// 출력용 글번호
	}

	// 복지쿠폰 입력 - 박상원
	@Override
	public void welfareCuponInsert(HttpServletRequest req) {
		// 값 가져오기
		String prodName = req.getParameter("prodName");
		int realPrice = Integer.parseInt(req.getParameter("realPrice"));
		int dcRate = Integer.parseInt(req.getParameter("dcRate"));
		int dcPrice = realPrice * ((100-dcRate)/100);
		System.out.println("dbPrice >> " + dcPrice);
		
		String roomKind = "";
		String roomClass = req.getParameter("roomClass");
		String roomType = req.getParameter("roomType");
		if (roomClass != null && roomType != null) {
			roomKind = roomClass + " " + roomType;
		}

		System.out.println("roomKind >> " + roomKind);
		
		String isBreakfast = req.getParameter("isBreakfast");
		
		String prodContents1 = req.getParameter("prodContents1");
		String prodContents2 = req.getParameter("prodContents2");
		if (prodContents2 == null) {prodContents2 = "";}
		String prodContents3 = req.getParameter("prodContents3");
		if (prodContents3 == null) {prodContents3 = "";}
		System.out.println("prodContents1 >> " + prodContents1);
		
		// 복지쿠폰 입력
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prodName", prodName);
		map.put("dcPrice", realPrice);
		map.put("dcPrice", dcPrice);
		map.put("roomKind", roomKind);
		map.put("isBreakfast", isBreakfast);
		map.put("prodContents1", prodContents1);
		map.put("prodContents2", prodContents2);
		map.put("prodContents3", prodContents3);
		dao.welfareCuponInsert(map);

	}
}
