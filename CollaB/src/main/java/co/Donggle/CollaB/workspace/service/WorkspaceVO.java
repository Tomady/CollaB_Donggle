package co.Donggle.CollaB.workspace.service;

import java.sql.Date;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
public class WorkspaceVO {
	private int workspace_id;
	private String workspace_title;
	private String id;
	private Date workspace_create_date;
}
