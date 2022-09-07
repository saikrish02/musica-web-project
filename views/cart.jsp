<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.musica.db.dao.Productsdbdao, com.musica.web.model.*, java.util.*, com.musica.db.dao.Cartdbdao " %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../styles/cart.css?v=110" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
  <%!
    Cartdbdao cart = new Cartdbdao();
    User user;
  	ArrayList<Product> cartItems;
  	String url,imgurl;
  	int qty;
  %>
  <%
    if(session.getAttribute("user-data") == null){
    	response.sendRedirect("login.jsp");
    }else{
	  	user = (User) session.getAttribute("user-data");
	    cartItems = cart.getCartItems(user.getEmail());
    }
  	
  %>


  <div class="cartpage">
  
     <div class="msgdiv">
		    	<%  
		    		if(session.getAttribute("removedfromcart") != null ){
		    			session.removeAttribute("removedfromcart");
		    			out.println("<p style='color: green' class='msg'> REMOVED FROM CART SUCCESSFULLY !  </p>");
		    		}
		    	%>
    </div>
  
	<nav>
	    <p class="name"><a href="home.jsp">MUSICA</a></p>
	    <div style="margin-right: 24px; z-index: 2">
	        <a href="./cart.jsp"><i style="font-size: 32px;" class="material-icons cart-icon">shopping_cart</i></a>
	        <a href="./logout"><i style="font-size: 32px;" class="material-icons auth-icon">logout</i></a>
	    </div>
	</nav>
	
	<% if(user != null){ %>
    <div class="main-container">
        <div class="cart-div">
            <div class="cart-heading">
                <p> <i style="font-size: 32px; padding: 0 6px; position: relative; top: 8px " class="material-icons">local_mall</i> <%=user.getFirst_name() %>'s Cart </p>
                <p> <%=cartItems.size() %> Items </p>
            </div>
                <hr /> 
                <%if(cartItems.size() > 0) { %>
                <table>
                    <tr>
                        <th>PRODUCT</th>
                        <th>PRICE</th>
                        <th>QTY</th>
                        <th>TOTAL</th>
                    </tr>
                    <%for(Product p: cartItems) { 
                    	url = "./remove?pid="+p.getPid()+"&email="+user.getEmail();
                    	imgurl = "../images/p"+ p.getPid()+".jpg";
                    	qty = cart.getQty(user.getEmail(), p.getPid());
                    %>   
                	    <p style="display:none" class="dbqty"><%=qty %></p>
	                    <tr>
	                        <td class="prod-col">
	                            <div class="prod-details-div">
	                                <img width="150px" height="150px" src=<%= imgurl %> />
	                                <div class="prod-details">
	                                    <p class="prod-name"> <%= p.getName() %> </p>
	                                    <p class="category"> category : <%= p.getCategory() %> </p>
	                                    <p class="stock"> IN STOCK </p>
	                                    <a href=<%= url %>>Remove</a>
	                                </div>
	                            </div>
	                        </td>
	                        <td class="price-col">&pound; <span> <%= p.getPrice() %> </span></td>
	                        <td class="qty-col">
	                            <select class="<%=p.getPid()%> qty" id="qty" name="qty">
	                                <option value="1">1</option>
	                                <option value="2">2</option>
	                                <option value="3">3</option>
	                            </select>
	                            
	                        </td>
	                        <td class="tot-col">
	                        	&pound; <span></span>
	                        </td>
	                    </tr>
	                <%} %>
                </table>
                <%}else{ %>
                 <div style="text-align: center; width: 100%; padding: 40px; ">
                  <img width="200px" height="200px" src="../images/emptycart.gif" /> <br />
                  <p> Your cart is empty </p>
                 </div>
                <%} %>
          </div>
        <div class="summary">
                <p class="summary-heading"> Order summary </p>
                <hr /> 
                <table class="summary-table">
                    <tr>
                        <td>Subtotal</td>
                        <td class="subtotal">&pound; <span></span></td>
                    </tr>
                    <tr>
                        <td>Estimated Shipping & Handling</td>
                        <td>&pound; <%if(cartItems.size() > 0) { %> 35 <%}else{ %> 0 <%} %></td>
                    </tr>
                    <tr>
                        <td>Estimated Tax</td>
                        <td>&pound; <%if(cartItems.size() > 0) { %> 21 <%}else{ %> 0 <%} %></td>
                    </tr>
                    <tr>
                        <td class="totalpricefield">Total</td>
                        <td class="totalprice">&pound; <span></span></td>
                    </tr>
                </table>
                <%if(cartItems.size() > 0) { %> <button class="checkout"><a class="checkout-link">CHECKOUT</a></button> 
                <%}else{ %> 
                	<button disabled class="checkout"><a>CHECKOUT</a></button> 
                 <%} %>
        </div>
    </div>
    <%} %>
    
    <a class="continueshop" href="./shop.jsp"> &larr;&nbsp;&nbsp; continue shopping </a>
    
    <div class="footer">
    	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
    		<path fill="#6F4C3F" fill-opacity="1" d="M0,192L48,165.3C96,139,192,85,288,69.3C384,53,480,75,576,117.3C672,160,768,224,864,218.7C960,213,1056,139,1152,117.3C1248,96,1344,128,1392,144L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
    	</svg>
    	<%@ include file="../snippets/footer.html" %>
    </div>
    
  </div>
  
  <script src="../scripts/cart.js?l"></script> 
  
</body>
</html>