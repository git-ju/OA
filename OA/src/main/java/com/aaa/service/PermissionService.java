package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.UserVo;

public interface PermissionService {

	List<Map<String, Object>> findByLoginRole(Integer RoleID);

	int updPwd(UserVo uservo);

	List<Map<String, Object>> login(UserVo uservo);

	List<Map<String, Object>> getUser(Integer rid, String uid);

	int sysLog(String uid);

	List<Map<String, Object>> getDept();

	List<Map<String, Object>> getAlluser();

	List<Map<String, Object>> getMessage(String uid);

	int delUser(String uid);

	int updUser(UserVo vo);

	List<Map<String, Object>> getUserID(String uid);

	List<Map<String, Object>> getRole();

}
