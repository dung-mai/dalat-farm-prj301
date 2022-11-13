<%-- 
    Document   : add-product
    Created on : Jun 26, 2022, 9:41:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                menubar: 'file edit view insert format tools table help',
                toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
                toolbar_sticky: false,
                autosave_ask_before_unload: true,
                autosave_interval: "30s",
                autosave_prefix: "{path}{query}-{id}-",
                autosave_restore_when_empty: false,
                autosave_retention: "2m",
                image_advtab: true,
                /*content_css: '//www.tiny.cloud/css/codepen.min.css',*/
                link_list: [
                    {title: 'My page 1', value: 'https://www.codexworld.com'},
                    {title: 'My page 2', value: 'https://www.xwebtools.com'}
                ],
                image_list: [
                    {title: 'My page 1', value: 'https://www.codexworld.com'},
                    {title: 'My page 2', value: 'https://www.xwebtools.com'}
                ],
                image_class_list: [
                    {title: 'None', value: ''},
                    {title: 'Some class', value: 'class-name'}
                ],
                importcss_append: true,
                file_picker_callback: function (callback, value, meta) {
                    /* Provide file and text for the link dialog */
                    if (meta.filetype === 'file') {
                        callback('https://www.google.com/logos/google.jpg', {text: 'My text'});
                    }

                    /* Provide image and alt text for the image dialog */
                    if (meta.filetype === 'image') {
                        callback('https://www.google.com/logos/google.jpg', {alt: 'My alt text'});
                    }

                    /* Provide alternative source and posted for the media dialog */
                    if (meta.filetype === 'media') {
                        callback('movie.mp4', {source2: 'alt.ogg', poster: 'https://www.google.com/logos/google.jpg'});
                    }
                },
                templates: [
                    {title: 'New Table', description: 'creates a new table', content: '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'},
                    {title: 'Starting my story', description: 'A cure for writers block', content: 'Once upon a time...'},
                    {title: 'New list with dates', description: 'New List with dates', content: '<div class="mceTmpl"><span class="cdate">cdate</span><br /><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'}
                ],
                template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
                template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
                image_caption: true,
                quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
                noneditable_noneditable_class: "mceNonEditable",
                toolbar_mode: 'sliding',
                contextmenu: "link image imagetools table"
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
                            <h2 class="content-title">Create product </h2>
                            <div>
                                <a href="${pageContext.request.getContextPath()}/admin/product" class="btn btn-outline-danger"> × Discard</a>
                            </div>
                        </div>
                        
                        <div class="message">
                            <p class="alert-message">${requestScope.successMess}</p>
                        </div>

                        <div class="content-body">
                            <div class="add-form">
                                <form method="POST">
                                    <div class="form-item">
                                        <label for="product_name" class="form-label">Product title</label>
                                        <input type="text" name="name" required="required" placeholder="Type here" class="form-control" id="product_name">
                                    </div>

                                    <div class="form-item">
                                        <label class="form-label">Full description</label>
                                        <textarea name="description" id="myTextarea" class="form-control"></textarea>
                                    </div>

                                    <div class="form-row form-row-2">
                                        <div class="form-item">
                                            <label class="form-label">Main images</label>
                                            <input name="thumbnail" accept="image/*" class="form-control" type="file" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                                            <img id="blah" alt="your image" width="100" />
                                        </div><!-- comment -->
                                    </div> <!-- row.// -->



                                    <div class="form-item">
                                        <label for="product_name" class="form-label">Tags</label>
                                        <input name="tags" type="text" class="form-control">
                                    </div>


                                    <div class="form-row form-row-2">
                                        <div class="form-item">
                                            <label class="form-label">Category</label>
                                            <select class="form-select" required="required" name="category">
                                            <c:forEach items="${requestScope.dao.getProductCategories()}" var="p_c" >
                                                <option value="${p_c.cate_id}"> ${p_c.name} </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-item">
                                        <label class="form-label">Supplier</label>
                                        <select class="form-select" required="required" name="supplier">
                                            <c:forEach items="${requestScope.dao.getSuppliers()}" var="s" >
                                                <option value="${s.getKey()}"> ${s.getValue().name} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div> <!-- row.// -->


                                <div class="form-row">

                                    <div class="form-item">
                                        <label class="form-label">Hot Date</label>
                                        <input name="hot" type="date" class="form-control">
                                    </div><!-- comment -->

                                    <div class="form-item">
                                        <label class="form-label">Unit Sell</label>
                                        <input name="unit" type="text" class="form-control">
                                    </div>

                                    <div class="form-item">
                                        <label class="form-label">Quantity</label>
                                        <input name="quantity" type="number" class="form-control">
                                    </div>

                                </div>   <!-- End form row -->

                                <div class="form-row">
                                    <div class="form-item">
                                        <label class="form-label">Unit Price</label>
                                        <input name="unitprice" type="number" step="1000" class="form-control">
                                    </div>

                                    <div class="form-item">
                                        <label class="form-label">Sale Price</label>
                                        <input name="promotion_price" type="number" step="1000" class="form-control">
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
