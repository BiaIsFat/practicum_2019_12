package service;

import bean.*;

import java.util.Date;
import java.util.List;



public interface FilmService {

	boolean downFilm(int fno);
	
	List<Object> findView();
	
	List<FilmBean> findAll();
	
	List<FilmBean> findByKeyword(String keyword);//关键字查看
	
	FilmBean findOne(int fno);//查看某一部

    boolean upFilm(String fname, String otime, String actor, String intro, String type, String pic, String country,
            int duration, String view);

    boolean changeFilmInfo(int fno, String fname, String otime, String actor, String intro, String type, String pic,
            String country, int duration, String view, boolean forbidden);

}
