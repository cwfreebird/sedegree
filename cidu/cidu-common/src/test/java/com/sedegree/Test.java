package com.sedegree;

import java.io.File;
import java.util.Hashtable;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.sedegree.utils.MatrixToImageWriter;

public class Test {

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		String text = "http://10.100.72.242:8080/cidu/customer/detail/407807d55f184b01a89c37e538185a4a.do";
		int width = 300;
		int height = 300;
		// 二维码的图片格式
		String format = "gif";
		Hashtable<EncodeHintType , String> hints = new Hashtable<>();
		// 内容所使用编码
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		BitMatrix bitMatrix = new MultiFormatWriter().encode(text,
				BarcodeFormat.QR_CODE, width, height, hints);
		// 生成二维码
		File outputFile = new File("d:" + File.separator + "new.gif");
		MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);

	}

}