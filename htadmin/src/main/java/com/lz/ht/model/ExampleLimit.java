package com.lz.ht.model;

import lombok.Data;

/**
 * @author Administrator
 */
public class ExampleLimit {

    private Long  msFirst;

    private Long msLast;

    public Long getMsFirst() {
        return msFirst;
    }

    public void setMsFirst(Long msFirst) {
        this.msFirst = msFirst;
    }

    public Long getMsLast() {
        return msLast;
    }

    public void setMsLast(Long msLast) {
        this.msLast = msLast;
    }
}
