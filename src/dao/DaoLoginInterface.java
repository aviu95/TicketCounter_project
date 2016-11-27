package dao;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import bean.AllMovies;
import bean.GetPost;
import bean.MyPost;
import bean.NotifyBean;
import bean.PostDetail;
import bean.UserName;

public interface DaoLoginInterface {
	public int feedback(String mail, String msg);

	public List<GetPost> getDetailAboutPost(String name);

	public List<UserName> getUsername(String emailid);

	public int checkLog(String name, String pass);

	public int register(String emailid, String fname, String pass);

	public int update(String emailid, String pass);

	public List<PostDetail> getTicket();

	public List<AllMovies> getAllTicket();

	public List<AllMovies> getNotTicket(String name);

	public int postDetail(String movie, String lan, String user, String tname,
			String place, String time, String seat, String date);

	public List<MyPost> getMyPost(String user);

	public List<NotifyBean> getMyNotify(String database);

	public int sendMsg(String from, String to, String msg, String movie);

	public int deleteMyPost(String mname, String thename, String usename,
			String timename, String dname);
}
