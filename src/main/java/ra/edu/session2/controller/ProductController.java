//package ra.edu.session2.controller;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import ra.edu.session2.model.Product;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.List;
//
//@Controller
//@RequestMapping("/products")
//public class ProductController {
//    private List<Product> productList;
//
//    public ProductController() {
//        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//        productList = new ArrayList<>();
//
//        try {
//            productList.add(new Product(sdf.parse("21/10/2025"),15000000D,"Dell","P01","Máy tính",2024));
//            productList.add(new Product(sdf.parse("01/03/2026"),8000000D,"Toshiba","P02","Tivi",2024));
//            productList.add(new Product(sdf.parse("21/05/2026"),12000000D,"Sanyo","P03","Tủ lạnh",2024));
//            productList.add(new Product(sdf.parse("11/02/2025"),300000D,"Sanyo","P04","Bàn là",2024));
//            productList.add(new Product(sdf.parse("17/06/2025"),7000000D,"SamSung","P05","Điện thoại",2024));
//            productList.add(new Product(sdf.parse("18/10/2026"),500000D,"Adidas","P06","Giày nam",2024));
//            productList.add(new Product(sdf.parse("07/10/2026"),1500000D,"Cookcu","P07","Nồi cơm điện",2024));
//        } catch (ParseException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    @GetMapping
//    public String products(Model model){
//        model.addAttribute("productList",productList);
//        return "listProducts";
//    }
//
//    @GetMapping("/detail")
//    public String detailProduct(@RequestParam("proId")String proId,Model model){
//        Product product = new Product();
//        for(Product p:productList){
//            if(p.getProId().equals(proId)){
//                product=p;
//                break;
//            }
//        }
//        model.addAttribute("product",product);
//        return "detailProduct";
//    }
//
//    @GetMapping("/detailPath/{proId}")
//    public String detailPath(@PathVariable("proId")String proId, Model model){
//        Product product = new Product();
//        for(Product p:productList){
//            if(p.getProId().equals(proId)){
//                product=p;
//                break;
//            }
//        }
//        model.addAttribute("product",product);
//        return "detailProduct";
//    }
//}
