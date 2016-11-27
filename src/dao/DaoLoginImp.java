package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.UserName;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import en_decrypt.SimpleSecurity;
import bean.AllMovies;
import bean.GetPost;
import bean.MyPost;
import bean.NotifyBean;
import bean.PostDetail;

public class DaoLoginImp implements DaoLoginInterface {

	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int checkLog(String name, String pass) {
		// TODO Auto-generated method stub
		SimpleSecurity sec = new SimpleSecurity();
		String finpass = sec.en_de_crypt(pass);

		String que = "SELECT * FROM login_detail where BINARY emailid='" + name
				+ "' and pass='" + finpass + "'";
		return jdbcTemplate.query(que, new ResultSetExtractor<Integer>() {
			@Override
			public Integer extractData(ResultSet rs) throws SQLException,
					DataAccessException {

				int count = 0;
				while (rs.next()) {
					count++;
				}
				return count;
			}
		});
	}

	@Override
	public int register(String emailid, String fname, String pass) {
		// TODO Auto-generated method stub
		SimpleSecurity sec = new SimpleSecurity();
		String finpass = sec.en_de_crypt(pass);
		String query;
		query = "Insert into login_detail values ('" + emailid + "','" + fname
				+ "','" + finpass + "')";
		try {
			jdbcTemplate.update(query);
		} catch (Exception e) {
			return 0;
		}
		query = "create table "
				+ fname
				+ " (id int primary key auto_increment,message varchar(200),frm varchar(50),movie varchar(150))";
		jdbcTemplate.execute(query);
		return 1;
	}

	@Override
	public int update(String emailid, String pass) {
		// TODO Auto-generated method stub
		SimpleSecurity sec = new SimpleSecurity();
		String finpass = sec.en_de_crypt(pass);
		String query = "Update login_detail set pass='" + finpass
				+ "' where emailid='" + emailid + "'";
		return jdbcTemplate.update(query);
	}

	@Override
	public List<PostDetail> getTicket() {
		String sql = "select * from post where count!=0";
		return jdbcTemplate.query(sql, new RowMapper<PostDetail>() {
			public PostDetail mapRow(ResultSet rs, int row) throws SQLException {
				PostDetail e = new PostDetail();
				e.setImg(rs.getString(1));
				e.setMovie(rs.getString(2));
				e.setLang(rs.getString(3));
				return e;
			}
		});

	}

	@Override
	public List<AllMovies> getAllTicket() {
		// TODO Auto-generated method stub
		String sql = "select * from post";
		return jdbcTemplate.query(sql,
				new ResultSetExtractor<List<AllMovies>>() {
					@Override
					public List<AllMovies> extractData(ResultSet rs)
							throws SQLException, DataAccessException {

						List<AllMovies> list = new ArrayList<AllMovies>();
						while (rs.next()) {
							AllMovies e = new AllMovies();
							e.setAimg(rs.getString(1));
							e.setAmovie(rs.getString(2));
							e.setAlang(rs.getString(3));
							list.add(e);
						}
						return list;
					}

				});
	}

	public List<AllMovies> getNotTicket(String name) {
		// TODO Auto-generated method stub
		String sql = "select * from post where language='" + name + "'";
		return jdbcTemplate.query(sql,
				new ResultSetExtractor<List<AllMovies>>() {
					@Override
					public List<AllMovies> extractData(ResultSet rs)
							throws SQLException, DataAccessException {

						List<AllMovies> list = new ArrayList<AllMovies>();
						while (rs.next()) {
							AllMovies e = new AllMovies();
							e.setAimg(rs.getString(1));
							e.setAmovie(rs.getString(2));
							e.setAlang(rs.getString(3));
							list.add(e);
						}
						return list;
					}

				});
	}

	@Override
	public int postDetail(String movie, String lan, String user, String tname,
			String place, String time, String seat, String date) {
		// TODO Auto-generated method stub
		String sql;
		sql = "insert into allpost values('" + movie + "','" + lan + "','"
				+ user + "','" + tname + "','" + place + "','" + time + "','"
				+ seat + "','" + date + "')";
		int a = jdbcTemplate.update(sql);
		if (a != 0) {
			sql = "update post set count=count+1 where movie='" + movie + "'";
			jdbcTemplate.update(sql);
		}
		return a;
	}

	@Override
	public List<MyPost> getMyPost(String user) {
		// TODO Auto-generated method stub
		String sql = "select * from allpost where usename='" + user + "'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<MyPost>>() {
			@Override
			public List<MyPost> extractData(ResultSet rs) throws SQLException,
					DataAccessException {

				List<MyPost> list = new ArrayList<MyPost>();
				while (rs.next()) {
					MyPost e = new MyPost();

					e.setMname(rs.getString(1));
					e.setTheatre(rs.getString(4));
					e.setTiming(rs.getString(6));
					e.setDate(rs.getString(8));
					list.add(e);
				}
				return list;
			}

		});
	}

	@Override
	public int deleteMyPost(String mname, String thename, String usename,
			String timename, String dname) {
		// TODO Auto-generated method stub
		String sql;
		sql = "delete from allpost where mname=" + mname + " and thename="
				+ thename + " and usename=" + usename + " and timename="
				+ timename + " and dname=" + dname;
		int val = jdbcTemplate.update(sql);
		if (val != 0) {
			sql = "update post set count=count-1 where movie=" + mname;
			jdbcTemplate.update(sql);
			return 1;
		}
		return 0;
	}

	@Override
	public List<UserName> getUsername(String emailid) {
		// TODO Auto-generated method stub
		String sql = "select * from login_detail where emailid='" + emailid
				+ "'";

		return jdbcTemplate.query(sql,
				new ResultSetExtractor<List<UserName>>() {

					public List<UserName> extractData(ResultSet rs)
							throws SQLException, DataAccessException {

						List<UserName> list = new ArrayList<UserName>();
						while (rs.next()) {
							UserName e = new UserName();

							e.setProfile(rs.getString(2));
							list.add(e);
						}
						return list;
					}

				});
	}

	@Override
	public List<GetPost> getDetailAboutPost(String name) {
		// TODO Auto-generated method stub

		String sql = "select * from allpost where mname='" + name + "'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<GetPost>>() {
			@Override
			public List<GetPost> extractData(ResultSet rs) throws SQLException,
					DataAccessException {

				List<GetPost> list = new ArrayList<GetPost>();
				while (rs.next()) {

					GetPost e = new GetPost();
					e.setMovie(rs.getString(1));
					e.setSeat(rs.getString(7));
					e.setBy(rs.getString(3));
					e.setTheatre(rs.getString(4));
					e.setTime(rs.getString(6));
					e.setDate(rs.getString(8));
					list.add(e);
				}
				return list;
			}
		});

	}

	@Override
	public int sendMsg(String from, String to, String msg, String movie) {
		String query;

		query = "Insert into " + to + " (message,frm,movie) values " + "('"
				+ msg + "','" + from + "','" + movie + "')";
		try {
			jdbcTemplate.update(query);
		} catch (Exception e) {

			return 0;
		}
		query = "select * from " + to;

		int count = jdbcTemplate.query(query,
				new ResultSetExtractor<Integer>() {
					@Override
					public Integer extractData(ResultSet rs)
							throws SQLException, DataAccessException {

						int count = 0;

						while (rs.next()) {
							count++;
						}
						return count;
					}
				});
		if (count >= 5) {
			query = "delete from " + to + " order by id LIMIT 1";
			jdbcTemplate.update(query);

		}

		return 1;

	}

	@Override
	public List<NotifyBean> getMyNotify(String database) {
		// TODO Auto-generated method stub
		String sql = "select * from " + database + " order by id desc";
		return jdbcTemplate.query(sql,
				new ResultSetExtractor<List<NotifyBean>>() {
					@Override
					public List<NotifyBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {

						List<NotifyBean> list = new ArrayList<NotifyBean>();
						while (rs.next()) {

							NotifyBean e = new NotifyBean();
							e.setMsg(rs.getString(2));
							e.setFrom(rs.getString(3));
							e.setMovie(rs.getString(4));
							list.add(e);
						}
						return list;
					}
				});
	}

	@Override
	public int feedback(String mail, String msg) {
		// TODO Auto-generated method stub
		String query;
		query = "Insert into feedback (message,frm) values " + "('" + msg
				+ "','" + mail + "')";
		try {
			jdbcTemplate.update(query);
		} catch (Exception e) {
			return 0;
		}
		return 1;

	}
}
