package com.market.pc.entity;

import java.util.List;

public class PageInfo<T> {

    private Long total;

    private List<T> rows;

    public PageInfo() {

    }
    
    public PageInfo(Long total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

}
