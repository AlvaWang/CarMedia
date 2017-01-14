package com.media.car.controller.dto;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author yingjun
 *
 * ajax 请求的返回类型封装JSON结果
 * 
 * 主要用于bootstrap table
 */
public class BootStrapTableResult<T> implements Serializable {

	private static final long serialVersionUID = -4185151304730685014L;

    private List<T> data;
	private int sum;

	public BootStrapTableResult(List<T> data) {
		super();
		this.data = data;
	}

	public BootStrapTableResult(List<T> data , int sum) {
		super();
		this.data = data;
		this.sum = sum;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}
}
