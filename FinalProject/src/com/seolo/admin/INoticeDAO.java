/*======================
   INoticeDAO.java
   - 인터페이스
=======================*/

package com.seolo.admin;

import java.util.ArrayList;

public interface INoticeDAO
{
	/*
	public int count();
	
	public ArrayList<MemberDTO> list();
	public int remove(MemberDTO m);
	public int modify(MemberDTO m);
	*/
	
	// 게시물 목록
	public ArrayList<NoticeDTO> list();
	
	// 게시물 작성
	public int add(NoticeDTO n);
	
	// 게시물 조회
	public NoticeDTO view(int number);

	// 게시물 수정 
	public int modify(NoticeDTO n);
	
	// 게시물 삭제
	public int remove(NoticeDTO n);
	
	// 게시물 총 개수
	public int count();
	
}