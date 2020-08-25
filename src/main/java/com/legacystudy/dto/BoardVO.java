package com.legacystudy.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardVO extends PagingVO{
	
	int board_number;
	int user_idx;
	Date board_date;
	String board_title;
	String board_content;
	String name;


}
