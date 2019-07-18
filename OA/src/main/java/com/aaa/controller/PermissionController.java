package com.aaa.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.UserVo;
import com.aaa.service.PermissionService;

@Controller
public class PermissionController {
	@Autowired
	private PermissionService perser;

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	/*
	 * 后台主页面
	 */
	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	/*
	 * 注销方法
	 */
	@RequestMapping("logout")
	public String logout(HttpSession se) {
		se.invalidate();
		return "../../login";
	}

	/*
	 * 登录方法
	 */
	@RequestMapping("/login")
	public String login(HttpSession se, UserVo uservo) {
		List<Map<String, Object>> user = perser.login(uservo);
		if (user.size() > 0) {
			se.setAttribute("user", user);
			// 登陆成功后，添加系统日志，当前用户以及当前时间
			String uid = (String) user.get(0).get("UID");

			perser.sysLog(uid);
		} else {
			return "../../login";
		}
		return "main";
	}

	/*
	 * 查询员工详细信息
	 */
	@RequestMapping("getuser")
	public String getUser(Model model, HttpSession se) {

		// 获取部门信息
		List<Map<String, Object>> depts = perser.getDept();
		model.addAttribute("depts", depts);
		// 获取登录员工信息
		List<Map> user = (List<Map>) se.getAttribute("user");
		if (user != null) {
			String uid = (String) user.get(0).get("UID");
			int rid = (int) user.get(0).get("RoleID");
			List<Map<String, Object>> getuser = perser.getUser(rid, uid);
			// 获取职位信息
			List<Map<String, Object>> roles = perser.getRole();
			model.addAttribute("roles", roles);
			if (getuser != null) {
				model.addAttribute("getuser", getuser);
			}
		}
		return "person";

	}

	/*
	 * 权限查询 根据登录员工查询角色，以及对应的权限
	 */
	@RequestMapping("/show1")
	@ResponseBody
	public List<Map<String, Object>> show1(HttpSession session) {

		@SuppressWarnings("unchecked")
		List<Map<String, Object>> users = (List<Map<String, Object>>) session
				.getAttribute("user");
		Integer rid = (Integer) users.get(0).get("RoleID");

		List<Map<String, Object>> menuList = perser.findByLoginRole(rid);

		return menuList;
	}

	/*
	 * 跳转到修改密码页面的方法
	 */
	@RequestMapping("/upd")
	public String upd() {

		return "updatePwd";
	}

	/*
	 * 修改密码方法
	 */
	@RequestMapping("/updPwd")
	public String updPwd(HttpSession session, UserVo uservo) {

		@SuppressWarnings("unchecked")
		List<Map<String, Object>> map = (List<Map<String, Object>>) session
				.getAttribute("user");

		@SuppressWarnings("unused")
		int uid = (int) map.get(0).get("uid");

		perser.updPwd(uservo);

		return "../../index";

	}

	/*
	 * 查看所有员工信息
	 */
	@RequestMapping("getAll")
	public String getAlluser(Model model) {
		List<Map<String, Object>> alluser = perser.getAlluser();
		model.addAttribute("alluser", alluser);
		return "alluser";

	}

	/*
	 * 通讯录
	 */
	@RequestMapping("getAlls")
	public String getAllusers(Model model) {
		List<Map<String, Object>> addressbook = perser.getAlluser();
		model.addAttribute("addressbook", addressbook);
		return "addressbook";

	}

	/*
	 * 个人员工详细信息
	 */
	@RequestMapping("getMessage")
	public String getMessage(Model model, String uid) {
		List<Map<String, Object>> getMessage = perser.getMessage(uid);
		model.addAttribute("getMessage", getMessage);
		return "personid";

	}

	/*
	 * 删除用户方法
	 */
	@RequestMapping("delUser")
	public String delUser(String uid) {
		perser.delUser(uid);
		return "getAll.do";
	}

	/*
	 * 修改：根据id绑定该员工信息
	 */
	@RequestMapping("getUserID")
	public String getUserID(Model model, String uid) {
		// 根据id查询个人信息
		List<Map<String, Object>> getuserid = perser.getUserID(uid);
		model.addAttribute("getuserid", getuserid);
		// 查询部门信息，绑定下拉框
		List<Map<String, Object>> depts = perser.getDept();
		model.addAttribute("depts", depts);
		// 查询职位信息，绑定下拉框
		List<Map<String, Object>> roles = perser.getRole();
		model.addAttribute("roles", roles);
		return "upduser";
	}

	/*
	 * 修改用户信息方法
	 */
	@RequestMapping("updUser")
	public String updUser(UserVo vo) {
		perser.updUser(vo);
		return "getAll.do";
	}
}
