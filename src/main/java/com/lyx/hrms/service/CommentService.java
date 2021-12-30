package com.lyx.hrms.service;

import com.lyx.hrms.domain.Comment;
import com.lyx.hrms.domain.RoomInfo;
import com.lyx.hrms.dto.PageQueryResult;

/**
 *
 */
public interface CommentService {

    boolean add(Comment comment);

    boolean delete(Integer id);

    PageQueryResult<Comment> pageComment(RoomInfo room, Integer currentPage, Integer pageSize);
}
