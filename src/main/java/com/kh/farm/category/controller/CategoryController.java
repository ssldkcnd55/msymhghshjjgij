package com.kh.farm.category.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.category.model.service.CategoryImpl;
import com.kh.farm.category.model.service.CategoryService;
import com.kh.farm.category.model.vo.Category;
import com.kh.farm.member.model.vo.Member;

import net.sf.json.JSONArray;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="category_big.do", method=RequestMethod.POST)
	@ResponseBody
	public void selectCategory_main(HttpServletResponse response) throws IOException{
		System.out.println("selectCategory_main 메소드 실행");
		List<Category> category = categoryService.selectCategory_main();
		category.toString();
		if(category.size()> 0) {
			JSONArray jarr = new JSONArray();
			
			for(Category c : category) {
				JSONObject job = new JSONObject();
				
				job.put("category_main", c.getCategory_main());
			
				
				jarr.add(job);
			}
			JSONObject sendJson = new JSONObject();
			sendJson.put("big", jarr);
			
			response.setContentType("application/json; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.println(sendJson.toJSONString());
			out.flush();
			out.close();
			
			
		}
	}
	
	
	@RequestMapping(value="category_name.do", method=RequestMethod.POST)
	@ResponseBody
	public void selectCategory_name (HttpServletResponse response) throws IOException{
		System.out.println("selectCategory_name 메소드 실행");
		List<Category> category = categoryService.selectCategory_name();
		category.toString();
		if(category.size()> 0) {
			JSONArray jarr = new JSONArray();
			
			for(Category c : category) {
				JSONObject job = new JSONObject();
				job.put("category_no", c.getCategory_no());
				job.put("category_main", c.getCategory_main());
				job.put("category_name", c.getCategory_name());
				
				jarr.add(job);
			}
			JSONObject sendJson = new JSONObject();
			sendJson.put("name", jarr);
			
			response.setContentType("application/json; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.println(sendJson.toJSONString());
			out.flush();
			out.close();
			
		}
	}
	
	@RequestMapping(value="delCategory_big.do")
	public String delCategory_big(@RequestParam(value="category_main") String category_main) {
		System.out.println(category_main);
		int result = categoryService.deleteCategory_main(category_main);
		if(result > 0) {
			
			return "redirect:/moveAdminCategory.do";
		}else {
		return "에러페이지";
		}
	}
	
	
	@RequestMapping(value="delCategory_name.do")
	public String delCategory_name(@RequestParam(value="category_no") int category_no) {
		System.out.println(category_no);
		int result = categoryService.deleteCategory_name(category_no);
		if(result > 0) {
			
			return "redirect:/moveAdminCategory.do";
		}else {
		return "에러페이지";
		}
	}
	
	@RequestMapping(value="addCategory_main.do")
	public String addCategory_main(@RequestParam(value="category_main") String category_main) {
		System.out.println(category_main);
		int result = categoryService.addCategory_main(category_main);
		if(result > 0) {
			
			return "redirect:/moveAdminCategory.do";
		}else {
		return "에러페이지";
		}
	}
	
	@RequestMapping(value="updateCategory_main.do")
	public String updateCategory_main(@RequestParam(value="category_main") String category_main,@RequestParam(value="category_main_ori") String category_main_ori) {
		System.out.println(category_main);
		Category c = new Category();
		c.setCategory_main(category_main);
		c.setCategory_name(category_main_ori);
		int result = categoryService.updateCategory_main(c);
		if(result > 0) {
			
			return "redirect:/moveAdminCategory.do";
		}else {
		return "에러페이지";
		}
	}
	
	@RequestMapping(value="updateCategory_name.do")
	public String updateCategory_name(@RequestParam(value="category_name") String category_name,@RequestParam(value="category_name_ori") String category_name_ori) {
		System.out.println(category_name);
		Category c = new Category();
		c.setCategory_name(category_name);
		c.setCategory_main(category_name_ori);
		int result = categoryService.updateCategory_name(c);
		if(result > 0) {
			
			return "redirect:/moveAdminCategory.do";
		}else {
		return "에러페이지";
		}
	}
	
	
	
	@RequestMapping(value="addCategory_name.do")
	public String addCategory_name(Category category) {
		int result = categoryService.addCategory_name(category);
		if(result > 0) {
			
			return "redirect:/moveAdminCategory.do";
		}else {
		return "에러페이지";
		}
	}
	
	//ajax 연습ㅂ
	/*@RequestMapping(value="addCategory_name2.do", method=RequestMethod.POST)
	public void addCategory_name2(Category category,HttpServletResponse response) throws IOException{
		
		int result = categoryService.addCategory_name(category);
		if(result > 0) {
			Category resultCategory = categoryService.selectCategory_name(category);
			
			if(resultCategory != null) {
				JSONObject json = new JSONObject();
				
				json.put("category_no", resultCategory.getCategory_no());
				json.put("category_main", resultCategory.getCategory_main());
				json.put("category_name", resultCategory.getCategory_name());
				
				System.out.println(json.toJSONString());
				response.setContentType("application/json; charset=utf-8;");
				PrintWriter out = response.getWriter();
				out.print(json.toJSONString());
				out.flush();
				out.close();
			}
		}
		
	}*/
}
