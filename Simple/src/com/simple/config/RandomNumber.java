package com.simple.config;

import java.util.Random;

public class RandomNumber {
	public static int randomNumber(int min, int max) {
		Random random = new Random();
		int rnd = random.nextInt((max - min) + 1) + min;
		return rnd;
	}
}
