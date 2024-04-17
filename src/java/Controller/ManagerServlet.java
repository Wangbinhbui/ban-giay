/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author VIET HOANG
 */
public class ManagerServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        //int id = a.getId();
        if (a == null) {
            // Nếu chưa đăng nhập, chuyển hướng người dùng đến trang đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        // Kiểm tra quyền truy cập của người dùng
        if (a.getRole_id() != 1) {
            // Nếu người dùng không có quyền truy cập vào trang quản lý sản phẩm, chuyển hướng hoặc hiển thị thông báo lỗi
            response.sendRedirect("home.jsp");
        }
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProduct();
        CategoryDAO b = new CategoryDAO();
        BrandDAO bd = new BrandDAO();
        List<Category> listC = b.getAllCategory();
        List<Brand> listB = bd.getAllBrand();
        request.setAttribute("listC", listC);
        request.setAttribute("listP", list);
        request.setAttribute("listB", listB);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
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
