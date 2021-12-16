package com.spring.service;

import java.util.List;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.domain.ReplyDTO;

public interface ReplyService {
	public void register(ReplyDTO replyDTO);
	public void delete(ReplyDTO replyDTO);
	public void rewrite(ReplyDTO replyDTO);
	public List<FestivalDTO> getReply(BoardDTO boardDTO);
	public void MinusWriter(BoardDTO boardDTO);
	public void PlusWriter(BoardDTO boardDTO);
	

}
