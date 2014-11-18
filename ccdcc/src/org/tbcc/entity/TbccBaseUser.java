package org.tbcc.entity;

import java.io.Serializable;

/**
 * ����һ��ͨ�õ��û������
 * @author Administrator
 *
 */
public class TbccBaseUser implements Serializable {
	
	
	private Long id;
	private String uname;
	private String upassword;
	

	private Integer roleId;
	//����һ���ͻ���
	private TbccClient client ;
	private Integer uenable;
	private String ucreated;
	private Integer isShowAddress;//�Ƿ��ڲ�ѯ������ʷ��¼ʱ��ʾλ����Ϣ����γ�Ⱥ�ʵ�ʵ���λ�ã�
	public TbccBaseUser(){
		super();
	}
	
	
	public TbccBaseUser(Long id, String uname, String upassword,
			Integer roleId, TbccClient client, Integer uenable, String ucreated,Integer isShowAddress) {
		super();
		this.id = id;
		this.uname = uname;
		this.upassword = upassword;
		this.roleId = roleId;
		this.client = client;
		this.uenable = uenable;
		this.ucreated = ucreated;
		this.isShowAddress = isShowAddress;
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public TbccClient getClient() {
		return client;
	}
	public void setClient(TbccClient client) {
		this.client = client;
	}
	public Integer getUenable() {
		return uenable;
	}
	public void setUenable(Integer uenable) {
		this.uenable = uenable;
	}
	public String getUcreated() {
		return ucreated;
	}
	public void setUcreated(String ucreated) {
		this.ucreated = ucreated;
	}


	public Integer getIsShowAddress() {
		return isShowAddress;
	}


	public void setIsShowAddress(Integer isShowAddress) {
		this.isShowAddress = isShowAddress;
	}
		
}
