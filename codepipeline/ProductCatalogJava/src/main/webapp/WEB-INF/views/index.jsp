<%@ page import="java.util.ArrayList, com.aws.vokunev.catalog.data.CatalogItem"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <style>
    body {
      background-color:white;
    }
    table tbody tr:nth-child(even){
      background-color: lightblue;
      color:black;
    }    
    table td {
      padding: 7px;
      font-size: 120%;
    }
    th {
      text-align:left;
    }
    .priceIncrease {
      color: red;
      text-decoration: line-through;
    }
    .priceDrop {
      color: blue;
      text-decoration: line-through;
    }
  </style>
  <title>Sample Application - Product Catalog</title>
</head>

<body>
  <h1>Product Catalog</h1>
  <table>
    <th>ID</th>
    <th>Year</th>
    <th>Title</th>
    <th>Category</th>
    <th>Inventory</th>
    <th>Price</th>
    <th>Price Trend</th>
    <c:forEach items="${catalog}" var="item">
      <tr>
        <td><a href="product?id=${item.id}" target="_blank">${item.id}</a></td>
        <td>${item.year}</td>
        <td>${item.title}</td>
        <td>${item.productCategory}</td>
        <td>
          <div style="text-align: right;">          
            ${item.qty}
          </div>  
        </td>
        <td>$${item.price}</td>
        <td>
          <c:if test="${item.oldPrice > 0}">
            <c:choose>
              <c:when test="${item.price > item.oldPrice}">
                <div class="priceIncrease">  
                  $${item.oldPrice}
                </div>
              </c:when>
              <c:otherwise>
                <div class="priceDrop">  
                  $${item.oldPrice}
                </div>
              </c:otherwise>
           </c:choose>
          </c:if>
        </td>
      </tr>
    </c:forEach>
  </table>
</body>

</html>