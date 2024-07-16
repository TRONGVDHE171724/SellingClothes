
<%-- 
    Document   : contact.jsp
    Created on : Mar 1, 2024, 2:05:56 AM
    Author     : Trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>T Clothes - contact us</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS 
        ========================= -->
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>

        <!--Offcanvas menu area start-->
        
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="index.html">Trang chủ</a></li>
                                <li>/</li>
                                <li>Liên hệ</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->


        <!--contact area start-->
        <div class="contact_area">
            <div class="container">   
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="contact_message content">
                            <h3>Liên hệ</h3>
                            <ul>
                                <li><i class="fa fa-fax"></i>  THôn 4, Thạch Hòa, Thạch Thất, Hà Nội</li>
                                <li><i class="fa fa-phone"></i> (+84) 38 616 8281</li>
                                <li><i class="fa fa-envelope-o"></i><a href="mailto:trongvdhe171724@fpt.edu.vn">trongvdhe171724@fpt.edu.vn</a> </li>
                            </ul>             
                        </div> 
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="contact_message form">
                            <h3>Gửi thông tin phản hồi</h3>   
                            <form id="contact-form" method="POST">
                                <p>       
                                    <label>  Địa chỉ email</label>
                                    <input name="email" pattern="[^ @]*@[^ @]*" placeholder="Email *" required="" value="" type="email">
                                </p>
                                <p>          
                                    <label>  Tiêu đề</label>
                                    <input name="title" placeholder="Title *" required="" value="" type="text">
                                </p>    
                                <div class="contact_textarea">
                                    <label>  Thông tin</label>
                                    <input placeholder="Message *" name="detail" required="" value="" class="form-control2" >    
                                </div>
                                <br>
                                <button type="submit" href="contact?action=sendfeedback" id="sendButton" onclick="this.disabled=true; this.innerText='Sending...'; this.form.submit();">Send</button>
                            </form> 
                        </div> 
                    </div>
                </div>
            </div>    
        </div>
        <!--contact area end-->

        <!--contact map start-->
        <div class="contact_map">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="map-area">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d931.0379001519324!2d105.52331292847721!3d21.026619250589828!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjHCsDAxJzM1LjgiTiAxMDXCsDMxJzI2LjMiRQ!5e0!3m2!1svi!2s!4v1710160174132!5m2!1svi!2s" 
                                    width="100%" height="450" style="border:1px solid black;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--contact map end-->

        <jsp:include page="layout/footer.jsp"/>

        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>

</html>