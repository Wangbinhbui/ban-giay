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
public class CategoryServlet extends HttpServlet {

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
        String[] cateID_raw = request.getParameterValues("cid"); // lay category id
        BrandDAO bd = new BrandDAO();
        CategoryDAO b = new CategoryDAO();
        List<Category> listC = b.getAllCategory();
        List<Brand> listB = bd.getAllBrand();
        boolean[] cb = new boolean[listC.size()+1];
        String priceorder = request.getParameter("priceorder");
        ProductDAO dao = new ProductDAO();
        String[] bID_raw = request.getParameterValues("bid");
        int[] bid = null;
        boolean[] bb = new boolean[listB.size()+1];
        int[] cateID = null;
        if(cateID_raw!=null){
            cateID = new int[cateID_raw.length];
            for(int i = 0; i < cateID.length;i++){
                cateID[i] = Integer.parseInt(cateID_raw[i]);
                System.out.print("a"+cateID[i]);
            }
        }
        System.out.println("abcs");
        if(bID_raw!=null){
            bid = new int[bID_raw.length];
            for(int i = 0; i < bid.length;i++){
                bid[i] = Integer.parseInt(bID_raw[i]);
                System.out.print("b"+bid[i]);
            }
        }

        try {
            List<Product> list = dao.getProductByCIDAndBID(cateID, bid, priceorder);
            request.setAttribute("listP", list);
            request.setAttribute("listB", listB);
            request.setAttribute("listC", listC);
            request.setAttribute("tag", cateID);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } catch (NumberFormatException e) {

        }

    }

    private boolean ischeck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
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
