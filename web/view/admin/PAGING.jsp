<%-- 
    Document   : PAGING
    Created on : Jul 14, 2022, 11:48:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="paging-product-list">
    <form method="POST" style="width: 73%;" id="main-form">
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
    </form>

</div>

<script>
    pagger('pagger',${requestScope.pageindex},${requestScope.totalpage}, 2, ${requestScope.cid});
</script>