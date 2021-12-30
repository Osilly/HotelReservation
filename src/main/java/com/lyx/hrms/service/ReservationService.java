package com.lyx.hrms.service;

import com.lyx.hrms.domain.Reservation;
import com.lyx.hrms.dto.PageQueryResult;
import com.lyx.hrms.enums.ReservationStatus;

import java.util.List;

/**
 *
 * 预定订单业务
 */
public interface ReservationService {

    boolean saveReservation(Reservation reservation);

    boolean modifyReservationStatus(ReservationStatus status, Integer reservationId, Integer adminId);

    PageQueryResult<Reservation> listReservationByTime(String flag,Integer currentPage,Integer pageSize);

    List<Reservation> listReservationByUserId(Integer userId);
}
