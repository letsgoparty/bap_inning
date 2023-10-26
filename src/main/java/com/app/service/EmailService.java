package com.app.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.dto.MemberDTO;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public String sendEmail(String email) {
	
		String temporaryPW = null;
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
		
		try {
			temporaryPW = getTempPassword();
			
			helper.setTo(email);
			helper.setSubject("비밀번호 재설정 요청");
            helper.setText("임시 비밀번호: " + temporaryPW, true);
            helper.setFrom("bapinning_@naver.com");
            
            mailSender.send(mimeMessage);
		} catch (MessagingException e) {
            // 오류 처리
            e.printStackTrace();
        }
		
		return temporaryPW;
	}
	
    public String getTempPassword(){
				// 임시 비밀번호를 위한 문자 세트
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }
}