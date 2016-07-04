package com.tn.domain;

public class MonitorInfoBean {
	
	/**
	 * 系统名称
	 */
	private String osName;

	/**
	 * 内存总量
	 */
	private long totalMemory;

	/**
	 * 可用内存
	 */
	private long freeMemory;

	/**
	 * 已用内存
	 */
	private long usedMemory;
	
	/**
	 * 内存利用率
	 */
	private double usedMemoryRatio;
    
	/**
	 * cpu核数
	 */
	private int cpuNum;
	
	/**
	 * cpu利用率
	 */
	private double cpuRatio;

	public String getOsName() {
		return osName;
	}

	public void setOsName(String osName) {
		this.osName = osName;
	}

	public long getTotalMemory() {
		return totalMemory;
	}

	public void setTotalMemory(long totalMemory) {
		this.totalMemory = totalMemory;
	}

	public long getFreeMemory() {
		return freeMemory;
	}

	public void setFreeMemory(long freeMemory) {
		this.freeMemory = freeMemory;
	}

	public long getUsedMemory() {
		return usedMemory;
	}

	public void setUsedMemory(long usedMemory) {
		this.usedMemory = usedMemory;
	}

	public double getUsedMemoryRatio() {
		return usedMemoryRatio;
	}

	public void setUsedMemoryRatio(double usedMemoryRatio) {
		this.usedMemoryRatio = usedMemoryRatio;
	}

	public int getCpuNum() {
		return cpuNum;
	}

	public void setCpuNum(int cpuNum) {
		this.cpuNum = cpuNum;
	}

	public double getCpuRatio() {
		return cpuRatio;
	}

	public void setCpuRatio(double cpuRatio) {
		this.cpuRatio = cpuRatio;
	}

	@Override
	public String toString() {
		return "MonitorInfoBean [osName=" + osName + ", totalMemory="
				+ totalMemory + ", freeMemory=" + freeMemory + ", usedMemory="
				+ usedMemory + ", usedMemoryRatio=" + usedMemoryRatio
				+ ", cpuNum=" + cpuNum + ", cpuRatio=" + cpuRatio + "]";
	}


	
}