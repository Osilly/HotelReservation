package com.lyx.hrms.domain;

import java.io.Serializable;
import java.util.Date;

/**
 *
 */
public class Promotion implements Serializable{
    //主键id
    private Integer id;
    //标题
    private String title;
    //内容
    private String content;
    //发布时间
    private Date pubDate;


    public Promotion() {
    }

    public Promotion(String title, String content, Date pubDate) {
        this.title = title;
        this.content = content;
        this.pubDate = pubDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPubDate() {
        return pubDate;
    }

    public void setPubDate(Date pubDate) {
        this.pubDate = pubDate;
    }
}
