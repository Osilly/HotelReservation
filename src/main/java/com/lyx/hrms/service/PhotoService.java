package com.lyx.hrms.service;

import com.lyx.hrms.domain.RoomPhoto;

/**
 *
 */
public interface PhotoService {

    boolean add(RoomPhoto photo);

    boolean delete(Integer id);
}
