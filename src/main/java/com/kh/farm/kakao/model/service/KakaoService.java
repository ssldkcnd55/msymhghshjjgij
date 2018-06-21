package com.kh.farm.kakao.model.service;


import java.util.List;

import com.kh.farm.kakao.model.vo.Kakao;

public interface KakaoService {
	
	Kakao selectKakaoId(Kakao kakao);

	int insertKakaoInfo(Kakao kakao);

	int updateKakaoInfo(Kakao kakao);

	List<Kakao> selectKakaoInfo(Kakao kakao);

}
