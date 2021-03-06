package com.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberService;
import member.MemberVO;
@WebServlet("/googlesign")
public class GoogleMemberServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                req.setCharacterEncoding("UTF-8");
                
                HttpSession session=req.getSession();
                String action=req.getParameter("action");
                String action1=(String) req.getAttribute("action");
                String member_GoogleId=(String) req.getAttribute("id");
                if("sign".equals(action1)){
                try{
                String member_Email=(String) req.getAttribute("email");
                String member_name=(String) req.getAttribute("name");
                String member_state="一般會員";
		MemberService mbrSvc = new MemberService();
		if(mbrSvc.googleExist(member_GoogleId)){
			mbrSvc.addGoogleMbr(member_name, member_Email, member_GoogleId,member_state);
			System.out.println("INSRT OK");
			List<MemberVO> list=mbrSvc.getGoogleOneByNo(member_GoogleId);
//			for(MemberVO memberVO:list){
//				System.out.println(memberVO.getMember_name());
//				System.out.println(memberVO.getMember_no());
//			}
			
//			session.setAttribute("MemberVO", list);
//			session.setAttribute("member_GoogleId", member_GoogleId);
			session.setAttribute("mbr", list.iterator().next());
			session.setAttribute("MemberVO", list.iterator().next());
			RequestDispatcher rd = req.getRequestDispatcher("/productindex.jsp");
			rd.forward(req, resp);
		}
		else{
			System.out.println("Have ID");
			MemberVO mbr = new MemberVO();
			List<MemberVO> list = null;
			list = mbrSvc.getGoogleOneByNo(member_GoogleId);
			for(MemberVO mbrVO : list){
				mbr.setMember_no(mbrVO.getMember_no());
				mbr.setMember_name(mbrVO.getMember_name());
				mbr.setMember_id(mbrVO.getMember_id());
				mbr.setMember_password(mbrVO.getMember_password());
				mbr.setMember_phone(mbrVO.getMember_phone());
				mbr.setMember_address(mbrVO.getMember_address());
				mbr.setMember_gender(mbrVO.getMember_gender());
				mbr.setMember_Email(mbrVO.getMember_Email());
				mbr.setMember_bonus(mbrVO.getMember_bonus());
				mbr.setMember_GoogleId(member_GoogleId);
				mbr.setMember_state(mbrVO.getMember_state());
				session.setAttribute("MemberVO", mbr);
				session.setAttribute("mbr", mbr);
				RequestDispatcher rd = req.getRequestDispatcher("/productindex.jsp");
				rd.forward(req, resp);
			}
		}
	}catch(Exception e){
		RequestDispatcher rd = req.getRequestDispatcher("/productindex.jsp");
		rd.forward(req, resp);
	}
                }
                if("UPDATA".equals(action)){
                	try{
                		String address=req.getParameter("Address");
                		String phone=req.getParameter("Phone");
                		MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
//                		String member_Email=(String) req.getAttribute("email");
//                		String member_GoogleId=(String) req.getAttribute("id");
//                		String member_name=(String) req.getAttribute("name");
                		MemberService mbrSvc = new MemberService();
                		mbrSvc.updateMbr(memberVO.getMember_no(), memberVO.getMember_name(), memberVO.getMember_id(), memberVO.getMember_password(), phone, address, memberVO.getMember_gender(), memberVO.getMember_Email(), memberVO.getMember_birthday(), memberVO.getMember_bonus(), memberVO.getMember_GoogleId(),memberVO.getMember_state());
                	}catch(Exception e){
                		System.out.println("XXXXXXX");
                	}
                }
//                if("UPDATAphone".equals(action)){
//                	try{
//                		String phone=req.getParameter("Phone");
//                		System.out.println(phone+"1111111111111111111111111111111111");
//                		MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
////                		String member_Email=(String) req.getAttribute("email");
////                		String member_GoogleId=(String) req.getAttribute("id");
////                		String member_name=(String) req.getAttribute("name");
//                		MemberService mbrSvc = new MemberService();
//                		mbrSvc.updateGooglePhone(memberVO.getMember_no(), phone,memberVO.getMember_Email(),memberVO.getMember_name());
//                	}catch(Exception e){
//                		System.out.println("XXXXXXX");
//                	}
//                }
                
	}

}
