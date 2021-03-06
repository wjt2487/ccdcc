package org.tbcc.entity;

/**
 * TbccProjectImages generated by MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class TbccProjectImages implements java.io.Serializable {

	// Fields

	private Long id;
	private String projectId;
	private String imageName;
	private Integer listNo;
	private String imagePath;

	// Constructors

	/** default constructor */
	public TbccProjectImages() {
	}

	/** minimal constructor */
	public TbccProjectImages(String projectId, String imageName,
			Integer listNo, String imagePath) {
		this.projectId = projectId;
		this.imageName = imageName;
		this.listNo = listNo;
		this.imagePath = imagePath;
	}


	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProjectId() {
		return this.projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getImageName() {
		return this.imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public Integer getListNo() {
		return this.listNo;
	}

	public void setListNo(Integer listNo) {
		this.listNo = listNo;
	}

	public String getImagePath() {
		return this.imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

}