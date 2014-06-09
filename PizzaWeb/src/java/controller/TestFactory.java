/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.TransactionHeader;
import java.util.List;

/**
 *
 * @author Prayogo
 */
public class TestFactory {
    public List generateBeanArray() {
        List _listHeader = new Adapter().getTransactionHeader();
        return _listHeader;
    }
}
