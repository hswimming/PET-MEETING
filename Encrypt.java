package com.petmeeting.mvc.common.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class Encrypt {

	public static String Salt() {
		
		String salt="";
		SecureRandom random;
		
			try {
				
				random = SecureRandom.getInstance("SHA1PRNG");
				byte[] bytes = new byte[16];
				random.nextBytes(bytes);
				salt = new String(Base64.getEncoder().encode(bytes));
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		
		return salt;
	}
	
	public static String SHA512(String password, String hash) {
		
		String salt = hash + password;
		String hex = null;
		MessageDigest msg;
		
		try {
			
			msg = MessageDigest.getInstance("SHA-512");
			msg.update(salt.getBytes());
			hex = String.format("%128x", new BigInteger(1, msg.digest()));
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return hex;
	}
	
	public static String SHA512(String password) {
		
		String hex = null;
		MessageDigest msg;
		
		try {
			
			msg = MessageDigest.getInstance("SHA-512");
			msg.update(password.getBytes());
			hex = String.format("%128x", new BigInteger(1, msg.digest()));
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return hex;
	}
	
	
	
	
}
