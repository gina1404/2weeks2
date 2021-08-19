package com.twoweeks.spring.covid.vaccine.model.vo;

import lombok.Data;

@Data
public class Response {
    private Header header;
    private Body body;
}
