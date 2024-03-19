package com.mz.controller;


import com.mz.common.R;
import com.mz.service.SysSubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("sub")
@CrossOrigin
public class SubController {
    @Autowired
    SysSubService service;
    @GetMapping("list")
    public R list(){
        return R.success(service.list());
    }
}
