package com.lyx.hrms.service;

import com.lyx.hrms.domain.Promotion;

import java.util.List;

/**
 *
 * 酒店活动业务层
 */
public interface PromotionService {

    boolean add(Promotion promotion);

    boolean delete(Integer id);

    List<Promotion> listAll();
}
