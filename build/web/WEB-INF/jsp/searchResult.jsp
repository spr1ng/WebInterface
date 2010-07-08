<%-- 
    Document   : searchResult
    Created on : 14.04.2010, 12:33:30
    Author     : spr1ng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Set" %>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem" %>
<%@page import="java.io.File" %>

<%@page import="eye.core.model.result.*" %>
<%@page import="eye.core.model.Image" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/main.css"/>
        <title>TheEYE - Search Result</title>
    </head>
    <body>

<%
    SearchResult searchResult = (SearchResult) request.getAttribute("result");
    int totalImages = searchResult.totalImages();
%>
        <h3>Total images similar: <%= totalImages %></h3>
        <table border="1" align="center">
            <tr>
                <td align="center" width="30"><h3>Idx</h3></td>
                <td align="center"><h3>Similar Image</h3></td>
                <td align="center"><h3>Url:</h3></td>
                <td align="center"><h3>Extra info:</h3></td>
            </tr>
<%
    Set<SimilarityResult> results = searchResult.getResults();
    //FileItem imageItem = (FileItem)request.getAttribute("imageItem");
    //String src = config.getServletContext().getRealPath(imageItem.getName());
    //java.awt.image.BufferedImage buffim = ImageIO.read(imageItem.getInputStream());
    //response.setContentType("image/jpeg");
%>
            <%--tr>
                <td colspan="4">
                    <img src="<%= src %>" alt="omg"/>
                </td>
            </tr--%>
<%
    int idx = 1;
    for (SimilarityResult result : results) {
        String url = result.getImage2().getUrl();
        int averageEdges = result.getAverageEdgesQty();
        int maxEdges = result.getMaxEdgesQty();
        int edgesTotal = result.getEdgeQtyTotal();
        int similarity = result.getSimilarity();
%>
            <tr>
                <td align="center"><%= idx %></td>
                <td align="center"><a href="<%= url %>" target="_blank"><img src="<%=url%>" alt="<%=url%>" width="100" height="100"/></a></td>
                <td><h3>&nbsp;&nbsp;&nbsp;<a href="<%= url %>" target="_blank"><%= url %></a></h3></td>
                <td align="left">
                    <table border="0">
                        <tr><td align="right">Edges (average):</td><td align="left"><%= averageEdges %></td></tr>
                        <tr><td align="right">Edges (max):</td><td align="left"><%= maxEdges %></td></tr>
                        <tr><td align="right">Edges (total):</td><td align="left"><%= edgesTotal %></td></tr>
                        <tr><td align="right"><font color="green">Similarity</font>:</td><td align="left"><%= similarity %>%</td></tr>
                    </table>
                </td>
            </tr>
<%
        idx++;
    }
%>
        </table>
    </body>
</html>
