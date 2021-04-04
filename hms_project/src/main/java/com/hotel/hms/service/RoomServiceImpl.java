package com.hotel.hms.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.RoomDAO;
import com.hotel.hms.vo.GuestVO;
import com.hotel.hms.vo.RoomUseVO;
import com.hotel.hms.vo.RoomVO;
import com.hotel.hms.vo.currentlInUseVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomDAO dao;	

	@Override
	public void roomList(HttpServletRequest req, Model model) {
		// 객실 리스트 가져오기
		List<RoomVO> list = dao.roomList();
		
		model.addAttribute("list", list);
	}

	@Override
	public void repair(HttpServletRequest req, Model model) {
		// 객실 수리중으로 상태변화
		String roomNum = req.getParameter("roomNum");
		
		int updateCnt = dao.repair(roomNum);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void cleaning(HttpServletRequest req, Model model) {
		// 객실 청소중으로 상태변화
		String roomNum = req.getParameter("roomNum");
		
		int updateCnt = dao.cleaning(roomNum);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void checkInInsert(HttpServletRequest req, Model model) {
		// 체크인 인서트
		// update문으로 룸 찾아가서 값 바꿔넣어주기 => room_tbl
		// 회원 정보 넣기 => guest_tbl
		// 객실 이용 정보 넣기 = roomUse_tbl
		
		String roomNum = req.getParameter("roomNum");
		String roomKind = req.getParameter("roomKind");
		int roomPrice = Integer.parseInt(req.getParameter("roomPrice"));
		
		String guestName = req.getParameter("guestName");
		String guestPhone = req.getParameter("guestPhone");
		
		String guestEmail01 = req.getParameter("guestEmail01");
		String guestEmail02 = req.getParameter("guestEmail02");
		String guestEmail = guestEmail01 + "@" + guestEmail02;
		
		String empCode = req.getParameter("empCode");
		String guestLevel = req.getParameter("guestLevel");
		String checkIn = req.getParameter("checkIn");
		String checkOut = req.getParameter("checkOut");
		int guestCode;
		int insertCnt;
		
		
		// 체크인 업데이트
		int updateCnt = dao.roomUpdate(roomNum);
		
		if(updateCnt == 1) {
			int count = dao.guestCount(guestPhone);
			if(count > 0) {
				GuestVO vo = dao.geustGet(guestPhone);
				int guestPrice = vo.getGuestUsePrice();
				int guestUsePrice = guestPrice+roomPrice;
				guestCode = vo.getGuestCode();
				guestLevel = vo.getGuestLevel();
				
				GuestVO guest = new GuestVO();
				guest.setGuestUsePrice(guestUsePrice);
				guest.setGuestCode(guestCode);
				
				updateCnt = dao.guestPriceUpdate(guest);
				
				if(guestUsePrice > 999999 && guestUsePrice <= 1999999) {
					dao.guestLevelUpdate(guestCode);
				}else if(guestUsePrice > 1999999) {
					dao.guestLevelUpdateLast(guestCode);
				}
				
				// 객실 이용내역 테이블 인서트 => roomUseDate(sysdate로 값넣기)
				RoomUseVO roomUse = new RoomUseVO();
				roomUse.setEmpCode(empCode);
				roomUse.setGuestCode(guestCode);		// 회원정보 인서트하고 거기서 꺼내오기!
				roomUse.setRoomNum(roomNum);
				roomUse.setCheckIn(checkIn);
				roomUse.setCheckOut(checkOut);
				
				currentlInUseVO currentlInUse = new currentlInUseVO();
				currentlInUse.setEmpCode(empCode);
				currentlInUse.setGuestCode(guestCode);		// 회원정보 인서트하고 거기서 꺼내오기!
				currentlInUse.setRoomNum(roomNum);
				currentlInUse.setCheckIn(checkIn);
				currentlInUse.setCheckOut(checkOut);
				
				insertCnt = dao.currentlInUseInsert(currentlInUse);
				insertCnt = dao.roomUseInsert(roomUse);
				model.addAttribute("insertCnt", insertCnt);
				
				
			}else {
				// 회원 정보 인서트 => guestUsePrice(처음 가입에는 0)
				GuestVO guest = new GuestVO();
				guest.setGuestEmail(guestEmail);
				guest.setGuestLevel(guestLevel);
				guest.setGuestName(guestName);
				guest.setGuestPhone(guestPhone);
				
				insertCnt = dao.guestInsert(guest);
				
				if(insertCnt == 1) {
					GuestVO vo = new GuestVO();
					vo.setGuestPhone(guestPhone);
					vo.setGuestName(guestName);
					
					guestCode = dao.selectGuestCode(vo);
					
					// 객실 이용내역 테이블 인서트 => roomUseDate(sysdate로 값넣기)
					RoomUseVO roomUse = new RoomUseVO();
					roomUse.setEmpCode(empCode);
					roomUse.setGuestCode(guestCode);		// 회원정보 인서트하고 거기서 꺼내오기!
					roomUse.setRoomNum(roomNum);
					roomUse.setCheckIn(checkIn);
					roomUse.setCheckOut(checkOut);
					
					currentlInUseVO currentlInUse = new currentlInUseVO();
					currentlInUse.setEmpCode(empCode);
					currentlInUse.setGuestCode(guestCode);		// 회원정보 인서트하고 거기서 꺼내오기!
					currentlInUse.setRoomNum(roomNum);
					currentlInUse.setCheckIn(checkIn);
					currentlInUse.setCheckOut(checkOut);
					
					insertCnt = dao.currentlInUseInsert(currentlInUse);
					insertCnt = dao.roomUseInsert(roomUse);
					model.addAttribute("insertCnt", insertCnt);
					
				}
			}
		}
		 ////////////////// 메세지 전송하기 시작 ///////////////////////////////////////////////
	      String api_key = "NCSVCHFM3EJ6LS11";
	      String api_secret = "S59P6KLXU4JIF8F6TDW0R3BGQA9ITRWA";
	      Message coolsms = new Message(api_key, api_secret);
	      
	      // 4 params(to, from, type, text) are mandatory. must be filled
	      HashMap<String, String> params = new HashMap<String, String>();
	      String smsPhone = guestPhone;
	      params.put("to", smsPhone);
	      params.put("from", "01044591537");
	      params.put("type", "LMS");
	      params.put("text", guestName + "님 로얄코스텔에 오신것을 환영합니다!\n로얄코스텔과 함께하는 시간을 최고의 시간으로 만들어드리겠습니다.\n감사합니다!");
	      params.put("app_version", "test app 1.2"); // application name and version
	      
	      try {
	         JSONObject obj = (JSONObject) coolsms.send(params);
	         System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	         System.out.println(e.getMessage());
	         System.out.println(e.getCode());
	      }
	      ////////////////// 메세지 전송하기 끝 ///////////////////////////////////////////////
	}

	@Override
	public void checkInRoomStateChange(HttpServletRequest req, Model model) {
		// 체크인에서 빈방으로
		String roomNum = req.getParameter("roomNum");
		
		int updateCnt = dao.checkInRoomStateChange(roomNum);
		dao.deletecurrentlInUse(roomNum);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}

	@Override
	public void roomDetail(HttpServletRequest req, Model model) {
		// 체크인 상세정보
		// roomNum로 roomUse_tbl 접근 후 empCode , guestCode, checkIn, checkOut, roomUseDate 가지고 와서
		// guestCode로 guest_tbl 접근 후 정보 가져오기
		// empCode로 emp_tbl 접근 후 empName 가져오기
		String roomNum = req.getParameter("roomNum");
		model.addAttribute("roomNum", roomNum);
		
		
		currentlInUseVO roomUse = dao.roomUseInformationGet(roomNum);
		
		
		String empCode = roomUse.getEmpCode();
		model.addAttribute("empCode", empCode);
		
		int guestCode = roomUse.getGuestCode();
		model.addAttribute("guestCode", guestCode);
		
		String checkIn = roomUse.getCheckIn();
		model.addAttribute("checkIn", checkIn);
		
		String checkOut = roomUse.getCheckOut();
		model.addAttribute("checkOut", checkOut);
		
		Date roomUseDate = roomUse.getRoomUseDate();
		model.addAttribute("roomUseDate", roomUseDate);
		
		
		// guestCode로 guest_tbl 접근 후 정보 가져오기
		GuestVO guest = dao.guestInformationGet(guestCode);
		
		
		String guestName = guest.getGuestName();
		model.addAttribute("guestName", guestName);
		
		String guestPhone = guest.getGuestPhone();
		model.addAttribute("guestPhone", guestPhone);
		
		String guestEmail = guest.getGuestEmail();
		model.addAttribute("guestEmail", guestEmail);
		
		String guestLevel = guest.getGuestLevel();
		model.addAttribute("guestLevel", guestLevel);
		
		int guestUsePrice = guest.getGuestUsePrice();
		model.addAttribute("guestUsePrice", guestUsePrice);
		
		// empCode로 emp_tbl 접근 후 empName 가져오기
		String empName = dao.empNameGet(empCode);
		model.addAttribute("empName", empName);
		
	}

	@Override
	public void emptyGoRoomStateChange(HttpServletRequest req, Model model) {
		// 빈방으로
		String roomNum = req.getParameter("roomNum");
		
		int updateCnt = dao.checkInRoomStateChange(roomNum);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}
}
