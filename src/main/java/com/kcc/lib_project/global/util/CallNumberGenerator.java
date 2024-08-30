package com.kcc.lib_project.global.util;

import java.util.Random;

public class CallNumberGenerator {

    private static final Random random = new Random();

    // 알파벳 대문자 두 개와 숫자 네 개를 조합하여 청구기호 생성
    public static String generateCallNumber() {
        String callNumber;
            char letter1 = (char) ('A' + random.nextInt(26));
            char letter2 = (char) ('A' + random.nextInt(26));
            char letter3 = (char) ('A' + random.nextInt(26));
            int numbers = random.nextInt(100000);  // 0에서 99999 사이의 숫자

            callNumber = String.format("%c%c%c %05d", letter1, letter2, letter3, numbers);

        return callNumber;
    }

}
