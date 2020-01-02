package com.qdu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private int id;
    private String name;
    private double price;
    private int stock; //库存
    private String category;//类别
    private String info;//描述
    private String pic; //图片位置
    private int status;
}
