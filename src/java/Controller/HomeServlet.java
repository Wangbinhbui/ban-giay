/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author VIET HOANG
 */
public class HomeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO a = new ProductDAO();
        BrandDAO bd = new BrandDAO();
        List<Brand> listB = bd.getAllBrand();
        List<Product> listP = a.getAllProduct();
        CategoryDAO b = new CategoryDAO();
        List<Category> listC = b.getAllCategory();
        
        int page, numperpage = 9;
        int size = listP.size();
        int num = (size%9==0?(size/9):((size/9)+1));
        String xpage = request.getParameter("page");
        if(xpage==null){
            page=1;
        }else{
            page = Integer.parseInt(xpage);
        }
        String[] pp = {"<100000","100000-300000","30000-500000",">500000"};
        boolean[] pb =new boolean[pp.length+1];
        pb[0] = true;
        boolean[] bb = new boolean[listB.size()+1];
        bb[0] = true;
        boolean[] cb = new boolean[listC.size()+1];
        int start, end;
        cb[0] = true;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage, size);
        List<Product> list = a.getListbyPage(listP, start, end);
        List<Product> listN = a.top5newProduct();
        request.setAttribute("listP", list);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("bb", bb);
        request.setAttribute("cb", cb);
        request.setAttribute("cid",0);
        request.setAttribute("bid",0);
        request.setAttribute("listC", listC);
        request.setAttribute("listB", listB);
        request.setAttribute("top5", listN);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
