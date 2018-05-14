package com.kh.farm.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.kh.farm.chat.model.service.ChatService;

@Controller
public class ChatContoller {
 @Autowired private ChatService chatService;
}
