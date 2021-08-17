package com.team04.phonemessage;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@Slf4j
public class PhoneMessageController {
	
	@GetMapping("/test12345")
	public String callSignUpPage() {
		log.debug("### test12345.jsp 연결 ");
		return "/test12345";
	}
	

	@RequestMapping(value = "/phoneMessageSend.do", method=RequestMethod.POST) 
	public String sendSms(@RequestParam("from") String from, @RequestParam("text") String text, HttpServletRequest request) throws Exception {
		
		log.debug("### 휴대폰번호 전송 연결시 실행 ");

	    String api_key = "NCSWMUVBWOGJKM4A";
	    String api_secret = "LRH44P8FBY6Q2ZODCDSGCZNCPUQMRBJA";
	    Message coolsms = new Message(api_key, api_secret);
	    
//	    <li>보낼사람 : <input type="text" name="from"/></li>
//	    <li>내용 : <textarea name="text"></textarea></li>

	    HashMap<String, String> set = new HashMap<String, String>();
//	    set.put("to", "01023729157"); // 발신자 번호 고정 수정 NONO 
	    set.put("to", "01050435150"); // 수신측 번호
	    set.put("from", from);
	    set.put("text", text);
//	    set.put("from", (String)request.getParameter("from")); // 발신번호
//	    set.put("text", (String)request.getParameter("text")); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println(set);

	    try {
            JSONObject obj = (JSONObject) coolsms.send(set);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

	    return "redirect:main";
	  }
}
