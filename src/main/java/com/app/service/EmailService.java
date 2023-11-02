package com.app.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/*
 * 1. 비밀번호 찾기 시, 임시 비밀번호 이메일 전송
 * 2. 회원가입 시, 인증코드 이메일 전송 
 */
@Service
public class EmailService {

	@Autowired
	@Qualifier("gmailMailSender")
	private JavaMailSender gmailMailSender;

	@Autowired
	@Qualifier("naverMailSender")
	private JavaMailSender naverMailSender;

	// naver로 임시 비밀번호 전송
	public String sendEmailNaver(String to) {

		String temporaryPW = null;
		MimeMessage mimeMessage = naverMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);

		try {
			temporaryPW = getTempPassword();

			helper.setTo(to);
			helper.setSubject("비밀번호 재설정 요청");
			helper.setText("임시 비밀번호: " + temporaryPW, true);
			helper.setFrom("bapinning_@naver.com");

			naverMailSender.send(mimeMessage);
		} catch (MessagingException e) {
			// 오류 처리
			e.printStackTrace();
		}

		return temporaryPW;
	}

	// google로 임시 비밀번호 전송
	public String sendEmailGoogle(String to) {

		String temporaryPW = null;
		MimeMessage mimeMessage = gmailMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);

		try {
			temporaryPW = getTempPassword();

			helper.setTo(to);
			helper.setSubject("비밀번호 재설정 요청");
			helper.setText("임시 비밀번호: " + temporaryPW, true);
			helper.setFrom("bapinning.project@gmail.com");

			naverMailSender.send(mimeMessage);
		} catch (MessagingException e) {
			// 오류 처리
			e.printStackTrace();
		}

		return temporaryPW;
	}

	public String getTempPassword() {

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

	// naver로 이메일 인증코드 보내기
	public String sendCodeNaver(String to) throws Exception {
		String auth_code = null; // 인증코드
		MimeMessage mimeMessage = naverMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
		try {
			auth_code = getTempPassword();

			String msgg = "";
			msgg += "<div style='margin:100px;'>";
			msgg += "<h1> 안녕하세요 밥이닝입니다. </h1>";
			msgg += "<br>";
			msgg += "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
			msgg += "<br>";
			msgg += "<p>감사합니다!<p>";
			msgg += "<br>";
			msgg += "<div align='center' style='border:1px solid black;>";
			msgg += "<h3>회원가입 인증 코드입니다.</h3>";
			msgg += "<div style='font-size:130%'>";
			msgg += "<strong>";
			msgg += auth_code + "</strong><div><br/> ";
			msgg += "</div>";

			helper.setTo(to);
			helper.setSubject("밥이닝 회원가입 이메일 인증 ");
			helper.setFrom("bapinning_@naver.com");
			mimeMessage.setText(msgg, "utf-8", "html");

			naverMailSender.send(mimeMessage);
		} catch (MessagingException e) {
			// 오류 처리
			e.printStackTrace();
		}
		return auth_code;
	}

	// google로 이메일 인증코드 보내기
	public String sendCodeGoogle(String to) throws Exception {
		String auth_code = null; // 인증코드
		MimeMessage mimeMessage = gmailMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
		try {
			auth_code = getTempPassword();

			String msgg = "";
			msgg += "<div style='margin:100px;'>";
			msgg += "<h1> 안녕하세요 밥이닝입니다. </h1>";
			msgg += "<br>";
			msgg += "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
			msgg += "<br>";
			msgg += "<p>감사합니다!<p>";
			msgg += "<br>";
			msgg += "<div align='center' style='border:1px solid black;>";
			msgg += "<h3>회원가입 인증 코드입니다.</h3>";
			msgg += "<div style='font-size:130%'>";
			msgg += "<strong>";
			msgg += auth_code + "</strong><div><br/> ";
			msgg += "</div>";

			helper.setTo(to);
			helper.setSubject("밥이닝 회원가입 이메일 인증 ");
			helper.setFrom("bapinning.project@gmail.com");
			mimeMessage.setText(msgg, "utf-8", "html");

			naverMailSender.send(mimeMessage);
		} catch (MessagingException e) {
			// 오류 처리
			e.printStackTrace();
		}
		return auth_code;
	}
}