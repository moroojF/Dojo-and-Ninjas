package com.example.demo.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.example.demo.models.*;

import com.example.demo.services.*;

@Controller
public class AppController {
	private final AppService appService;
	public AppController(AppService service) {
		this.appService = service;
	}
	@RequestMapping("/dojos/{id}")
	public String Show(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dojo", this.appService.findDojo(id));
		model.addAttribute("ninjas", this.appService.allNinjas(id));
		return "/Show.jsp";
	}
	@RequestMapping("/dojos/new")
	public String NewDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "/Dojo.jsp";
	}
	@RequestMapping(value="/dojos", method=RequestMethod.POST)
	public String CreateDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if(result.hasErrors())
			return "/Dojo.jsp";
		this.appService.createDojo(dojo);
		return "redirect:/dojos/new";
	}
	@RequestMapping("/ninjas/new")
	public String NewNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		model.addAttribute("dojos", this.appService.allDojos());
		return "/Ninja.jsp";
	}
	@RequestMapping(value="/ninjas", method=RequestMethod.POST)
	public String CreateNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
		if(result.hasErrors()) {
			return "/Ninja.jsp";
		}
		this.appService.createNinja(ninja);
		return "redirect:/ninjas/new";
	}
}
