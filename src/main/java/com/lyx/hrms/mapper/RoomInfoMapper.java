package com.lyx.hrms.mapper;

import com.lyx.hrms.domain.RoomInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * 客房信息数据持久层接口
 */
public interface RoomInfoMapper {

    /**
     * 保存某间客房信息
     * @param roomInfo
     * @return
     */
    int save(RoomInfo roomInfo);

    /**
     * 删除某间客房信息
     * @param roomNum
     * @return
     */
    int deleteByRoomNum(String roomNum);

    /**
     * 修改某间客房的信息
     * @param roomInfo
     * @return
     */
    int update(RoomInfo roomInfo);

    /**
     * 改变客房状态
     * @param room
     * @return
     */
    int modifyStatus(RoomInfo room);

    /**
     * 根据房间号找到房间信息
     * @param num
     * @return
     */
    RoomInfo selectByNum(String num);

    /**
     * 查询所有客房的总数
     * @return
     */
    int count();

    /**
     * 分页查询
     * @param offset
     * @param pageSize
     * @return
     */
    List<RoomInfo> page(@Param("offset") Integer offset,
                        @Param("pageSize") Integer pageSize);

    /**
     * 根据客房类型id计数客房数量
     * @param id
     * @return
     */
    int countByRoomCatalogId(Integer id);

    /**
     * 根据客房类型id分页查询客房
     * @param roomCatalogId
     * @param offset
     * @param pageSize
     * @return
     */
    List<RoomInfo> pageByRoomCatalogId(@Param("roomCatalogId") Integer roomCatalogId,
                                       @Param("offset") Integer offset,
                                       @Param("pageSize") Integer pageSize);

    List<RoomInfo> getByVersion();
}
