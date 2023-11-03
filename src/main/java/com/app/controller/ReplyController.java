package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.service.ReplyService;

@Controller
@RequestMapping(value = "/retrieve", method = RequestMethod.GET)
public class ReplyController {

	@Autowired
	ReplyService replyService;
	
}
