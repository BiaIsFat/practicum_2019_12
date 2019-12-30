package service;

import java.util.List;

import bean.RoomBean;

public interface RoomService {

    RoomBean selectByname(String room);

    List<RoomBean> find_all();

    List<RoomBean> findByCadmin(String account);

}