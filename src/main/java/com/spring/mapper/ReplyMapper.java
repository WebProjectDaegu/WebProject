package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.domain.ReplyDTO;

public interface ReplyMapper {
	public void register(ReplyDTO replyDTO);
	public List<FestivalDTO> getreply(BoardDTO boardDTO);
	public void deletereply(ReplyDTO replyDTO);
	public void rewrite(ReplyDTO replyDTO);
}
