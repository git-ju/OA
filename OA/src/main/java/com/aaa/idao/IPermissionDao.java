package com.aaa.idao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.UserVo;

public interface IPermissionDao {

	List<Map<String, Object>> findByLoginRole(Integer RoleID);

	int updPwd(UserVo uservo);

	List<Map<String, Object>> login(UserVo uservo);

	List<Map<String, Object>> getUser(@Param("uid") String uid,
			@Param("rid") Integer rid);

	int sysLog(String uid);

	List<Map<String, Object>> getDept();

	List<Map<String, Object>> getAlluser();

	List<Map<String, Object>> getMessage(String uid);

	int delUser(String uid);

	int updUser(UserVo vo);

	List<Map<String, Object>> getUserID(String uid);

	List<Map<String, Object>> getRole();

}
