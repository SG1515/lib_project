package com.kcc.lib_project.global.dummy;

import com.kcc.lib_project.domain.book.dto.BookDummyListDto;
import com.kcc.lib_project.domain.book.mapper.BookMapper;
import com.kcc.lib_project.domain.book.mapper.OwnBookMapper;
import com.kcc.lib_project.domain.book.vo.BookVo;
import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.Collections;
import java.util.List;

@Component
@RequiredArgsConstructor
@Transactional
@Slf4j
public class BookDummy {

    private final BookMapper bookMapper;
    private final OwnBookMapper ownBookMapper;
    private final RestTemplate restTemplate;

    @Value("${secret.library-key}")
    private String secretKey;

    @PostConstruct
    public void init() {
        createBookDummy();
    }

    private void createBookDummy() {
        if (true) {
            return;
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        for (int page = 1; page < 10; page++) {
            UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl("https://www.nl.go.kr/seoji/SearchApi.do")
                    .queryParam("cert_key", secretKey)
                    .queryParam("result_style", "json")
                    .queryParam("page_no", page)
                    .queryParam("page_size", 999)
                    .queryParam("ebook_yn", "N");

            HttpEntity entity = new HttpEntity<>(headers);

            ResponseEntity response = restTemplate.exchange(
                    builder.toUriString(),
                    HttpMethod.GET,
                    entity,
                    BookDummyListDto.class);

            BookDummyListDto bookDummyListDto = (BookDummyListDto) response.getBody();

            List<BookVo> bookVos = bookDummyListDto.bookDummyDtoList().stream()
                    .filter(b -> !(b.ISBN() == null || b.ISBN().isBlank() || !b.ISBN().matches("[0-9]+")))
                    .map(BookVo::from).toList();

            for (BookVo bookVo : bookVos) {
                bookMapper.createBook(bookVo);

                if (bookVo.getBookIndex() != null && bookVo.getCategoryNumber() != "0" && bookVo.getImageUrl() != null && bookVo.getPageSize() != 0) {
                    OwnBookVo ownBookVo = OwnBookVo.from(bookVo);
                    ownBookMapper.createOwnBook(ownBookVo);
                }
            }
        }


    }
}
