package dao;

import java.util.Date;
import java.util.List;

import bean.FilmBean;

public interface FilmDao {
    /**
     *  Select one film
     * @param fno
     * @return
     * @throws Exception
     */
    FilmBean select(int fno) throws Exception;

    /**
     *  Select films by keyword
     * @param keyword
     * @return
     * @throws Exception
     */
    List<FilmBean> selectByKeyword(String keyword) throws Exception;
    
    /** 
     * Select all films
     * @return
     * @throws Exception
     */
     
    List<FilmBean> select() throws Exception;

    // Update film information
    boolean updateFilm(int fno, String fname, String otime, String actor, String intro, String type, String pic,
            String country, int duration, String view, boolean forbidden) throws Exception;

    FilmBean find_one(String fname) throws Exception;

    boolean downFilm(int fno, boolean forbidden) throws Exception;

    boolean addFilm(String fname, String otime, String actor, String intro, String type, String pic, String country,
            int duration, String view) throws Exception;


}
