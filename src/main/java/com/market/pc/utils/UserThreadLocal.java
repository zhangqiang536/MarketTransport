package com.market.pc.utils;

import com.market.pc.entity.Person;

public class UserThreadLocal {

    private static final ThreadLocal<Person> LOCAL = new ThreadLocal<Person>();

    public static void set(Person user) {
        LOCAL.set(user);
    }

    public static Person get() {
        return LOCAL.get();
    }

}
