package com.aaa.entity;

public class RoleVo {

	private Integer RoleID;// 角色ID
	private String RoleName;// 角色名称
	private Integer TopRoleID;// 上级角色ID
	private Integer DeptID;// 部门ID

	public Integer getRoleID() {
		return RoleID;
	}

	public void setRoleID(Integer roleID) {
		RoleID = roleID;
	}

	public String getRoleName() {
		return RoleName;
	}

	public void setRoleName(String roleName) {
		RoleName = roleName;
	}

	public Integer getTopRoleID() {
		return TopRoleID;
	}

	public void setTopRoleID(Integer topRoleID) {
		TopRoleID = topRoleID;
	}

	public Integer getDeptID() {
		return DeptID;
	}

	public void setDeptID(Integer deptID) {
		DeptID = deptID;
	}

}
