package com.sedegree.thread;

import org.apache.commons.lang.StringUtils;

import com.sedegree.utils.MatrixToImageWriter;

public class CreateMatrixThread implements Runnable {

	private String text;
	
	private String imageFullPath;
	
	public CreateMatrixThread(String text, String imageFullPath){
		this.text = text;
		this.imageFullPath = imageFullPath;
	}
	@Override
	public void run() {
		if(StringUtils.isNotBlank(text)
				&& StringUtils.isNotBlank(imageFullPath)){
			MatrixToImageWriter.createBitMatrixImage(text, imageFullPath);
			System.out.println("==thread running===" + Thread.currentThread().getId());
		}
	}

}
