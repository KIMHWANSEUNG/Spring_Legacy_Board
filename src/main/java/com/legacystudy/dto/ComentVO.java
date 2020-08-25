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
public class ComentVO {
	
	int coment_number;
	String name;
	String coment;
	Date coment_date;
	int coment_state;
	int c_board_number;
	int user_idx;
}
