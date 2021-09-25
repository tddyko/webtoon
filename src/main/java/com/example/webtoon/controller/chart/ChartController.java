package com.example.webtoon.controller.chart;

import java.util.Arrays;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.webtoon.service.main_advertising.Main_AdvertisingService;
@RestController
public class ChartController {
	@Inject
	Main_AdvertisingService main_AdvertisingService;
	
	@SuppressWarnings("unchecked") // 경고무시
	@RequestMapping("/chart/chartAvg")
	public JSONObject chart_avg(@RequestParam String start, @RequestParam String end) {
		// 앙 받을꺼
	
		System.out.println(start);
		System.out.println(end);
	

		// 첫날짜와 끝날짜로 해당 포함된 달을 가져옴
		int start_year = Integer.valueOf(start.substring(0, 4));
		int start_month = Integer.valueOf(start.substring(5));

		int end_year = Integer.valueOf(end.substring(0, 4));
		int end_month = Integer.valueOf(end.substring(5));


		// 달갯수,년도수
		int month_number = 0;
		int year_number = 0;

		// 년도 갯수
		year_number = end_year - start_year + 1;

		// 해당 년도가 같다면
		if (year_number == 1) {
	
			month_number = end_month - start_month + 1;
		} else if (year_number > 1) {
			month_number = 12 - start_month + 1 + end_month;
			// 해당 년도가 다르다면
			for (int i = 2; i < year_number; i++) {
				month_number += 12;
			}
		}
		

		// 년도 목록
		int[] year = new int[year_number];
		// 달 목록
		int[] month = new int[month_number];
		// 년도+달
		String[] year_month = new String[month_number];

		// 년도입력
		for (int i = 0; i < year.length; i++) {
			year[i] = start_year + i;
		}
		// 달입력
		int k = start_month; // 임시숫자
		for (int i = 0; i < month.length; i++) {

			month[i] = k;
			k++;
			if (month[i] % 13 == 0) {
				month[i] = 1;
				k = 2;
			}
		}
		
		// 년+달
		// 월초
		int z = 0;
		for (int i = 0; i < month_number; i++) {

			if (String.valueOf(month[i]).length() != 2) {
				year_month[i] = year[z] + "0" + month[i] + "01";
			} else {
				year_month[i] = year[z] + "" + month[i] + "01";

			}
			if (month[i] == 12) {
				z++;
			}

		}

		String[] year_month_next = new String[month_number];
		// 다음달
		int[] next_month = new int[month_number];

		// 다음달월초
		int j = start_month + 1; // 임시숫자
		for (int i = 0; i < next_month.length; i++) {

			next_month[i] = j;
			j++;
			if (next_month[i] % 13 == 0) {
				next_month[i] = 1;
				j = 2;
			}
		}

		// 다음달_년+월
		int x = start_year;

		for (int i = 0; i < month_number; i++) {

			if (String.valueOf(next_month[i]).length() != 2) {
				year_month_next[i] = x + "0" + next_month[i] + "01";
			} else {
				year_month_next[i] = x + "" + next_month[i] + "01";

			}
			if (next_month[i] == 12) {
				x++;
			}

		}

		// 달마다 총액,평균 가격을 가져옴

		// List<Double> avg
		Double[] avg = new Double[month_number];
		Double[] total = new Double[month_number];

		for (int i = 0; i < avg.length; i++) {
			avg[i] = main_AdvertisingService.getFeeAvg(year_month[i], year_month_next[i]);
			total[i] = main_AdvertisingService.getFeeTotal(year_month[i], year_month_next[i]);
		}

		// 뿌려줌
		JSONObject data = new JSONObject();

		// 컬럼 객체
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		// json배열
		JSONArray title = new JSONArray();
		col1.put("label", "평균");
		col1.put("type", "string");
		col2.put("label", "금액");
		col2.put("type", "number");

		title.add(col1);
		title.add(col2);
		data.put("cols", title); // {"cols" : 컬럼배열}

		JSONArray body = new JSONArray();
		for (int i = 0; i < month_number; i++) {
			JSONObject name = new JSONObject();
			name.put("v",year_month[i].substring(0,4)+"-"+year_month[i].substring(4,6));
			JSONObject money = new JSONObject();
			money.put("v", (avg[i]/10000));
			JSONArray row = new JSONArray();
			row.add(name);
			row.add(money);

			JSONObject cell = new JSONObject();
			cell.put("c", row); // 컬럼추가
			
			
			body.add(cell); // json 객체에 행 추가됨

		}
		data.put("rows", body);

		return data;

	}
	
	
	@SuppressWarnings("unchecked") // 경고무시
	@RequestMapping("/chart/chartTotal")
	public JSONObject chart_total(@RequestParam String start, @RequestParam String end) {
		// 앙 받을꺼
		System.out.println(start);
		System.out.println(end);

		// 첫날짜와 끝날짜로 해당 포함된 달을 가져옴
		int start_year = Integer.valueOf(start.substring(0, 4));
		int start_month = Integer.valueOf(start.substring(5));

		int end_year = Integer.valueOf(end.substring(0, 4));
		int end_month = Integer.valueOf(end.substring(5));

		// 달갯수,년도수
		int month_number = 0;
		int year_number = 0;

		// 년도 갯수
		year_number = end_year - start_year + 1;

		// 해당 년도가 같다면
		if (year_number == 1) {
			month_number = end_month - start_month + 1;
		} else if (year_number > 1) {
			month_number = 12 - start_month + 1 + end_month;
			// 해당 년도가 다르다면
			for (int i = 2; i < year_number; i++) {
				month_number += 12;
			}
		}

		// 년도 목록
		int[] year = new int[year_number];
		// 달 목록
		int[] month = new int[month_number];
		// 년도+달
		String[] year_month = new String[month_number];

		// 년도입력
		for (int i = 0; i < year.length; i++) {
			year[i] = start_year + i;
		}
		// 달입력
		int k = start_month; // 임시숫자
		for (int i = 0; i < month.length; i++) {

			month[i] = k;
			k++;
			if (month[i] % 13 == 0) {
				month[i] = 1;
				k = 2;
			}
		}
		// 년+달
		// 월초
		int z = 0;
		for (int i = 0; i < month_number; i++) {

			if (String.valueOf(month[i]).length() != 2) {
				year_month[i] = year[z] + "0" + month[i] + "01";
			} else {
				year_month[i] = year[z] + "" + month[i] + "01";

			}
			if (month[i] == 12) {
				z++;
			}

		}

		String[] year_month_next = new String[month_number];
		// 다음달
		int[] next_month = new int[month_number];

		// 다음달월초
		int j = start_month + 1; // 임시숫자
		for (int i = 0; i < next_month.length; i++) {

			next_month[i] = j;
			j++;
			if (next_month[i] % 13 == 0) {
				next_month[i] = 1;
				j = 2;
			}
		}

		// 다음달_년+월
		int x = start_year;

		for (int i = 0; i < month_number; i++) {

			if (String.valueOf(next_month[i]).length() != 2) {
				year_month_next[i] = x + "0" + next_month[i] + "01";
			} else {
				year_month_next[i] = x + "" + next_month[i] + "01";

			}
			if (next_month[i] == 12) {
				x++;
			}

		}

		// 달마다 총액,평균 가격을 가져옴

		// List<Double> avg
		Double[] avg = new Double[month_number];
		Double[] total = new Double[month_number];

		for (int i = 0; i < avg.length; i++) {
			avg[i] = main_AdvertisingService.getFeeAvg(year_month[i], year_month_next[i]);
			total[i] = main_AdvertisingService.getFeeTotal(year_month[i], year_month_next[i]);
		}

		// 뿌려줌
		JSONObject data = new JSONObject();

		// 컬럼 객체
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		// json배열
		JSONArray title = new JSONArray();
		col1.put("label", "총액");
		col1.put("type", "string");
		col2.put("label", "금액");
		col2.put("type", "number");

		title.add(col1);
		title.add(col2);
		data.put("cols", title); // {"cols" : 컬럼배열}

		JSONArray body = new JSONArray();
		for (int i = 0; i < month_number; i++) {
			JSONObject name = new JSONObject();
			name.put("v",year_month[i].substring(0,4)+"-"+year_month[i].substring(4,6));
			JSONObject money = new JSONObject();
			money.put("v", (total[i]/10000));
			JSONArray row = new JSONArray();
			row.add(name);
			row.add(money);

			JSONObject cell = new JSONObject();
			cell.put("c", row); // 컬럼추가
			
			
			body.add(cell); // json 객체에 행 추가됨

		}
		data.put("rows", body);

		return data;

	}
}
