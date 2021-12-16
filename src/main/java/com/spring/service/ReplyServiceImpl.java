package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.domain.ReplyDTO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	ReplyMapper mapper;
	@Autowired
	BoardMapper boardMapper;
	public void register(ReplyDTO replyDTO) {
		mapper.register(replyDTO);
	}
	@Override
	public List<FestivalDTO> getReply(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return mapper.getreply(boardDTO);
	}
	@Override
	public void PlusWriter(BoardDTO boardDTO) {
		boardMapper.PlusWriter(boardDTO);
		
	}
	@Override
	public void MinusWriter(BoardDTO boardDTO) {
		boardMapper.MinusWriter(boardDTO);
		
	}
	@Override
	public void delete(ReplyDTO replyDTO) {
		mapper.deletereply(replyDTO);
		
	}
	@Override
	public void rewrite(ReplyDTO replyDTO) {
		mapper.rewrite(replyDTO);
		
	}
}
