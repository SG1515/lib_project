package com.kcc.lib_project.domain.book.service;

import com.kcc.lib_project.domain.book.dto.BookDummyListDto;
import com.kcc.lib_project.domain.book.vo.BookVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class BookDummyService {

    private final RestTemplate restTemplate;

    @Value("${secret.library-key}")
    private String secretKey;

    public void getDummy() {

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl("https://www.nl.go.kr/seoji/SearchApi.do")
                .queryParam("cert_key", secretKey)
                .queryParam("result_style", "json")
                .queryParam("page_no", 1)
                .queryParam("page_size", 100)
                .queryParam("ebook_yn", "N");

        HttpEntity entity = new HttpEntity<>(headers);

        ResponseEntity response = restTemplate.exchange(
                builder.toUriString(),
                HttpMethod.GET,
                entity,
                BookDummyListDto.class);

        BookDummyListDto bookDummyListDto = (BookDummyListDto) response.getBody();

        List<BookVo> bookVos = bookDummyListDto.bookDummyDtoList().stream().map(b -> BookVo.from(b)).toList();

        for (BookVo bookVo : bookVos) {
            log.info("bookVo: {}", bookVo.toString());
        }


    }

}
