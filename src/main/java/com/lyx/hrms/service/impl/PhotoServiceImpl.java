package com.lyx.hrms.service.impl;

import com.lyx.hrms.domain.RoomPhoto;
import com.lyx.hrms.mapper.RoomPhotoMapper;
import com.lyx.hrms.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 */
@Service
public class PhotoServiceImpl implements PhotoService {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private RoomPhotoMapper photoMapper;

    @Override
    public boolean add(RoomPhoto photo) {
        return photoMapper.save(photo)==1;
    }

    @Override
    public boolean delete(Integer id) {
        return photoMapper.delete(id)==1;
    }
}
