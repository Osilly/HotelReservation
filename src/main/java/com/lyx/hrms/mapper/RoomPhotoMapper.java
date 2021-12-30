package com.lyx.hrms.mapper;

import com.lyx.hrms.domain.RoomPhoto;

import java.util.List;

/**
 *
 * 客房图片-数据持久化接口
 */
public interface RoomPhotoMapper {

    /**
     * 保存一张客房图片
     * @param roomPhoto
     * @return
     */
    int save(RoomPhoto roomPhoto);

    /**
     * 删除一张图片
     * @param id
     * @return
     */
    int delete(Integer id);

    /**
     * 根据房间号删除所有照片
     * @param roomId
     * @return
     */
    int deleteByRoomId(Integer roomId);

    /**
     * 根据客房信息id查看其图片展示
     * @param id
     * @return
     */
    List<RoomPhoto> listByRoomInfoId(Integer id);
}
