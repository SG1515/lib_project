package com.kcc.lib_project.domain.reserve.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReserveSaveDto implements Serializable {

    private String callNumber;
}
