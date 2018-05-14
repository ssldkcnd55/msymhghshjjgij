package com.kh.farm.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.farm.notice.model.service.NoticeService;

@Controller
public class NoticeController {
@Autowired private NoticeService noticeService;
}
