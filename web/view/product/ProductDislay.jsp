<%-- 
    Document   : ProductDislay
    Created on : Jun 18, 2022, 10:23:29 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="shop-container_list" id="product-display">
    <c:forEach items="${requestScope.pList}" var="p">
        <c:if test="${p.quantity > 0}">
            <div class="section_item shop-product product">
                <div class="box-image">
                    <a href="product?pid=${p.product_id}">
                        <img src="${p.thumbnail}" alt=""/>
                    </a>
                </div>
                <div class="box-text">
                    <a href="product?pid=${p.product_id}">
                        <h4 class="product_title">${p.name}</h4>
                    </a>
                    <c:choose>
                        <c:when test="${p.promotion_price == p.unitprice}">
                            <div class="price-wrapper">
                                <span>${p.unitprice/1000}00 đ</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="product-price">
                                <div class="product-price__current-price">${p.promotion_price/1000}00 ₫</div>
                                <div class="product-price__discount-rate">-${100-Math.ceil(p.promotion_price/p.unitprice*100)}%</div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <button><a href="buy?pid=${p.product_id}">Thêm vào giỏ</a></button>
                </div>
            </div> <!-- bài viết-->
        </c:if>
    </c:forEach>
</div>

<div class="paging-product-list">
    <form method="POST" id="main-form">
        <div id="pagger" class="pagger">

        </div>

        <div class="nrpp">
            <select name="pagesize" onchange="this.form.submit()">
                <c:forEach items="${requestScope.nrppArr}" var="p">
                    <option value="${p}" 
                            <c:if test="${requestScope.pagesize==p}">
                                selected
                            </c:if>
                            >${p}</option>
                </c:forEach>
            </select>
            <span>Hiển thị ${(requestScope.pageindex-1)*requestScope.pagesize + 1}–
                ${requestScope.totalrecords < requestScope.pageindex*requestScope.pagesize?requestScope.totalrecords:requestScope.pageindex*requestScope.pagesize}
                trong ${requestScope.totalrecords} kết quả</span>
            <p class="result-count">
            </p>
        </div>
        <input type="hidden" name="orderBy" value="${requestScope.orderBy}">
        <input type="hidden" name="inputmin" id="hiddenMin" value="${requestScope.inputmin}">
        <input type="hidden" name="inputmax" id="hiddenMax" value="${requestScope.inputmax}">
        <input type="hidden" name="q" id="hiddenSearch" value="${requestScope.qtext}">
    </form>

</div>
<script>
    pagger('pagger',${requestScope.pageindex},${requestScope.totalpage}, 2, ${requestScope.cid});
</script>

