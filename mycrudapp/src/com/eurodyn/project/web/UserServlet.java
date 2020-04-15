package com.eurodyn.project.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eurodyn.project.dao.UserDao;
import com.eurodyn.project.model.User;

@WebServlet("/")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertUser(request, response);
                    break;
                case "/delete":
                    deleteUser(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateUser(request, response);
                    break;
                case "/list":
                	listUsers(request, response);
                	break;
                case "/details":
                	showDetails(request, response);
                	break;	
                default:
                	home(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
	private Date convertStringToDate(String dateStr) throws ParseException {
    	SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy"); 
    	java.util.Date parsedate = format.parse(dateStr);
    	java.sql.Date sqlDate = new java.sql.Date(parsedate.getTime());
    	return sqlDate;
    }
    
    private void home(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
    	boolean firstTime = true;
    	if (firstTime == true) { 
    		userDao.init(); 
    		firstTime = false;
    	}
    	RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
    	dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("form-users.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	User newUser = new User();
    	String firstname = request.getParameter("firstname");
    	String surname = request.getParameter("surname");
    	String gender = request.getParameter("gender");
    	String dateStr = request.getParameter("birthdate");
    	try {
    		Date birthdate = convertStringToDate(dateStr);
    	    newUser.setBirthdate(birthdate);
        }catch(ParseException ex) {}
        newUser.setFirstname(firstname);
        newUser.setSurname(surname);
        newUser.setGender(gender);
        if(request.getParameter("homeaddress") != null) {
        	String home_address = request.getParameter("homeaddress");
    	    newUser.setHomeAddress(home_address);
    	}
    	if(request.getParameter("workaddress") != null) {
    	 	String work_address = request.getParameter("workaddress");
    	  	newUser.setWorkAddress(work_address);
        }
    	        
        userDao.saveUser(newUser);
        response.sendRedirect("list");
   	}
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
    	//Integer id = Integer.valueOf(request.getParameter("id"));
    	int id = Integer.parseInt(request.getParameter("id"));
    	User existingUser = userDao.getUser(id);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("form-users.jsp");
    	request.setAttribute("user", existingUser);
    	dispatcher.forward(request, response);
   }

   private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	User existingUser = new User();
    	//Integer id = Integer.valueOf(request.getParameter("id"));
    	int id = Integer.parseInt(request.getParameter("id"));
        String firstname = request.getParameter("firstname");
    	String surname = request.getParameter("surname");
    	String gender = request.getParameter("gender");
    	String dateStr = request.getParameter("birthdate");
    	try {
    		Date birthdate = convertStringToDate(dateStr);
    	    existingUser.setBirthdate(birthdate);
        }catch(ParseException ex) {}
    	existingUser.setId(id);
    	existingUser.setFirstname(firstname);
    	existingUser.setSurname(surname);
    	existingUser.setGender(gender);
    	if(request.getParameter("homeaddress") != null) {
    		String home_address = request.getParameter("homeaddress");
    	    existingUser.setHomeAddress(home_address);
    	}
    	if(request.getParameter("workaddress") != null) {
    		String work_address = request.getParameter("workaddress");
    	    existingUser.setWorkAddress(work_address);
    	}

    	userDao.updateUser(existingUser);
    	response.sendRedirect("list");
    }
    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List <User> listUser = userDao.getAllUser();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("display-users.jsp");
        dispatcher.forward(request, response);
    }

    private void showDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//Integer id = Integer.valueOf(request.getParameter("id"));
    	int id = Integer.parseInt(request.getParameter("id"));
    	User existingUser = userDao.getUser(id);
    	request.setAttribute("user",existingUser);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("display-users-details.jsp");
    	dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        //Integer id = Integer.valueOf(request.getParameter("id"));
    	int id = Integer.parseInt(request.getParameter("id"));
        userDao.deleteUser(id);
        response.sendRedirect("list");
    }
}
