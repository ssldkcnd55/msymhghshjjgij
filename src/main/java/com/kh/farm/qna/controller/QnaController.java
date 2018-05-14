package com.kh.farm.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.farm.qna.model.service.QnaService;

@Controller
public class QnaController {
@Autowired private QnaService qnaService;
}
