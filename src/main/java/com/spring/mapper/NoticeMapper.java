package com.spring.mapper;

import java.util.List;

import com.spring.domain.NoticeDTO;

public interface NoticeMapper {
	public void writeNotice();
	public NoticeDTO getnoticedetail(int nno);
	public List<NoticeDTO> getNoticeList();
	
}
