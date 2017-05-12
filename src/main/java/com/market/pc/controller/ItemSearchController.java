/*package com.market.pc.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.market.pc.entity.Item;
import com.market.pc.entity.PageInfo;
import com.market.pc.service.ItemSearchService;



@Controller
public class ItemSearchController {
    
    @Autowired
    private ItemSearchService itemSearchService;
    
    @RequestMapping(value="search" ,method=RequestMethod.GET)
    public ModelAndView itemSearch(@RequestParam("keyword")String keyword,@RequestParam(value="page",defaultValue="1")Integer page){
        ModelAndView mv = new ModelAndView("search");
        mv.addObject("query", keyword);
        mv.addObject("page", page);
        
        try {
            keyword = new String(keyword.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }       
        
        try {
            PageInfo<Item> pageInfo = this.itemSearchService.search(keyword, page);
            mv.addObject("itemList", pageInfo.getRows());
            mv.addObject("pages", (pageInfo.getTotal() + ItemSearchService.ROWS - 1) / ItemSearchService.ROWS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
        
    }
}
*/