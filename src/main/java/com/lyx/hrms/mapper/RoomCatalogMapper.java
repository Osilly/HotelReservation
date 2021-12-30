package com.lyx.hrms.mapper;

import com.lyx.hrms.domain.RoomCatalog;

import java.util.List;

/**
 *
 */
public interface RoomCatalogMapper {

    /**
     * 增加客房类型
     *
     * @param roomCatalog
     * @return
     */
    int save(RoomCatalog roomCatalog);

    /**
     * 删除某类型
     *
     * @param id
     * @return
     */
    int delete(Integer id);

    /**
     * 根据类型名称查询客房类型
     *
     * @param catalog
     * @return
     */
    RoomCatalog selectByCatalogName(String catalog);

    /**
     * 根据id查询客房类型
     *
     * @param id
     * @return
     */
    RoomCatalog selectById(Integer id);

    /**
     * 查找所有客房类型
     *
     * @return
     */
    List<RoomCatalog> listAll();
}
