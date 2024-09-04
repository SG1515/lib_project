package com.kcc.lib_project.reserve;

import com.kcc.lib_project.domain.reserve.dto.ReserveSaveDto;
import com.kcc.lib_project.domain.reserve.service.ReserveService;
import org.junit.Test;
import org.junit.jupiter.api.DisplayName;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;


@RunWith(SpringRunner.class)
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Transactional
@SpringBootTest
public class ReserveServiceIntegrationTest {

    @Autowired
    private ReserveService reserveService;

    @DisplayName("예약 생성 동시성 테스트")
    @Test
    public void reserveConcurrentTest() throws InterruptedException {
        int numberOfThreads = 100;
        ExecutorService executorService = Executors.newFixedThreadPool(numberOfThreads);
        CountDownLatch latch = new CountDownLatch(numberOfThreads);

        for (int i = 0; i < numberOfThreads; i++) {
            executorService.submit(() -> {
                try {
                    reserveService.createReserve(new ReserveSaveDto("1001"), "duden5000");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                } finally {
                    latch.countDown();
                }
            });
        }

        latch.await(); // 모든 쓰레드가 완료될 때까지 대기
        executorService.shutdown();

//        assertThat()
        int cnt = reserveService.isReserved("1001");
        assertThat(cnt).isEqualTo(1);

    }

}
