package com.fourstars.greenstore.dto;

import lombok.Data;

import java.util.Date;

import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Data
public class SignUpDto {
    private String name;
    private String email;
    private String password;
    private String avatar;
    @Temporal(TemporalType.DATE)
    private Date registerDate;
    private Boolean status;
}
