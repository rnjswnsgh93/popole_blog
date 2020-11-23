package com.study.springboot;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.UUID;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.study.springboot.dto.AccountDto;
import com.study.springboot.dto.BannerDto;
import com.study.springboot.dto.DailyDto;
import com.study.springboot.dto.ManagerDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.ReplyDto;
import com.study.springboot.dto.TasteDto;
import com.study.springboot.dto.VisitDto;
import com.study.springboot.service.AccountService;
import com.study.springboot.service.BannerService;
import com.study.springboot.service.DailyService;
import com.study.springboot.service.ManagerService;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.ReplyService;
import com.study.springboot.service.TasteService;
import com.study.springboot.service.VisitService;

@Controller
public class MyController {

	
	@Autowired
	DailyDto daily_dto;
	@Autowired
	DailyService daily_service;

	//메인 홈 화면
	@RequestMapping("/")
	public String root(HttpServletRequest request) throws Exception {
		String pagenum="1";
		String pagelast="5";
		ArrayList<DailyDto> daily_list=daily_service.list(daily_dto,pagenum,pagelast);
		ArrayList<TasteDto> taste_list=taste_service.list(taste_dto,pagenum,pagelast);
		ArrayList<ManagerDto> asidelist=manager_service.asidelist(manager_dto);
		banner_dto=banner_service.getBanner("manager");
		HttpSession session= request.getSession();
		session.setAttribute("daily_list",daily_list);
		session.setAttribute("taste_list",taste_list);
		session.setAttribute("asidelist",asidelist);
		session.setAttribute("banner_dto", banner_dto);
		
		return "main";
	}
	//일상 글 기본 화면
	@RequestMapping("/daily")
	public String daily(HttpServletRequest request) throws Exception {
		String pagenum=request.getParameter("pagenum");
		String pagelast=request.getParameter("pagelast");

		ArrayList<DailyDto> daily_list=daily_service.list(daily_dto,pagenum,pagelast);
		ArrayList<DailyDto> daily_hitlist=daily_service.hitlist(daily_dto);
		int daily_count=daily_service.daily_count();
		HttpSession session= request.getSession();
		session.setAttribute("daily_list",daily_list);
		session.setAttribute("daily_hitlist",daily_hitlist);
		session.setAttribute("daily_count",daily_count);
		
		return "daily/daily";
	}
	//일상글 보기
	@RequestMapping("/daily_view")
	public String daily_view(HttpServletRequest request) throws Exception {
		String pagenum=request.getParameter("pagenum");
		String pagelast=request.getParameter("pagelast");
		String no=request.getParameter("no");
		HttpSession session=request.getSession();
		System.out.println("id="+ no);
		daily_dto=daily_service.getUserId(no); //선택한 글 보여주기
						daily_service.hit(no);//조회수 증가
						
	   ArrayList<DailyDto> daily_list=daily_service.list(daily_dto,pagenum,pagelast);
	   ArrayList<ReplyDto> reply_list=reply_service.reply_list(no);
	   	int count_reply=reply_service.count_reply(no);
	   	session.setAttribute("daily_list",daily_list);
	   	session.setAttribute("reply_list",reply_list);
		session.setAttribute("daily_dto", daily_dto);
		session.setAttribute("count_reply", count_reply);
		
		return "daily/daily_view";
	}
	//일상글 쓰기 화면
	@RequestMapping("/write_daily")
	public String write_daily(HttpServletRequest request,Model model) throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute("sessionID")==null) {
			model.addAttribute("msg","로그인이 필요한 서비스 입니다");
			model.addAttribute("url","/login");
			return "redirect";
		}else {
		
		return "daily/write_daily";
		}
	}
	//일상 글 쓰기(DB저장)
	@RequestMapping("/daily_WriteAction")
	public String daily_WriteAction(HttpServletRequest request,Model model,@RequestParam("filename") MultipartFile file) 
									throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String hit=request.getParameter("hit");
		String filename=fileUploadService.restore(file);
		daily_dto.setId(id);
		daily_dto.setCategory(category);
		daily_dto.setTitle(title);
		daily_dto.setContent(content);
		daily_dto.setHit(hit);
		
		daily_dto.setFilename(filename);
		
		int result=daily_service.insert(daily_dto);
		if(result>0) {
			System.out.println("글작성 성공");
			model.addAttribute("msg","글을 작성하였습니다");
			model.addAttribute("url","/daily?pagenum=1&pagelast=5");
			return "redirect";
		}else {
			System.out.println("글작성 실패");
			model.addAttribute("url","/write_daily");
			return "redirect";
		}
				
	}
	//일상 글 쓰기 수정페이지
	@RequestMapping("/daily_modyfi")
	public String daily_modyfi(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String no=request.getParameter("no");
		daily_dto=daily_service.getUserId(no);
		session.setAttribute("daily_dto", daily_dto);
		return "daily/daily_modyfi";
	}
	//일상 글 쓰기 수정(DB 수정)
	@RequestMapping("/daily_modyfiAction")
	public String daily_modyfiAction(HttpServletRequest request,Model model,@RequestParam("filename") MultipartFile file) 
									throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String no=request.getParameter("no");
		String filename=fileUploadService.restore(file);
		daily_dto.setId(id);
		daily_dto.setCategory(category);
		daily_dto.setTitle(title);
		daily_dto.setContent(content);
		daily_dto.setNo(no);			
		daily_dto.setFilename(filename);
		
		daily_service.updateDaily(daily_dto);
		model.addAttribute("msg","수정완료했습니다");
		model.addAttribute("url","daily_view?no="+daily_dto.getNo());
		return"redirect";
	}
	//일상 글 삭제
	@RequestMapping("/daily_delete")
	public String daily_delete(HttpServletRequest request,Model model) {
		String no=request.getParameter("no");
		daily_service.delete(no);
		
		model.addAttribute("msg","게시물을 삭제했습니다");
		model.addAttribute("url","daily?pagenum=1&pagelast=5");
		
		
		return"redirect";
	}
//====================================
	
	@Autowired
	TasteDto taste_dto;
	@Autowired
	TasteService taste_service;
	
	//맛집 메인 화면
	@RequestMapping("/taste")
	public String taste(HttpServletRequest request) throws Exception {
		String pagenum=request.getParameter("pagenum");
		System.out.println("paegnum="+pagenum);
		String pagelast=request.getParameter("pagelast");
		System.out.println("pagelast="+pagelast);
		
		int taste_count =taste_service.taste_count();
		
		ArrayList<TasteDto> list=taste_service.list(taste_dto,pagenum,pagelast);
		ArrayList<TasteDto> taste_hitlist=taste_service.hitlist(taste_dto);
		HttpSession session= request.getSession();
		session.setAttribute("taste_list",list);
		session.setAttribute("taste_hitlist",taste_hitlist);
		session.setAttribute("taste_count",taste_count);
		return "taste/taste";
	}
	//맛집 글 보기 화면
	@RequestMapping("/taste_view")
	public String taste_view(HttpServletRequest request) throws Exception {
		String pagenum=request.getParameter("pagenum");
		String pagelast=request.getParameter("pagelast");
		String no=request.getParameter("no");
		HttpSession session=request.getSession();
		
		taste_dto=taste_service.getUserId(no); //선택한 글 보여주기
		taste_service.hit(no);//조회수 증가
						
	   ArrayList<TasteDto> taste_list=taste_service.list(taste_dto,pagenum,pagelast);
	   ArrayList<ReplyDto> reply_list=reply_service.reply_list(no);
	   	int count_reply=reply_service.count_reply(no);
	   	session.setAttribute("taste_list",taste_list);
		session.setAttribute("taste_dto", taste_dto);
		session.setAttribute("reply_list", reply_list);
		session.setAttribute("count_reply", count_reply);
		
		return "taste/taste_view";
	}
	//맛집 글 쓰기 화면
	@RequestMapping("/write_taste")
	public String write_taste(HttpServletRequest request,Model model) throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute("sessionID")==null) {
			model.addAttribute("msg","로그인이 필요한 서비스 입니다");
			model.addAttribute("url","/login");
			return "redirect";
		}else {
		
		return "taste/write_taste";}
	}
	//맛집 글 쓰기 (DB저장)
	@RequestMapping("/taste_WriteAction")
	public String taste_WriteAction(HttpServletRequest request,Model model,@RequestParam("filename") MultipartFile file) 
									throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String hit=request.getParameter("hit");
		String filename=fileUploadService.restore(file);
		taste_dto.setId(id);
		taste_dto.setCategory(category);
		taste_dto.setTitle(title);
		taste_dto.setContent(content);
		taste_dto.setHit(hit);
		
		taste_dto.setFilename(filename);
		
		int result=taste_service.insert(taste_dto);
		if(result>0) {
			System.out.println("글작성 성공");
			model.addAttribute("msg","글을 작성하였습니다");
			model.addAttribute("url","/taste?pagenum=1&pagelast=5");
			return "redirect";
		}else {
			System.out.println("글작성 실패");
			model.addAttribute("url","/write_taste");
			return "redirect";
		}
				
	}
	//맛집 글 수정 화면
	@RequestMapping("/taste_modyfi")
	public String taste_modyfi(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String no=request.getParameter("no");
		taste_dto=taste_service.getUserId(no);
		session.setAttribute("taste_dto", taste_dto);
		return "taste/taste_modyfi";
	}
	//맛집 글 수정 (DB 수정)
	@RequestMapping("/taste_modyfiAction")
	public String taste_modyfiAction(HttpServletRequest request,Model model,@RequestParam("filename") MultipartFile file)
									throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String no=request.getParameter("no");
		String filename=fileUploadService.restore(file);
		taste_dto.setId(id);
		taste_dto.setCategory(category);
		taste_dto.setTitle(title);
		taste_dto.setContent(content);
		taste_dto.setNo(no);			
		taste_dto.setFilename(filename);
		
		taste_service.updateTaste(taste_dto);
		model.addAttribute("msg","수정완료했습니다");
		model.addAttribute("url","taste_view?no="+taste_dto.getNo());
		return"redirect";
	}
	//맛집 글 삭제
	@RequestMapping("/taste_delete")
	public String taste_delete(HttpServletRequest request,Model model) {
		String no=request.getParameter("no");
		taste_service.delete(no);
		
		model.addAttribute("msg","게시물을 삭제했습니다");
		model.addAttribute("url","taste?pagenum=1&pagelast=5");
		
		
		return"redirect";
	}
	
//==========================================================
	@Autowired
	AccountDto account_dto;
	@Autowired
	AccountService account_service;
	
		// 가계부 메인 화면
	@RequestMapping("/account")
	public String account(HttpServletRequest request,Model model) throws Exception {
		String pagenum=request.getParameter("pagenum");
		String pagelast=request.getParameter("pagelast");
		HttpSession session=request.getSession();
		String sessionID=(String)session.getAttribute("sessionID");
		System.out.println("sessionID="+sessionID);
		ArrayList<AccountDto> account_list=account_service.accountlist(sessionID, pagenum, pagelast);
			int account_count=account_service.count(sessionID);

		System.out.println("account_list ="+account_list);
		System.out.println("account_count ="+account_count);
		session.setAttribute("account_list",account_list);		
		session.setAttribute("account_count",account_count);		
		return "account/account";
	}
	//가계부 작성 화면
	@RequestMapping("/write_account")
	public String write_account() throws Exception {
		return "account/write_account";
	}
	//가계부 작성 내용 화면
	@RequestMapping("/account_view")
	public String account_view(HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		String sessionID=(String)session.getAttribute("sessionID");
		String no= request.getParameter("no");
		account_dto=account_service.getUserNo(no);
		ArrayList<AccountDto> account_list=account_service.getUserId(sessionID);
		session.setAttribute("account_dto", account_dto);
		session.setAttribute("account_list", account_list);
		return "account/account_view";
	}
	//가계부 작성(DB저장)
	@RequestMapping("/account_WriteAction")
	public String account_WriteAction(HttpServletRequest request,Model model) {
			String datea=request.getParameter("datea");
			String account=request.getParameter("account");
			
			String content=request.getParameter("content");
			String category=request.getParameter("category");
			String title=request.getParameter("title");
			String id=request.getParameter("id");
				Date date=Date.valueOf(datea);
				account_dto.setContentdate(date);
				account_dto.setAccount(account);
				account_dto.setContent(content);
				account_dto.setCategory(category);
				account_dto.setId(id);
				account_dto.setTitle(title);
			account_service.insert(account_dto);
			
			model.addAttribute("msg","가계부 작성을 하였습니다");
			model.addAttribute("url","/account?pagenum=1&pagelast=10");
			return "redirect";	
	}
	//가계부 삭제
	@RequestMapping("/account_delete")
	public String account_delete(HttpServletRequest request,Model model) {
			String no =request.getParameter("no");
			System.out.println("no="+no);
			account_service.delete(no);
			model.addAttribute("msg","해당 게시물을 삭제 했습니다.");
			model.addAttribute("url","account");
			
		return "redirect";
	}
	//가계부 수정화면
	@RequestMapping("/account_modyfi")
	public String account_modify(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		String no= request.getParameter("no");
		account_dto=account_service.getUserNo(no);
		session.setAttribute("account_dto", account_dto);
			
		return "account/account_modyfi";
	}
	//가계부 수정(DB수정)
	@RequestMapping("/account_modyfiAction")
	public String account_modifyAction(HttpServletRequest request,Model model) {
		String datea=request.getParameter("datea");
		String account=request.getParameter("account");
		String content=request.getParameter("content");
		String no=request.getParameter("no");
			Date date=Date.valueOf(datea);
			account_dto.setContentdate(date);
			account_dto.setAccount(account);
			account_dto.setContent(content);

			account_service.updateAccount(account_dto);
			model.addAttribute("msg","해당 게시물을 수정 했습니다.");
			model.addAttribute("url","account");
			
		return "redirect";
}	
//====================================================================================================
	@Autowired
	MemberDto dto;
	
	@Autowired
	MemberService mservice;
	
	//로그인 화면
	@RequestMapping("/login")
	public String login() throws Exception {
		return "login";
	}
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request)throws Exception {
	HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	//회원 가입 화면
	@RequestMapping("/join")
	public String join() throws Exception {
		return "join";
	}
	//회원가입(DB저장)
		@RequestMapping("/MemberJoinAction")
		public String memberJoinAction(HttpServletRequest request,Model model){
				String id=request.getParameter("id");
				String password=request.getParameter("password");
				String name=request.getParameter("name");
				String birthyy=request.getParameter("birthyy");
				String birthmm=request.getParameter("birthmm");
				String birthdd=request.getParameter("birthdd");
				Date birth=null;
				
				if(birthyy != null && birthmm != null && birthdd != null)
					birth = Date.valueOf(birthyy+"-"+birthmm+"-"+birthdd);
				
				String mail1=request.getParameter("mail1");
				String mail2=request.getParameter("mail2");
				String mail = mail1+"@"+mail2;
				
				dto.setId(id);
				dto.setPassword(password);
				dto.setName(name);
				dto.setBirth(birth);
				dto.setMail(mail);
				
				int result=mservice.insert(dto);
				if(result>0) {
					System.out.println("회원가입 됨");
					model.addAttribute("msg","축하합니다.회원가입 되었습니다.");
					model.addAttribute("url","/login");
				}else {
					System.out.println("회원가입 안됨");
					
				}
								
		return "redirect";
		}
		//중복아이디 체크
		@RequestMapping(value="/IdCheckAction", method=RequestMethod.GET)
		public @ResponseBody String idCheck(HttpServletRequest request,Model model) {
			String id=request.getParameter("id");
			int result =manager_service.idCheck(id);
			if( result > 0 ) {
				System.out.println("중복된 아이디 있음");
				
			}else {
				System.out.println("중복된 아이디 없음");
				
			}return String.valueOf( result );
		}
		
		//로그인
		@RequestMapping("/loginAction")
		public String loginAction(HttpServletRequest request,Model model) {
			String id=request.getParameter("id");
			String password = request.getParameter("password");
			HttpSession session=request.getSession();
			dto.setId(id);
			MemberDto dbdto=mservice.loginCheck(dto);
			if(dbdto == null) {
				model.addAttribute("msg","아이디가 존재하지 않습니다");
				model.addAttribute("url","/login");
				return "redirect";
			}
			if(dbdto.getPassword().equals(password)) {
				//로그인 성공
				session.setAttribute("sessionID", id);
				return "main";
			}else {
				model.addAttribute("msg","비밀번호가 다릅니다");
				model.addAttribute("url","/login");
				return "redirect";
			}
			
			}
		
//=============================================================================================
				
	//검색 화면 
	@RequestMapping("/search_view")
	public String serch_view(HttpServletRequest request) throws Exception {
		String pagenum=request.getParameter("pagenum");
		String pagelast=request.getParameter("pagelast");
		HttpSession session=request.getSession();
		String search=request.getParameter("search");
			ArrayList<ManagerDto> searchlist=manager_service.searchlist(search,pagenum,pagelast);
			int search_count=manager_service.search_count(search);
			session.setAttribute("searchlist",searchlist);
			session.setAttribute("search",search);
			session.setAttribute("search_count",search_count);
		
		
		return "search_view";
	}
//===============================================================================================
	@Autowired
	VisitService visit_service;
	@Autowired
	VisitDto visit_dto;
	
	//방명록
	@RequestMapping("/visit")
	public String visit(HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();		
		ArrayList<VisitDto> list=visit_service.list(visit_dto);
		session.setAttribute("visit_list", list);
		
		return "visit/visit";
	}
	//방명록 글쓰기(DB 저장)
	@RequestMapping("/visitAction")
	public String visitAction(HttpServletRequest request) {
		String category=request.getParameter("category");
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String content=request.getParameter("content");
		
		visit_dto.setCategory(category);
		visit_dto.setId(id);
		visit_dto.setPassword(password);
		visit_dto.setContent(content);
		
		visit_service.insert(visit_dto);
		

		return "redirect:visit";
	}
	//방명록 댓글달기 화면
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String no=request.getParameter("no");
		visit_dto=visit_service.getUserNo(no);
		
		session.setAttribute("visit_dto", visit_dto);
		return "visit/reply";
	}
	//방명록 댓글달기 (DB저장)
	@RequestMapping("/replyAction")
	public String replyAction(HttpServletRequest request,Model model) {
			String no =request.getParameter("no");
			String category =request.getParameter("category");
			String group =request.getParameter("group");
			String id =request.getParameter("id");
			String password =request.getParameter("password");
			String content =request.getParameter("content");
			
			visit_dto.setNo(no);
			visit_dto.setCategory(category);
			visit_dto.setGroup(group);
			visit_dto.setId(id);
			visit_dto.setPassword(password);
			visit_dto.setContent(content);
			
			visit_service.insert_reply(visit_dto);
			
			model.addAttribute("msg","댓글작성 했습니다");
			model.addAttribute("url","visit");
		
		
		return "redirect";
	}
	//방명록 삭제 화면
	@RequestMapping("/delete_visit")
	public String delete_visit(HttpServletRequest request,Model model) {				
		return "visit/visit_delete";
	}
	//방명록 삭제(DB)
	@RequestMapping("/visit_deleteAction")
	public String visit_deleteAction(HttpServletRequest request,Model model) {
			String no=request.getParameter("no");
			String password=request.getParameter("password");
			visit_dto=visit_service.getUserNo(no);
		
			if(visit_dto.getPassword().equals(password)) {
				if(visit_dto.getStep().equals("0") ) {
					visit_service.delete_group(visit_dto.getGroup());
				}else {
				visit_service.delete(no);
				}
				model.addAttribute("msg","삭제 완료 했습니다");
				model.addAttribute("url","visit");
				return "redirect";
			}
			else {
				model.addAttribute("msg","비밀번호가 일치하지 않습니다");
				model.addAttribute("url","visit");
				return "redirect";
			}
			

	}
	
//==========================================================================================
	
	//마이페이지 메인 화면
	@RequestMapping("/mypage_home")
	public String mypage_home(HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		String sessionID=(String)session.getAttribute("sessionID");
		dto=mservice.getUser(sessionID);
		 int dailycount=daily_service.count(sessionID);
		 int tastecount=taste_service.count(sessionID);
		 int accountcount=account_service.count(sessionID);
		 System.out.println("dailycount :"+dailycount);
		 session.setAttribute("dailycount", dailycount);
		 session.setAttribute("tastecount", tastecount);
		 session.setAttribute("accountcount", accountcount);
		session.setAttribute("dto",dto);

		return "mypage/mypage_home";
	}
	
	//마이페이지 내정보 수정화면
	@RequestMapping("/mypage_modyfi")
	public String mypage_modyfi(HttpServletRequest request) throws Exception {
			HttpSession session=request.getSession();
		String id=(String)request.getParameter("id");
			 dto=mservice.getUser(id);
			 session.setAttribute("dto", dto);
			 
		return "mypage/mypage_modyfi";
	}
	//회원정보 수정
	@RequestMapping("/MemberModyfi")
	public String MemberModyfi(HttpServletRequest request,Model model) {
		String old_password=request.getParameter("old_password");
		String new_password=request.getParameter("new_password");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String mail1=request.getParameter("mail1");
		String mail2=request.getParameter("mail2");
		String mail = mail1+"@"+mail2;
		
		
		dto=mservice.getUser(id);
		if(old_password.equals(dto.getPassword())) {
			dto.setName(name);
			dto.setPassword(new_password);
			dto.setMail(mail);
			mservice.updateMember(dto);
			model.addAttribute("msg","회원정보가 수정되었습니다");
			model.addAttribute("url","/mypage_home");
			return "redirect";
		}
		else {
			model.addAttribute("msg","기존 비밀번호가 다릅니다");
			model.addAttribute("url","/mypage_home");
			return "redirect";
		}	
		
}
	//회원정보 삭제
	@RequestMapping("/member_delete")
	public String member_delete(HttpServletRequest request,Model model) {
		String sessionID=(String)request.getSession().getAttribute("sessionID");
		String password=request.getParameter("password");
		if(password.equals(mservice.getUser(sessionID).getPassword())){
			mservice.deleteMember(sessionID);
			request.getSession().invalidate();
			model.addAttribute("msg","회원탈퇴 되었습니다");
			model.addAttribute("url","/");	
			return "redirect";
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다");
			model.addAttribute("url","/mypage_delete");	
			return "redirect";
		}
	}
	//마이페이지 회원 탈퇴
	@RequestMapping("/mypage_delete")
	public String mypage_delete() throws Exception {
		return "mypage/mypage_delete";
			
	}
	//마이페이지 글 목록
	@RequestMapping("/mypage_writelist")
	public String mypage_writelist(HttpServletRequest request) throws Exception {
			String pagenum=request.getParameter("pagenum");
			String pagelast=request.getParameter("pagelast");
				HttpSession session=request.getSession();
				String sessionID=(String)session.getAttribute("sessionID");
				ArrayList<ManagerDto> mypagelist=manager_service.mypagelist(sessionID,pagenum,pagelast);
					int mypagelist_count =manager_service.mypagelist_count(sessionID);
					System.out.println("mypagelist_count="+mypagelist_count);
						session.setAttribute("mypagelist", mypagelist);
						session.setAttribute("mypagelist_count", mypagelist_count);

						return "mypage/mypage_writelist";
	}
//==================================================================================================
		
	@Autowired
	BannerDto banner_dto;
	@Autowired
	BannerService banner_service;

	@Autowired
	ManagerDto manager_dto;
	@Autowired
	ManagerService manager_service;
	
		//관리자 모드 메인 화면
		@RequestMapping("/manager_loginAction")
		public String manager_loginAction(HttpServletRequest request,Model model) {
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			if(id.equals("manager93") && password.equals("managerpw") ) {
				model.addAttribute("msg","관리자님 로그인 되었습니다.");
				model.addAttribute("url","manager_member?pagenum=1&pagelast=10");
				request.getSession().setAttribute("managerID", id);
			}else {
				model.addAttribute("msg","아이디와 비밀번호를 다시 확인해주세요.");
				model.addAttribute("url","manager_login");
				}
			
			return"redirect";
		}
		//관리자 모드 로그인
		@RequestMapping("/manager_login")
		public String manager_login(HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			if(session.getAttribute("managerID")!= null) {
				return "redirect:manager_member?pagenum=1&pagelast=10";
			}
			else {
			return "manager_page/manager_login";
}
		}
		//관리자 모드 회원목록
		@RequestMapping("/manager_member")
		public String manager_member(HttpServletRequest request,Model model) throws Exception {
			String pagenum=request.getParameter("pagenum");
			String pagelast=request.getParameter("pagelast");
			HttpSession session = request.getSession();
			String managerID=(String)session.getAttribute("managerID");
			if(managerID == null) {
				model.addAttribute("msg","관리자 로그인이 필요합니다");
				model.addAttribute("url","manager_login");
				return "redirect";
	}
			ArrayList<MemberDto> member_list=mservice.list(pagenum, pagelast);
			int count_member = mservice.count_member();
			session.setAttribute("member_list", member_list);
			session.setAttribute("count_member", count_member);
			return "manager_page/manager_member";
		}
		
		//관리자 모드 게시글 목록
		@RequestMapping("/manager_writelist")
		public String manager_writelist(HttpServletRequest request,Model model) throws Exception {
			HttpSession session = request.getSession();
			String managerID=(String)session.getAttribute("managerID");
			if(managerID == null) {
				model.addAttribute("msg","관리자 로그인이 필요합니다");
				model.addAttribute("url","manager_login");
				return "redirect";
			}
			String pagenum=request.getParameter("pagenum");
			String pagelast=request.getParameter("pagelast");
			ArrayList<ManagerDto> member_write_list=manager_service.memberwritelist(pagenum,pagelast);
			int manager_writelist_count=manager_service.manager_writelist_count();
			System.out.println("member_write_list="+member_write_list);
			System.out.println("manager_writelist_count="+manager_writelist_count);
			session.setAttribute("member_write_list", member_write_list);
			session.setAttribute("manager_writelist_count", manager_writelist_count);
			return "manager_page/manager_writelist";
		}
		//관리자모드 회원 삭제
		@RequestMapping("/manager_delete")
		public String manager_delete(HttpServletRequest request,Model model) {
			String id = request.getParameter("id");
			mservice.deleteMember(id);
			model.addAttribute("msg",id+"님의 정보를 삭제했습니다");
			model.addAttribute("url","manager_member");		
			return "redirect";
		}
		//관리자모드 게시글 삭제
		@RequestMapping("/manager_write_delete")
		public String manager_write_delete(HttpServletRequest request,Model model) {
			String no = request.getParameter("no");
				manager_service.delete(no);
				model.addAttribute("msg", "게시글을 삭제했습니다");
				model.addAttribute("url", "manager_writelist?pagenum=1&pagelast=10");
			return "redirect";
		}
		
		//관리자 모드 배너 설정 화면
				@RequestMapping("/manager_baner")
				public String manager_baner(HttpServletRequest request,Model model) throws Exception {
					HttpSession session = request.getSession();
					String managerID=(String)session.getAttribute("managerID");
					if(managerID == null) {
						model.addAttribute("msg","관리자 로그인이 필요합니다");
						model.addAttribute("url","manager_login");
						return "redirect";
					}
					return "manager_page/manager_baner";
				}
		//관리자 배너 설정(DB)
		@RequestMapping("/manager_banner")
		public String manager_banner(HttpServletRequest request,Model model,
									@RequestParam("file1")MultipartFile file1,@RequestParam("file2")MultipartFile file2,
									@RequestParam("file3")MultipartFile file3,@RequestParam("file4")MultipartFile file4,
									@RequestParam("filead")MultipartFile filead) throws UnsupportedEncodingException {
			request.setCharacterEncoding("utf-8");
			
			String file_1=fileUploadService.restore(file1);
			String file_2=fileUploadService.restore(file2);
			String file_3=fileUploadService.restore(file3);
			String file_4=fileUploadService.restore(file4);
			String file_ad=fileUploadService.restore(filead);
			String file1_link=request.getParameter("file1_link");
			String file2_link=request.getParameter("file2_link");
			String file3_link=request.getParameter("file3_link");
			String file4_link=request.getParameter("file4_link");
			String filead_link=request.getParameter("filead_link");
			String id = request.getParameter("id");
			
			
				BannerDto bannerDto=new BannerDto();
				System.out.println("banner_dto="+banner_dto);
				bannerDto.setId(id);
				bannerDto.setFile1(file_1);
				bannerDto.setFile2(file_2);
				bannerDto.setFile3(file_3);
				bannerDto.setFile4(file_4);
				bannerDto.setFilead(file_ad);
				
				bannerDto.setFile1_link(file1_link);
				bannerDto.setFile2_link(file2_link);
				bannerDto.setFile3_link(file3_link);
				bannerDto.setFile4_link(file4_link);
				bannerDto.setFilead_link(filead_link);
				
				
				System.out.println("banner_dto="+bannerDto);
				int count=banner_service.updateBanner(bannerDto);
				if(count>0) {
					System.out.println("업데이트 성공");
					model.addAttribute("msg","배너를 변경했습니다");
					model.addAttribute("url","manager_member");
				}
				else {
					System.out.println("업데이트 실패");
					model.addAttribute("url","manager_member");
				}
		
			return "redirect";
	
		}
//=======================================================================================	
	
		@Autowired
		ReplyService reply_service;
		@Autowired
		ReplyDto reply_dto;
		
		//게시글 댓글 작성(DB)		
		@RequestMapping("/content_reply")
		public String daily_reply(HttpServletRequest request,Model model) {
			if(request.getSession().getAttribute("sessionID") == null) {
				model.addAttribute("msg","로그인이 필요한 서비스 입니다.");
				model.addAttribute("url","login");
				return "redirect";
			}
			String id= request.getParameter("id");
			String viewno= request.getParameter("viewno");
			String step= request.getParameter("step");
			String content= request.getParameter("content");
			System.out.println("id ="+id);
			System.out.println("no ="+viewno);
			System.out.println("step ="+step);
			System.out.println("content ="+content);
			reply_dto.setId(id);
			reply_dto.setViewno(viewno);
			reply_dto.setStep(step);
			reply_dto.setContent(content);
			
				reply_service.insert(reply_dto);
			
			return "redirect:daily_view?no="+viewno+"&pagenum=1&pagelast=5";
		}
	//게시글 대댓글 작성	
		@RequestMapping("/content_reply_step1")
		public String daily_reply_step1(HttpServletRequest request,Model model) {
				String id = request.getParameter("id");
				String viewno = request.getParameter("viewno");
				String step = request.getParameter("step");
				String group = request.getParameter("group");
				String content = request.getParameter("content");
					
				reply_dto.setId(id);
				reply_dto.setViewno(viewno);
				reply_dto.setStep(step);
				reply_dto.setGroup(group);
				reply_dto.setContent(content);
				
				reply_service.insert_reply(reply_dto);

			
				return "redirect:daily_view?no="+viewno+"&pagenum=1&pagelast=5";
		}
		//게시글 댓글 삭제
		@RequestMapping("/delete_reply")
		public String delete_reply(HttpServletRequest request,Model model) {
			String no=request.getParameter("no");
			reply_dto=reply_service.getNo(no);
			String sessionID= (String)request.getSession().getAttribute("sessionID");
			if(reply_dto.getId().equals(sessionID)) {
				reply_service.delete(no);
				model.addAttribute("msg","삭제하였습니다");
				model.addAttribute("url","daily_view?no="+reply_dto.getViewno()+"&pagenum=1&pagelast=5");
				return "redirect";
			}else {
				model.addAttribute("msg","작성자만 삭제할수 있습니다 로그인 해주세요");
				model.addAttribute("url","daily_view?no="+reply_dto.getViewno()+"&pagenum=1&pagelast=5");
				return "redirect";
			}
			
		}
//===============================================================================================	
	
	//파일 업로드

		@Autowired
		FileUploadService fileUploadService;
		
		@Bean(name = "multipartResolver")
		public CommonsMultipartResolver multipartResolver() {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
			multipartResolver.setMaxUploadSize(200000000);
			multipartResolver.setMaxInMemorySize(200000000);
			multipartResolver.setDefaultEncoding("utf-8");
			return multipartResolver;
		}
//=========================================================================================

	// cKeditor 사용
	/**
     * @param multiFile
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/mine/imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{
            
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            
            //이미지 경로 생성
            String path ="C:\\Users\\i7B\\Documents\\springboot\\Portpolio_blog\\src\\main\\resources\\static/"+ "ckImage/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
            
        // 업로드시 메시지 출력
          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
          printWriter.flush();
            
        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
           if(out != null) { out.close(); }
           if(printWriter != null) { printWriter.close(); }
          } catch(IOException e) { e.printStackTrace(); }
         }
        
        return;
    }
    
    /**
     * cKeditor 서버로 전송된 이미지 뿌려주기
     * @param uid
     * @param fileName
     * @param request
     * @return
     * @throws ServletException
     * @throws IOException
     */
    //
    @RequestMapping(value="/mine/ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
                            , @RequestParam(value="fileName") String fileName
                            , HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException{
        
        //서버에 저장된 이미지 경로
        String path = "C:\\\\Users\\\\i7B\\\\Documents\\\\springboot\\\\Portpolio_blog\\\\src\\\\main\\\\resources\\\\static/"+"ckImage/";
    
        String sDirPath = path + uid + "_" + fileName;
    
        File imgFile = new File(sDirPath);
        
        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;
            
            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;
            
            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
                
            }catch(IOException e){
            e.getStackTrace();
            }
        }
    }

	
}







