package com.market.pc.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.abel533.entity.Example;
import com.github.abel533.mapper.Mapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mytaotao.manage.pojo.BasePojo;
import com.mytaotao.manage.pojo.Item;

public abstract class BaseService<T extends BasePojo> {
    
//    public abstract Mapper<T> getMapper();
    
    @Autowired
    private Mapper<T> mapper;
    public Mapper<T> getMapper() {
        return mapper;
    }
    
    /**
     * 根据主键id查询数据
     */
    public T queryById(Long id){
        return mapper.selectByPrimaryKey(id);
    }
    
    /**
     * 查询所有数据
     */
    public List<T> queryAll(){
        return mapper.select(null);
    }
    
    /***
     * 根据条件查询数据集合
     */
    public List<T> queryByWhere(T t){
        return mapper.select(t);
    }
    
    /***
     * 根据条件查询一条结果
     */
    public T queryOne(T t){
        return mapper.selectOne(t);
    }
    
    /***
     * 分页查询数据
     */
    public PageInfo<T> queryPageListByWhere(T t,Integer page,Integer rows){
        PageHelper.startPage(page, rows);
        List<T>  list = queryByWhere(t);
        return new PageInfo<T>(list);
    }
    
    /**
     * 自定义分页查询
     * @param example
     * @param page
     * @param rows
     * @return
     */
    public PageInfo<T> queryPageListByExample(Example example, Integer page, Integer rows) {
        PageHelper.startPage(page, rows, true);// 设置分页参数
        // 查询数据
        List<T> list = this.mapper.selectByExample(example);
        return new PageInfo<T>(list);
    }
    /***
     * 新增数据
     */
    public Integer save(T t){
        t.setCreated(new Date());
        t.setUpdated(t.getCreated());
        return mapper.insert(t);
    }
    
    /***
     * 新增已经选择的字段(部位null)
     */
    public Integer saveSelective(T t){
        t.setCreated(new Date());
        t.setUpdated(t.getCreated());
        return mapper.insertSelective(t);
    }
    
    /***
     *  更新数据
     */
    public Integer update(T t){
        t.setUpdated(new Date());
        return mapper.updateByPrimaryKey(t);
    }
    
    /***
     * 更新部位null的字段
     */
    public Integer updateSelective(T t){
        t.setUpdated(new Date());
        return mapper.updateByPrimaryKeySelective(t);
    }
    
    /***
     * 根据主键删除
     */
    public Integer deleteById(Object id){
        return mapper.deleteByPrimaryKey(id);
    }
    
    
    /***
     * 批量删除
     */
    public Integer deleteByIds(List<Object> ids,String property,Class<T> clazz){
        Example example = new Example(clazz);
        example.createCriteria().andIn(property, ids);
        return mapper.deleteByExample(example);
    }

}
