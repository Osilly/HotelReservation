package com.lyx.hrms.domain;

import java.io.Serializable;

/**
 *
 * 酒店客房类别
 */
public class RoomCatalog implements Serializable{
    //主键id
    private Integer id;
    //类别名称
    private String catalog;

    public RoomCatalog() {
    }

    public RoomCatalog(String catalog) {
        this.catalog = catalog;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }
}
