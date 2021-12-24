/*==========================
   AdminController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.controller;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seolo.admin.INoticeDAO;
import com.seolo.admin.NoticeDTO;
import com.seolo.idao.IIntroductionDAO;
import com.seolo.personal.PersonalDTO;

@Controller
public class AdminController
{
	/// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/mainadmin.action", method = RequestMethod.GET)
	public String mainadmin(Model model)
	{
		
		return "WEB-INF/view/Main_admin.jsp";
	}
	
	@RequestMapping(value = "/noticelist.action", method = RequestMethod.GET)
	public String noticeList(Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		model.addAttribute("list", dao.list());
		model.addAttribute("catelist", dao.catelist());

		//@ 객체에 대한 주입
		//@ 해당 메소드(count.list) 에 오버라이딩
		
		return "WEB-INF/view/NoticeList.jsp";
	}
	
	@RequestMapping(value = "/writenotice.action", method = RequestMethod.GET)
	public String writeNotice(Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		return "WEB-INF/view/WriteNotice.jsp";
	}

	@RequestMapping(value = "/noticeinsert.action", method = RequestMethod.POST)
	public String noticeInsert(NoticeDTO n)
	{
		
		// AC_NO, 관리자 아이디 받아와서 테이블에 insert 해줘야 함!
		
	      // 체크 고유번호는 시퀀스를 통해 알아서 입력
	      // AC_NO를 세션속성으로 받아온다.
		/*
	      HttpSession session = request.getSession();
	      PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
	      int acNo = Integer.parseInt(user.getAc_No());
		*/
		
		/*
		// 1. 세션에 담겨있는 유저 객체 꺼내기
    	Map<String,Object> userVo =session.getAttribute(LOGIN); 
    	// 로그인 인터셉터에서 세션에 담은 userVo 가 java.util.Map 이라는 가정
		// 2. 조회조건 객체에 유저 정보 넣기
		cri.setUserName((String)userVo.get("userName"); // 실제 소스에 맞게 고치세요. 
		*/
		
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.add(n);
		
		return "redirect:noticelist.action";
	}
	
	// 공지사항 게시물 조회
	@RequestMapping(value = "/noticeview.action", method = RequestMethod.GET)
	public String noticeView(@RequestParam("no_no") int no_no, Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		model.addAttribute("view", dao.view(no_no));

		//@ 객체에 대한 주입
		//@ 해당 메소드(count.list) 에 오버라이딩
		
		return "WEB-INF/view/NoticeSee.jsp";
	}
	
	/*
	@RequestMapping(value = "/memberupdate.action", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.modify(m);
		
		return "redirect:memberlist.action";
		//@ : 항상 붙여서 작성해주기!
		
	}
	*/
	// 공지사항 게시물 수정 폼
	@RequestMapping(value = "/noticeupdateform.action", method = RequestMethod.GET)
	public String noticeUpdateform(@RequestParam("no_no") int no_no, Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		model.addAttribute("view", dao.view(no_no));
		
		return "WEB-INF/view/UpdateNotice.jsp";
	}
	
	
	// 공지사항 게시물 수정
	// 안댐! 확인해보기
	/*
	@RequestMapping(value = "/noticeupdate.action", method = RequestMethod.POST)
	public String noticeUpdate(NoticeDTO n)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.modify(n);
		
		//return "redirect:noticelist.action";
		return "redirect:noticeview.action?no_no=" + n.getNo_no();

	}
	*/
	
	/*
	@RequestMapping(value = "/noticeupdate.action", method = RequestMethod.POST)
	public String noticeUpdate(NoticeDTO n)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.modify(n);
		
		return "redirect:noticeview.action?no_no=" + n.getNo_no();
	}
	*/
	
	/*
	@RequestMapping(value = "noticeupdate.action", method=RequestMethod.POST)
	public String noticeUpdate(NoticeDTO n)
	{
		String result = "redirect:noticeview.action?no_no=";
				
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.modify(n);
		
		int no_no = n.getNo_no();
		
		result += "16";
		
		return result;
	}
	//-->> 왜 안되는지 이유를 진짜 모르겠다 왜,,,,,,?????? 왜 값을 못받아오는것인가...? 왜일까,,,,?
	*/
	
	
	@RequestMapping(value = "/noticeupdate.action", method = RequestMethod.POST)
	public String noticeUpdate(NoticeDTO n)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.modify(n);
		
		return "redirect:noticeview.action?no_no=" + n.getNo_no();
	}
	// --> 와 왜 되는지 모르겠지만 된다...왜...? no_no번호를 히든으로 받아와서인지...???
	
	//@ 딜리트 됨!
	// 공지사항 게시물 삭제
	@RequestMapping(value = "/noticedelete.action", method = RequestMethod.GET)
	public String noticeDelete(NoticeDTO n)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.remove(n);
		
		return "redirect:noticelist.action";
	}
}
