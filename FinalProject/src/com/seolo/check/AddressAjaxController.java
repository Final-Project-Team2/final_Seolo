/*==========================
   SampleController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.seolo.idao.IChecklistDAO;

public class AddressAjaxController implements Controller
{
	private IChecklistDAO dao;

    public void setDao(IChecklistDAO dao)
    {
       this.dao = dao;
    }

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// System.out.println("test1");
		
		try
		{
			String bcode = request.getParameter("bcode");
			
			int check = dao.checkdong(bcode);
			
			String result = "";
			
			// System.out.println("test2");
			
			if(check==0)
			{
				result = "해당 지역은 서울이 아닙니다. 다시 검색해주세요";
			}
			else
			{
				result = dao.searchDongName(bcode);
			}
			
			mav.addObject("result", result);
			
			// System.out.println("test3");
			
			mav.setViewName("Adress_ok.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
		
	}
}
