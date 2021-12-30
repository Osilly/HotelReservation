package com.lyx.hrms.mapper;

import com.lyx.hrms.domain.Promotion;

import java.util.List;

/**
 *
 */
public interface PromotionMapper {

    int save(Promotion promotion);

    int delete(Integer id);

    int update(Promotion promotion);

    Promotion findById(Integer id);

    List<Promotion> listAll();
}
