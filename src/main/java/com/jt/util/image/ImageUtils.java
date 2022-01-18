package com.jt.util.image;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.imageio.ImageIO;


public class ImageUtils {

	//실제파일, 썸네일파일,확장자(type),W,H
	public static void createThumbnail(String load, String save, String type, int w, int h) {
		try {
			BufferedInputStream stream_file = new BufferedInputStream(new FileInputStream(load));			
			try {
				createThumbnail(stream_file, save,type,w,h);
			} catch (Exception e) {
			}finally{
				stream_file.close();
			}
		} catch (Exception e) {
		}	
	}

	public static void createThumbnail(BufferedInputStream stream_file, String save,String type,int w,int h) {
		try {
			BufferedImage originalImg = ImageIO.read(stream_file);
			int orgWidth = originalImg.getWidth();
			int orgHeight = originalImg.getHeight();
			
			//큰쪽을 기준으로 리사이징..
			if (orgWidth > orgHeight){				
				getImageThumbnail(originalImg,save,type,0,h);
			}else{
				getImageThumbnail(originalImg,save,type,w,0);
			}
			
			BufferedInputStream stream_resize_file = new BufferedInputStream(new FileInputStream(save));

			if (type.toLowerCase().equals("gif")) {
				getGifImageThumbnailCrop(stream_resize_file,save,w,h);
			} else {
				getImageThumbnailCrop(stream_resize_file,save,type,w,h);
			}
		} catch (Exception e) {
			System.out.println(e.toString());			
		}
	}


	//resize
	public static void createResizeImage(String load, String save, String type, int w, int h) {
		try {
			BufferedInputStream stream_file = new BufferedInputStream(new FileInputStream(load));
			try {
				if (type.toLowerCase().equals("gif")) {
					getGifImageThumbnail(stream_file,save,w,h);
				} else {
					getImageThumbnail(stream_file,save,type,w,h);
				}
			} catch (Exception e) {
			}finally{
				stream_file.close();
			}
		} catch (Exception e) {
		}	
	}

	
  
	public static void getImageThumbnailCrop(BufferedInputStream stream_file, String save, String type,int maxWidth, int maxHeight) {
		double xyRatio = 1.0;
		try {			
			File  file = new File(save);

			BufferedImage originalImg = originalImg = ImageIO.read(stream_file);
			/*
			if (type.toLowerCase().equals("jpg")) {
				try{
					com.sun.image.codec.jpeg.JPEGImageDecoder jpegDecoder =  JPEGCodec.createJPEGDecoder (stream_file);
					originalImg = jpegDecoder.decodeAsBufferedImage();
				}catch(Exception e){
					originalImg = ImageIO.read(stream_file);
				}
			}else{		
				originalImg = ImageIO.read(stream_file);
			}
			*/			
			
			int[] centerPoint = { originalImg.getWidth() /2, originalImg.getHeight() / 2 };

			int orgWidth = originalImg.getWidth();
			int orgHeight = originalImg.getHeight();
			
			int cropWidth = maxWidth;
			int cropHeight = maxHeight;
			int targetWidth = cropWidth;
  			int targetHeight = cropHeight;
			
			
			if (cropWidth >= cropHeight){
				xyRatio = (float) cropHeight/cropWidth;
			}else{
				xyRatio = (float) cropWidth/cropHeight;
			}
			
			if (maxWidth==0) maxWidth = (int) ((float) maxHeight*xyRatio );
			if (maxHeight==0) maxHeight = (int) ((float) maxWidth*xyRatio );
			
			
			//=======================================================
			if( cropHeight > cropWidth * xyRatio ) {
				cropHeight = (int) (cropWidth * xyRatio);
			} else {
				cropWidth = (int) ( (float) cropHeight / xyRatio) ;
			}
			
			if (orgWidth < cropWidth) cropWidth =  orgWidth;
			if (orgHeight < cropHeight) cropHeight =  orgHeight;
			
			
			targetWidth = cropWidth;
  			targetHeight = cropHeight;
  			
  			if (targetWidth > targetHeight){  				
				if( targetHeight > maxHeight) {
					targetHeight = maxHeight;
					targetWidth = (int) (targetHeight * xyRatio);
				}
  			}else{
				if( targetWidth > maxWidth) {
					targetWidth = maxWidth;
					targetHeight = (int) (targetWidth * xyRatio);
				}
  			}
			BufferedImage targetImage = new BufferedImage(targetWidth, targetHeight, BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics2D = targetImage.createGraphics();
			graphics2D.setBackground(Color.WHITE);
			graphics2D.setPaint(Color.WHITE);
			graphics2D.fillRect(0, 0, targetWidth, targetHeight);
			graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
			graphics2D.drawImage(originalImg, 0, 0, targetWidth, targetHeight,   centerPoint[0] - (int)(cropWidth /2) , centerPoint[1] - (int)(cropHeight /2), centerPoint[0] + (int)(cropWidth /2), centerPoint[1] + (int)(cropHeight /2), null);
	      
			ImageIO.write(targetImage, type, file);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public static void getGifImageThumbnailCrop(BufferedInputStream stream_file,String save,int maxWidth, int maxHeight) {
		double xyRatio = 1.0;
		
  		GifDecoder dec = new GifDecoder();
  		AnimatedGifEncoder enc = new AnimatedGifEncoder();
  		dec.read(stream_file);

  		int cnt = dec.getFrameCount();

  		int delay = 0;

  		try{
  			enc.start(save);
  			enc.setRepeat(0);

  			for (int i = 0; i < cnt; i++) {
  	  				
  				BufferedImage originalImg = dec.getFrame(i);
  				int[] centerPoint = { originalImg.getWidth() /2, originalImg.getHeight() / 2 };
  				
  				int orgWidth = originalImg.getWidth();
  				int orgHeight = originalImg.getHeight();
  				
  				int cropWidth = maxWidth;
  				int cropHeight = maxHeight;
  				int targetWidth = cropWidth;
  	  			int targetHeight = cropHeight;
  				
  				
  				if (cropWidth >= cropHeight){
  					xyRatio = (float) cropHeight/cropWidth;
  				}else{
  					xyRatio = (float) cropWidth/cropHeight;
  				}
  				
  				if (maxWidth==0) maxWidth = (int) ((float) maxHeight*xyRatio );
  				if (maxHeight==0) maxHeight = (int) ((float) maxWidth*xyRatio );
  				
  				
  				//=======================================================
  				if( cropHeight > cropWidth * xyRatio ) {
  					cropHeight = (int) (cropWidth * xyRatio);
  				} else {
  					cropWidth = (int) ( (float) cropHeight / xyRatio) ;
  				}
  				
  				if (orgWidth < cropWidth) cropWidth =  orgWidth;
  				if (orgHeight < cropHeight) cropHeight =  orgHeight;
  				
  				
  				targetWidth = cropWidth;
  	  			targetHeight = cropHeight;
  	  			
  	  			if (targetWidth > targetHeight){  				
  					if( targetHeight > maxHeight) {
  						targetHeight = maxHeight;
  						targetWidth = (int) (targetHeight * xyRatio);
  					}
  	  			}else{
  					if( targetWidth > maxWidth) {
  						targetWidth = maxWidth;
  						targetHeight = (int) (targetWidth * xyRatio);
  					}
  	  			}
  	  			
  				BufferedImage targetImage = new BufferedImage(targetWidth, targetHeight, BufferedImage.TYPE_4BYTE_ABGR);  				
  				Graphics2D graphics2D = targetImage.createGraphics();
  				graphics2D.setBackground(Color.WHITE);
  				graphics2D.setPaint(Color.WHITE);
  				graphics2D.fillRect(0, 0, targetWidth, targetHeight);
  				graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
  				graphics2D.drawImage(originalImg, 0, 0, targetWidth, targetHeight,   centerPoint[0] - (int)(cropWidth /2) , centerPoint[1] - (int)(cropHeight /2), centerPoint[0] + (int)(cropWidth /2), centerPoint[1] + (int)(cropHeight /2), null);
  				enc.setDelay(delay);
  				enc.addFrame(targetImage);
  			}

  			enc.finish();
  		}catch(Exception ex){
  		}

	}	
	
	public static void getImageThumbnail(BufferedInputStream stream_file,String save, String type, int w,int h) {
		float xyRatio = 1;
		try {
			File  file = new File(save);
			BufferedImage bi = ImageIO.read(stream_file);
			int width = bi.getWidth();
			int height = bi.getHeight();
			
			if (w<=0){
				xyRatio = (float) width/height;
				w = (int) (h*xyRatio);
			}
			if (h<=0){
				xyRatio = (float) height/width;
				h = (int) (w*xyRatio);
			}
			
			if (w < width) { width = w; }
			if (h < height) { height = h; }

			BufferedImage bufferIm = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

			Image atemp = bi.getScaledInstance(width, height, Image.SCALE_AREA_AVERAGING);

			Graphics2D  g2 = bufferIm.createGraphics();
			g2.drawImage(atemp, 0, 0, width, height, null);
			ImageIO.write(bufferIm, type, file);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}	
	
	public static void getImageThumbnail(BufferedImage bi ,String save, String type, int w,int h) {
		float xyRatio = 1;
		try {
			File  file = new File(save);
			
			int width = bi.getWidth();
			int height = bi.getHeight();
			
			if (w<=0){
				xyRatio = (float) width/height;
				w = (int) (h*xyRatio);
			}
			if (h<=0){
				xyRatio = (float) height/width;
				h = (int) (w*xyRatio);
			}
			
			if (w < width) { width = w; }
			if (h < height) { height = h; }

			BufferedImage bufferIm = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

			Image atemp = bi.getScaledInstance(width, height, Image.SCALE_AREA_AVERAGING);

			Graphics2D  g2 = bufferIm.createGraphics();
			g2.drawImage(atemp, 0, 0, width, height, null);
			ImageIO.write(bufferIm, type, file);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}		
	
  	public static void getGifImageThumbnail(BufferedInputStream stream_file,String save,int w,int h) {
  		double xyRatio = 1.0;
  		
  		GifDecoder dec = new GifDecoder();
  		AnimatedGifEncoder enc = new AnimatedGifEncoder();
  		dec.read(stream_file);
  		int cnt = dec.getFrameCount();

  		int delay = 0;
  		int width = 0;
  		int height = 0;

  		try{
  			enc.start(save);
  			enc.setRepeat(0);
  			for (int i = 0; i < cnt; i++) {
  				BufferedImage frame = dec.getFrame(i);
  				delay = dec.getDelay(i);
	
  				width = frame.getWidth();
  				height = frame.getHeight();
  				  			
  				if (w<=0){
  					xyRatio = (float) width/height;
  					w = (int) (h*xyRatio);
  				}
  				if (h<=0){
  					xyRatio = (float) height/width;
  					h = (int) (w*xyRatio);
  				}
  				
  				if (w < width) { width = w; }
  				if (h < height) { height = h; }
	
  				BufferedImage destimg = new BufferedImage(width, height, BufferedImage.TYPE_4BYTE_ABGR);
  				Graphics2D g = destimg.createGraphics();
	
  				g.drawImage(frame, 0, 0, width, height, null);
  				enc.setDelay(delay);
	
  				enc.addFrame(destimg);
  			}

  			enc.finish();
  		}catch(Exception ex){
  		}

	}
  

}

