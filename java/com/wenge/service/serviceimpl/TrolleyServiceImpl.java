package com.wenge.service.serviceimpl;

import com.wenge.dao.ProductDao;
import com.wenge.dao.TrolleyDao;
import com.wenge.entity.Product;
import com.wenge.entity.Trolley;
import com.wenge.service.TrolleyService;
import com.wenge.util.UUIDUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

@Service
public class TrolleyServiceImpl implements TrolleyService {

    @Resource
    TrolleyDao trolleyDao;
    @Resource
    ProductDao productDao;
    @Override
    public int addInTrollry(Trolley up) {
        up.setId(UUIDUtil.getUUID());
        return trolleyDao.insert(up);
    }

    @Override
    public String deleteShopTrollry(String id) {
        int count= trolleyDao.delete(id);
        if (count==0){
            return "false";
        }else {
            return "true";
        }
    }

    @Override
    public Map getAllProducts(String username) {
        LinkedList<Trolley> lp = trolleyDao.getsByUsername(username);
        LinkedList<Product> pp=new LinkedList<>();
        for (Trolley up:lp){
            Product p=new Product();
            p.setId(up.getProductid());
            Product product = productDao.get(p);
            if (product==null){
                continue;
            }
            pp.add(product);
        }
        Map m=new HashMap();
        m.put("products",pp);
        m.put("trolley",lp);
        return  m;
    }

    @Override
    public Integer set(Trolley t) {
        return trolleyDao.set(t);
    }

    @Override
    public Trolley get(String id) {
        Trolley t=new Trolley();
        t.setId(id);
        return  trolleyDao.get(id);

    }

    @Override
    public Integer deleteById(String productid) {
        return trolleyDao.deleteByProductId(productid);
    }

    @Override
    public Map getsByType(String type,String username) {
        LinkedList<Trolley> trolleys = trolleyDao.getsByUsername(username);
        LinkedList <Product> list=new LinkedList();
        Product p=new Product();
        for (int i=0;i<trolleys.size();i++){
            p.setId(trolleys.get(i).getProductid());
            Product product= productDao.get(p);
            System.out.println(product);
            if(product.getType().equals(type)){
                list.add(product);
            }else {
                trolleys.remove(i);
                i--;
            }
        }
        Map m=new HashMap();
        m.put("trolley",trolleys);
        m.put("products",list);
        return m;
    }

    @Override
    public Map getsByFuzzy(String text,String username) {
        LinkedList<Trolley> trolleys = trolleyDao.getsByUsername(username);
        LinkedList <Product> list=new LinkedList();
        Product p=new Product();
        for (int i=0;i<trolleys.size();i++){
            p.setId(trolleys.get(i).getProductid());
            Product product= productDao.get(p);
            if(product.like(text)){
                list.add(product);
            }else {
                trolleys.remove(i);
                i--;
            }
        }
        Map m=new HashMap();
        m.put("trolley",trolleys);
        m.put("products",list);
        return m;
    }
}
