package service;

import bean.*;

import java.util.Date;
import java.util.List;



public interface OrderService {
	
	boolean reTicket(String ono);
	
	boolean changeTicket(String ono);
	
	boolean evaluationFilm(CommentBean com);
	
	/**
	 * Generate order
	 * @param total
	 * @param uid
	 * @param sno
	 * @param fno
	 * @param ssno_arr
	 * @return
	 */
    boolean takeOrder(double total, int uid, long sno, int fno, int[] ssno_arr);

    boolean setGrades(double grades, String ono);

    //boolean takeOrderItem(double tiprice, int ssno, int ono);
	
	
	
	
}
