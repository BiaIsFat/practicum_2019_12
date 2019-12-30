package dao;

import java.util.List;

import bean.V_SaleAmount;

public interface ViewDao {
    /**
     * select from v_avg_grades
     * @param fno
     * @return double avg_grades
     */
    double getGrades(int fno);
    
    /**
     * Select box office by film
     * @param fno
     * @return double
     */
    double getBoxOffice(int fno);
    
    /**
     * Select occupancy by film
     * @param fno
     * @return double
     */
    double getOccupancy(int fno);
    
    /**
     * Select sale amount of all cinemas sorted by mounth
     * @return
     */
    List<V_SaleAmount> getSaleAmount();
}
