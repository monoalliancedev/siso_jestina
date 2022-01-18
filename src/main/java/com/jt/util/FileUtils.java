package com.jt.util;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.Calendar;



public class FileUtils {
	public static boolean mkdir(String path){
		try{
			File dir = new File(path);
			if (!dir.exists()) dir.mkdirs();
			return true;
		}catch (Exception ex){
			return false;
		}
	}

	public static boolean moveFile(File oldfile, File newfile){
		try{
			newfile.delete();
		}catch(Exception e){
		}
		try{			
			oldfile.renameTo(newfile);
			oldfile.delete();
			return true;
		}catch(Exception e){
			System.out.print(e.toString());
			return false;
		}
	}

	public static boolean copyFile_x(File oldfile, File newfile){
		try{
			oldfile.renameTo(newfile);
			return true;
		}catch(Exception e){
			System.out.print(e.toString());
			return false;
		}
	}

	public static boolean copyFile(String oldfile, String newfile){
		DataInputStream in;
		DataOutputStream out;
		try{
			in = new DataInputStream(new FileInputStream(oldfile));
			out = new DataOutputStream(new FileOutputStream(newfile));
			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) > 0){
				out.write(buf,0,len);
			}
			in.close();
			out.close();

			return true;
		}catch(Exception e){
			System.out.print(e.toString());
			return false;
		}
	}


	public static boolean delFile(String delfile){
		try{
			File f = new File (delfile);
			if (f.isFile()) f.delete();
			
			System.out.println("#### delfile : " + delfile);
			return true;
			
		}catch(Exception e){
			return false;
		}
	}


	public static boolean delFile(String filename, String uploadpath){
		try{
			File del_file = new File (uploadpath+"/"+filename);
			del_file.delete();
			return true;
		}catch(Exception e){
			return false;
		}
	}

	public static String extractFileName(String filepath){
		String full_filename = filepath;
		int file = filepath.lastIndexOf("/");
		int ext =  filepath.lastIndexOf(".");
		int length =  filepath.length();
		String filename = filepath.substring(file+1,ext);
		String extname = filepath.substring(ext+1,length);
		full_filename = filename+"."+extname;

		return full_filename;
	}

	public static String extractFilePath(String filepath){
		return filepath.substring(0,filepath.lastIndexOf("/"));
	}


	public static void delImgAndThumb(String path, String filename){
		if (!filename.equals("")){
			delFile(path+"/"+filename);
			delFile(path+"/"+extractFilePath(filename)+"/thumb_"+extractFileName(filename));
		}
	}


	public static String getUploadImagePath(String documentRoot){
		String path = "";
		DecimalFormat df = new DecimalFormat("00");
		Calendar cal = Calendar.getInstance();
		int _cur_y = cal.get(Calendar.YEAR);

		String defYear = String.valueOf(_cur_y);
		String defMonth = df.format(cal.get(Calendar.MONTH) + 1);
		String defDay = df.format(cal.get(Calendar.DATE));
		path = defYear+"/"+defMonth+"/"+defDay;
		if (!mkdir(documentRoot+"/"+path)){
			path = "";
		}			
		return path;
	}		
}
