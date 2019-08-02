package com.kh.coworks.websocket;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebSocketController {
	@RequestMapping("/notifyApproval")
	public String ckReceiveApproval(Model model, HttpServletRequest request) {

		return null;
	}
}
