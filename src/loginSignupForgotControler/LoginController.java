package loginSignupForgotControler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.AllMovies;
import bean.GetPost;
import bean.MyPost;
import bean.NotifyBean;
import bean.PostDetail;
import dao.DaoLoginInterface;

@Controller
public class LoginController {

	final String good = "1", error = "0", serviceerror = "-1",
			securityerror = "3";

	
	@Autowired()
	private DaoLoginInterface dao;

	/***Login Form***/
	
	@RequestMapping(value = "/loginform.ds", method = RequestMethod.POST)
	@ResponseBody
	public String loginform(HttpServletRequest req,
			@RequestParam("name") String name, @RequestParam("pass") String pass)
			throws Exception {
		int count = dao.checkLog(name, pass);

		if (count == 1) {
			String profile = null;
			HttpSession ses = req.getSession();
			ses.setAttribute("profile", profile);
			ses.setAttribute("user", name);
			return good;
		}
		return error;
	}

	/***Login Success***/
	@RequestMapping(value = "/loginsuccess.ds")
	public ModelAndView loginsuccess() {

		List<PostDetail> p = dao.getTicket();
		ModelAndView mv = new ModelAndView("success", "p", p);
		return mv;

	}

	/***Sign up***/
	@RequestMapping(value = "/signupform.ds", method = RequestMethod.GET, produces = "text/plain")
	@ResponseBody
	public String signupform(@RequestParam("email") String email,
			@RequestParam("name") String name, @RequestParam("pass") String pass) {
		
		ServiceValidate serve=new ServiceValidate();

		if (serve.emailvalidate(email)) {

			if(!serve.userValidate(name))
					return securityerror;

			int got = dao.register(email, name, pass);

			if (got == 0)
				return serviceerror;

			return good;
		}

		return error;
	}

	/***Forgot password***/
	@RequestMapping(value = "/forgotform.ds", method = RequestMethod.GET)
	@ResponseBody
	public String forgotform(@RequestParam("email") String email,
			@RequestParam("oldpass") String pass1,
			@RequestParam("newpass") String pass2) {

		if (pass1.equals(pass2)) {
			int a = dao.update(email, pass1);

			if (a == 0)
				return serviceerror;
			return good;
		}
		return error;
	}

	/*** 		Log out		***/

	@RequestMapping(value = "/logoutform.ds")
	public ModelAndView logoutform(HttpSession ses) {

		ses.invalidate();

		return new ModelAndView("final");
	}

	/*** 		Load Movies		***/
	@RequestMapping(value = "/loadall.ds", method = RequestMethod.GET)
	public ModelAndView loadall(@RequestParam("name") String n) {

		System.out.println("Movie type " + n);
		List<AllMovies> all = null;
		ModelAndView mv = null;
		if (n.equals("All")) {
			all = dao.getAllTicket();
			mv = new ModelAndView("thank", "all", all);
			return mv;
		}
		all = dao.getNotTicket(n);
		mv = new ModelAndView("thank", "all", all);
		return mv;

	}

		/*** 		Insert 	Post into DB	***/
	
	@RequestMapping(value = "/updatepost.ds", method = RequestMethod.POST)
	@ResponseBody
	public String updatepost(@RequestParam("mname") String movie,
			@RequestParam("mlan") String lan,
			@RequestParam("usename") String user,
			@RequestParam("thename") String tname,
			@RequestParam("placename") String place,
			@RequestParam("timename") String time,
			@RequestParam("seatname") String seat,
			@RequestParam("dname") String date) {

		int pass = dao.postDetail(movie, lan, user, tname, place, time, seat,
				date);
		if (pass == 0)
			return error;
		return good;
	}

	/*** 		Get User Post from DB	***/
	
	@RequestMapping(value = "/deletepost.ds", method = RequestMethod.GET)
	public ModelAndView deletepost(@RequestParam("name") String name) {

		List<MyPost> all = null;
		all = dao.getMyPost(name);

		return new ModelAndView("deletepost", "all", all);

	}
	
	/*** 		Delete 	Post from DB	***/
	
	@RequestMapping(value = "/deletemypost.ds", method = RequestMethod.POST)
	@ResponseBody
	public String deletemypost(@RequestParam("first") String movie,
			@RequestParam("user") String user,
			@RequestParam("second") String tname,
			@RequestParam("third") String time,
			@RequestParam("forth") String date) {
		int get = dao.deleteMyPost(movie, tname, user, time, date);
		if (get == 1)
			return good;
		return error;
	}

	/*** 		Show user 	Post from DB	***/
	
	@RequestMapping(value = "/showpost.ds", method = RequestMethod.GET)
	public ModelAndView showpost(@RequestParam("name") String name) {

		List<GetPost> all = null;

		all = dao.getDetailAboutPost(name);

		return new ModelAndView("content", "all", all);

	}

	/*** 		Message Sending	***/
	
	@RequestMapping(value = "/sendmsg.ds", method = RequestMethod.GET)
	@ResponseBody
	public String sendmsg(@RequestParam("from") String from,
			@RequestParam("to") String to, @RequestParam("msg") String msg,
			@RequestParam("movie") String movie) {

		int val = dao.sendMsg(from, to, msg, movie);
		if (val != 0)
			return good;
		return error;

	}

	/*** 		 Notification	 	***/
	
	@RequestMapping(value = "/loadmynotification.ds", method = RequestMethod.GET)
	public ModelAndView loadmynotification(@RequestParam("name") String n) {


		List<NotifyBean> all = null;
		all = dao.getMyNotify(n);
		return new ModelAndView("notification", "all", all);

	}
	
	/*** 		Feedback			***/
	
	@RequestMapping(value = "/feedback.ds", method = RequestMethod.GET)
	@ResponseBody
	public String feedback(@RequestParam("a") String mail,
			@RequestParam("b") String msg) {
		int val = dao.feedback(mail, msg);
		if (val != 0)
			return good;
		return error;

	}

}
