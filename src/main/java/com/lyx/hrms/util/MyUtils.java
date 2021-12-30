package com.lyx.hrms.util;

import org.apache.commons.codec.digest.DigestUtils;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public final class MyUtils {
    private MyUtils() {
        throw new AssertionError();
    }

    private static final String ALL_CHAR = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";

    /**
     * 将日期类型按照指定的格式转换成字符串
     *
     * @param date
     * @param pattern
     * @return
     */
    public static String dateToString(Date date, String pattern) {
        SimpleDateFormat oldFormat = new SimpleDateFormat(pattern);
        return oldFormat.format(date);
    }

    /**
     * 将指定格式的字符串转换成日期类型
     *
     * @param dateString
     * @param pattern
     * @return
     */
    public static Date stringToDate(String dateString, String pattern) {
        SimpleDateFormat oldFormat = new SimpleDateFormat(pattern);
        try {
            return oldFormat.parse(dateString);
        } catch (ParseException e) {
            throw new RuntimeException("字符串解析成日期出错");
        }
    }

    /**
     * 生成[min, max)范围的随机整数
     *
     * @param max
     * @param min
     * @return
     */
    public static int getRandomInt(int max, int min) {
        return (int) (Math.random() * (max - min) + min);
    }

    /**
     * 生成随机字符串
     *
     * @param length
     * @return
     */
    public static String getRandomCode(int length) {
        String code = ALL_CHAR;
        StringBuilder targetCode = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = getRandomInt(0, 62);
            targetCode.append(code.charAt(index));
        }
        return targetCode.toString();
    }

    /**
     * 根据随机码生成模糊图片
     * @param code   随机码
     * @param width
     * @param height
     * @return
     */
    public static BufferedImage getRandomCodeImage(String code, int width, int height) {
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
        Graphics g = bi.getGraphics();
        g.setColor(new Color(224,224,224));
        g.fillRect(0, 0, width, height);
        int size = (width - 10) / code.length();
        g.setFont(new Font("Arial", Font.BOLD, size));
        for (int i = 0; i < code.length(); i++) {
            g.setColor(new Color(getRandomInt(0, 256), getRandomInt(0, 256), getRandomInt(0, 256)));
            String currentChar = code.substring(i, i + 1);
            g.drawString(currentChar, 5 + size * i, height / 2);
        }
        g.dispose();// 图片生成
        return bi;
    }

    /**
     * 上传文件时根据文件流生成哈希码用作全局唯一文件名
     * @param in
     * @return
     */
    public static String getHashFileName(InputStream in) {
        try {
            return DigestUtils.sha1Hex(in);
        } catch (IOException e) {
            throw new RuntimeException("根据文件流生成哈希码发生错误");
        }
    }

    public static String getFilenameSuffix(String fileName) {
        int index = fileName.lastIndexOf(".");
        return index > 0 && index < fileName.length() - 1 ? fileName.substring(index) : "";
    }
}
