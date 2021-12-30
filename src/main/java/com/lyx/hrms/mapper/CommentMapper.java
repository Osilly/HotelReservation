package com.lyx.hrms.mapper;

import com.lyx.hrms.domain.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * 评论的持久层接口
 */
public interface CommentMapper {

    int save(Comment comment);

    int delete(Integer id);

    List<Comment> listByUserId(Integer id);

    List<Comment> listByRoomInfoId(Integer id);

    int countByRoomInfoId(Integer roomInfoId);

    List<Comment> pageByRoomInfoId(
            @Param("roomInfoId") Integer roomInfoId,
            @Param("offset") Integer offset,
            @Param("pageSize") Integer pageSize);
}
