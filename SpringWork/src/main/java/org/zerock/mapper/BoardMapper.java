package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardMapper {

	//@Select("select * FROM tb1_board WHERE bno>0")
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	//public void insertSelectKey(BoardVO board);
	public BoardVO read(Long bno);
	public int update(BoardVO board);
	public int delete(Long bno);
	
}
