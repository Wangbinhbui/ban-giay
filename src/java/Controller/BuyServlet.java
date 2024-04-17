/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author VIET HOANG
 */
@WebServlet(name = "BuyServlet", urlPatterns = {"/buy"})
public class BuyServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        String quantity_raw = request.getParameter("quantity");
        String pid_raw = request.getParameter("pid");
        ProductDAO pd = new ProductDAO();
        int quantity = 0; // Mặc định số lượng là 1
        int pid = 0;
        try {
            quantity = Integer.parseInt(quantity_raw);
            pid = Integer.parseInt(pid_raw);
        } catch (NumberFormatException e) {
            // Xử lý nếu không thể chuyển đổi thành số nguyên
            e.printStackTrace();
        }
        // Lấy thông tin sản phẩm từ database
        Product p = pd.getProductByID(pid);
        if (p != null) {
            Double price = p.getPrice()*1.1;
            // Tạo một mục mới
            Item newItem = new Item(p, quantity, price);
            // Thêm mục vào giỏ hàng
            cart.addItem(newItem);
            // In ra để kiểm tra sản phẩm đã được thêm vào giỏ hàng hay chưa
            System.out.println("Đã thêm sản phẩm vào giỏ hàng: " + newItem.toString());
        } else {
            // Xử lý nếu không tìm thấy sản phẩm trong database
            System.out.println("Không tìm thấy sản phẩm có ID: " + pid);
        }
        // Cập nhật giỏ hàng vào session
        session.setAttribute("cart", cart);
        // Cập nhật kích thước của giỏ hàng
        session.setAttribute("size", cart.getItems().size());
        // Chuyển hướng về trang chủ
        response.sendRedirect("home");
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
