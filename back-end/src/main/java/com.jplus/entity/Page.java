
package com.jplus.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 用于分页
 */
public class Page<T> implements Serializable {

	private int pageSize;
	private int currentPage;
	private int totalRecord;
	private int totalPage;
	private List<T> dataList;
	private T searchModel;//保存查询条件


	public Page(int pageSize, int currentPage, int totalRecord, List<T> dataList) {
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		this.currentPage=currentPage;
		this.dataList = dataList;
//修改之后
		if (totalRecord % pageSize == 0) {
			this.totalPage = totalRecord / pageSize;
		} else {
			this.totalPage = totalRecord / pageSize + 1;
		}
		if(currentPage>totalPage){
			this.currentPage=totalPage;
		}
		if(currentPage<=0){
			this.currentPage=1;
		}
	}
	public Page(int pageSize, int totalRecord, List<T> dataList) {
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		this.dataList = dataList;
		if (totalRecord % pageSize == 0) {
			this.totalPage = totalRecord / pageSize;
		} else {
			this.totalPage = totalRecord / pageSize + 1;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		if (currentPage < 1) {
			this.currentPage = 1;
		} else if (currentPage > totalPage) {
			this.currentPage = totalPage;
		}
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage < 1) {
			this.currentPage = 1;
		} else if (currentPage > totalPage) {
			this.currentPage = totalPage;
		} else {
			this.currentPage = currentPage;
		}
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {

		this.totalRecord = totalRecord;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public T getSearchModel() {
		return searchModel;
	}

	public void setSearchModel(T searchModel) {
		this.searchModel = searchModel;
	}
}
