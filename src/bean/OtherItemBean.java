package bean;

public class OtherItemBean {
    private int    oino;
    private int    quantity;
    private double oiprice;
    
    private ProductBean product;

    public int getOino() {
        return oino;
    }

    public void setOino(int oino) {
        this.oino = oino;
    }

    public double getOiprice() {
        return oiprice;
    }

    public void setOiprice(double oiprice) {
        this.oiprice = oiprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ProductBean getProduct() {
        return product;
    }

    public void setProduct(ProductBean product) {
        this.product = product;
    }
    
    
}
