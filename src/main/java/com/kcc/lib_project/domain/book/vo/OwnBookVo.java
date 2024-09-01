package com.kcc.lib_project.domain.book.vo;

import com.kcc.lib_project.global.util.CallNumberGenerator;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OwnBookVo {

    private String callNumber;
    private LocalDate receiptAt;
    private String status;
    private Long isbn;

    private BookVo bookVo;

    @Builder
    public OwnBookVo(BookVo bookVo, String callNumber, Long isbn, LocalDate receiptAt, String status) {
        this.bookVo = bookVo;
        this.callNumber = callNumber;
        this.isbn = isbn;
        this.receiptAt = receiptAt;
        this.status = status;
    }

    public static OwnBookVo from(BookVo bookVo) {

        String callNumber = CallNumberGenerator.generateCallNumber();

        return OwnBookVo.builder()
                .callNumber(callNumber)
                .isbn(bookVo.getIsbn())
                .receiptAt(LocalDate.now())
                .status(Status.AVAILABLE.toString())
                .build();
    }
}
