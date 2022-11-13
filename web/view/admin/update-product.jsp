<%-- 
    Document   : add-product
    Created on : Jun 26, 2022, 9:41:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='../../css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='../../css/add-product.css'>
        <script src='../../tinymce/tinymce.min.js'></script>
        <script>
            tinymce.init({
                selector: '#myTextarea',
                height: 300,
                plugins: 'print preview paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
                imagetools_cors_hosts: ['picsum.photos'],
                menubar: ''
            });
        </script>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main">
                        <div class="content-header">
                            <h2 class="content-title">Update product </h2>
                            <div>
                                <a href="${pageContext.request.getContextPath()}/admin/product" class="btn btn-outline-danger"> × Discard</a>
                        </div>
                    </div>

                    <c:if test="${requestScope.mess != null}">
                        <div class="message ${requestScope.check == false? "danger":""}">
                            <p class="alert-message">${requestScope.mess}</p>
                        </div>
                    </c:if>
                    <div class="content-body">
                        <div class="add-form">
                            <form action="" method="POST">
                                <div class="form-item">
                                    <label for="product_name" class="form-label">Product title</label>
                                    <input type="text" name="name" required="required" placeholder="Type here" class="form-control" value="${requestScope.product.name}">
                                </div>

                                <div class="form-item">
                                    <label class="form-label">Full description</label>
                                    <textarea name="description" id="myTextarea" class="form-control">
                                        ${requestScope.product.detail}
                                    </textarea>
                                </div>

                                <div class="form-row form-row-2">
                                    <div class="form-item">
                                        <label class="form-label">Main images</label>
                                        <input name="thumbnail" accept="image/*" class="form-control" type="file" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                                        <img id="blah" alt="your image" width="100" src="${pageContext.request.getContextPath()}/${requestScope.product.thumbnail}"/>
                                    </div><!-- comment -->
                                </div> <!-- row.// -->



                                <div class="form-item">
                                    <label for="product_name" class="form-label">Tags</label>
                                    <input name="tags" type="text" class="form-control" value="${requestScope.product.tags}">
                                </div>


                                <div class="form-row form-row-2">

                                    <div class="form-item">
                                        <label class="form-label">Category</label>
                                        <select class="form-select" required="required" name="category" >
                                            <c:forEach items="${requestScope.dao.getProductCategories()}" var="p_c" >
                                                <option value="${p_c.cate_id}" ${requestScope.product.cate_id==p_c.cate_id?"selected":""}>
                                                    ${p_c.name} </option>
                                                </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-item">
                                        <label class="form-label">Supplier</label>
                                        <select class="form-select" required="required" name="supplier">
                                            <c:forEach items="${requestScope.dao.getSuppliers()}" var="s" >
                                                <option value="${s.getKey()}" ${requestScope.product.supplier_id==s.getValue().supplier_id?"selected":""}>
                                                    ${s.getValue().name} </option>
                                                </c:forEach>
                                        </select>
                                    </div>
                                </div> <!-- row.// -->


                                <div class="form-row">

                                    <div class="form-item">
                                        <label class="form-label">Hot Date</label>
                                        <input name="hot" type="date" class="form-control" value="${requestScope.product.hot}">
                                    </div><!-- comment -->

                                    <div class="form-item">
                                        <label class="form-label">Unit Sell</label>
                                        <input name="unit" type="text" value="${requestScope.product.unit}" class="form-control">
                                    </div>

                                    <div class="form-item">
                                        <label class="form-label">Quantity</label>
                                        <input name="quantity" type="number" value="${requestScope.product.quantity}" class="form-control">
                                    </div>

                                </div>   <!-- End form row -->

                                <div class="form-row">
                                    <div class="form-item">
                                        <label class="form-label">Unit Price</label>
                                        <input name="unitprice" type="number" step="1000" value="${requestScope.product.unitprice}" class="form-control">
                                    </div>

                                    <div class="form-item">
                                        <label class="form-label">Sale Price</label>
                                        <input name="promotion_price" type="number" step="1000" value="${requestScope.product.promotion_price}" class="form-control">
                                    </div>
                                </div> <!-- End form row -->

                                <button type="submit" class="btn btn-primary">Submit item</button>
                            </form>
                        </div>
                    </div> <!-- card end// -->


                </section>
            </main>
        </div>

    </body>
</html>
