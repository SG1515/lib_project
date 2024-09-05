package com.kcc.lib_project.domain.book.vo;

import com.kcc.lib_project.domain.book.dto.BookCreateDto;
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
    private Boolean isReserved;
    private Long version;

    private BookVo bookVo;

    @Builder
    public OwnBookVo(BookVo bookVo, String callNumber, Long isbn, Boolean isReserved, LocalDate receiptAt, String status, Long version) {
        this.bookVo = bookVo;
        this.callNumber = callNumber;
        this.isbn = isbn;
        this.isReserved = isReserved;
        this.receiptAt = receiptAt;
        this.status = status;
        this.version = version;
    }



    public static OwnBookVo from(BookVo bookVo) {

        String callNumber = CallNumberGenerator.generateCallNumber();

        return OwnBookVo.builder()
                .callNumber(callNumber)
                .isbn(bookVo.getIsbn())
                .receiptAt(LocalDate.now())
                .status(Status.AVAILABLE.toString())
                .isReserved(false)
                .version(1L)
                .build();
    }

    public static OwnBookVo from(BookCreateDto bookCreateDto) {
        return OwnBookVo.builder()
                .callNumber(bookCreateDto.getCallNumber())
                .isbn(bookCreateDto.getIsbn())
                .receiptAt(LocalDate.now())
                .status(Status.AVAILABLE.toString())
                .build();
    }
}
