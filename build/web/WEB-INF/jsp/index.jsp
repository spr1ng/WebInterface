<%-- 
    Document   : index
    Created on : 13.04.2010, 13:34:01
    Author     : spr1ng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <title>TheEYE - Your Image Searching System</title>
        <link rel="stylesheet" type="text/css" href="style/main.css"/>
        <%--<script type="text/javascript">
            function cpFilePath(){
                document.getElementById('filePath').value = document.getElementById('fileInput').value;
            }
        </script>--%>
    </head>
    <body>
<!--OUTER TABLE BEGIN-->
        <table id="outer-table">
            <tr><td>
    <!--INNER TABLE BEGIN-->
                <table id="inner-table" style="height: 80%;">
                    <tr>
                        <td width="10%" align="right" style="vertical-align: top;">TheEYE</td>
                        <td width="80%" align="center" style="vertical-align: top;">
        <!--MAIN TABLES BEGIN-->
                            <!--Spacing-->
                            <table style="height: 100px; width: 100px;"><tr><td>&nbsp;</td></tr></table>
            <!--FORM BEGIN-->
                            <form action="search.htm" method="post" enctype="multipart/form-data">
                                <!--Top-->
                                <table style="height: 100px; width: 640px;" border="0">
                                    <tr>
                                        <td rowspan="3" style="width: 155px;"><a href="http://cardpay.com"><img src="img/eye-logo-small.png" alt="TheEYE"/></a></td>
                                        <td rowspan="3" style="width: 25px;">&nbsp;</td>
                                        <td style="height: 35px;">&nbsp;</td><td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle;">
                                            <input id="filePath" name="filePath" size="35" style="width: 388px;" type="file" accept="image/*">
                                        </td>
                                        <td style="vertical-align: middle;"><input type="image" src="img/search.png" alt="Search!"/></td>
                                    </tr>
                                    <tr><td style="height: 35px; vertical-align: top;">${fileError}&nbsp;</td><td>&nbsp;</td></tr>
                                </table>
                            </form>
            <!--FORM END-->                    
                            <!--Spacing-->
                            <table style="height: 100px; width: 100px;"><tr><td>&nbsp;</td></tr></table>
                            <!--Images-->
                            <table style="height: 100px; width: 560px;">
                                <tr>
                                    <td><img src="img/bird.png" alt=""/></td>
                                    <td><img src="img/pc.png" alt=""/></td>
                                    <td><img src="img/orange.png" alt=""/></td>
                                    <td><img src="img/house.png" alt=""/></td>
                                </tr>
                            </table>
                            <!--Spacing-->
                            <table style="height: 100px; width: 100px;"><tr><td>&nbsp;</td></tr></table>
                            <!--Footer-->
                            <table style="height: 100px; width: 560px;">
                                <tr>
                                    <td align="center">
                                        <a href="#">Business Solutions</a> --
                                        <a href="#">About TheEYE</a> --
                                        <a href="#">Terms of Use</a> --
                                        <a href="#">Image Directory</a>
                                        <br/>TheEYE - 2010
                                    </td>
                                </tr>
                            </table>
        <!--MAIN TABLES END-->
                        </td>
                        <td width="10%">&nbsp;</td>
                    </tr>
                </table>
    <!--INNER TABLE END-->
            </td></tr>
        </table>
<!--OUTER TABLE END-->
    </body>
</html>
