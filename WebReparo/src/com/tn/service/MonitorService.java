package com.tn.service;

import org.hyperic.sigar.CpuInfo;
import org.hyperic.sigar.CpuPerc;
import org.hyperic.sigar.Mem;
import org.hyperic.sigar.OperatingSystem;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;

import com.tn.domain.MonitorInfoBean;

public class MonitorService {

	private MonitorInfoBean monitorInfoBean;

	/**
	 * 获得CPU 内存等信息
	 * 
	 * @return
	 */
	public MonitorInfoBean getMonitorInfo() {
		MonitorInfoBean monitorInfoBean = new MonitorInfoBean();
		OperatingSystem OS = OperatingSystem.getInstance();
		Sigar sigar = new Sigar();
		Mem mem = null;
		try {
			mem = sigar.getMem();
		} catch (SigarException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		monitorInfoBean.setOsName(OS.getVendorName());

		monitorInfoBean.setTotalMemory(mem.getTotal());
		monitorInfoBean.setUsedMemory(mem.getUsed());
		monitorInfoBean.setFreeMemory(mem.getFree());
		monitorInfoBean.setUsedMemoryRatio((double) mem.getUsed()
				/ (double) mem.getTotal());
		// CpuInfo infos[]=null;
		CpuPerc cpuList[] = null;
		try {
			// infos = sigar.getCpuInfoList();
			cpuList = sigar.getCpuPercList();
		} catch (SigarException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		double total = 0.0;
		double avg = 0.0;
		for (int i = 0; i < cpuList.length; i++) {
			total += cpuList[i].getCombined();
		}
		avg = total / cpuList.length;
		monitorInfoBean.setCpuNum(cpuList.length);
		monitorInfoBean.setCpuRatio(avg);
		return monitorInfoBean;

	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MonitorService monitorService =new MonitorService();
		MonitorInfoBean monitorInfoBean=monitorService.getMonitorInfo();
		System.out.println(monitorInfoBean);
	}

}
