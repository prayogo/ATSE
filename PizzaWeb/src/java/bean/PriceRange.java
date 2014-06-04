/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Prayogo
 */
public class PriceRange {
    private int pricerangeid;
    private int price1;
    private int price2;

    public PriceRange() {
    }

    public PriceRange(int pricerangeid, int price1, int price2) {
        this.pricerangeid = pricerangeid;
        this.price1 = price1;
        this.price2 = price2;
    }

    public int getPricerangeid() {
        return pricerangeid;
    }

    public int getPrice1() {
        return price1;
    }

    public int getPrice2() {
        return price2;
    }

    public void setPricerangeid(int pricerangeid) {
        this.pricerangeid = pricerangeid;
    }

    public void setPrice1(int price1) {
        this.price1 = price1;
    }

    public void setPrice2(int price2) {
        this.price2 = price2;
    }
}
