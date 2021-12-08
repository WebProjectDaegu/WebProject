package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.NoticeDTO;
import com.spring.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeMapper mapper;
	@Override
	public List<NoticeDTO> getlist() {
		
		return mapper.getNoticeList();
	}

}
