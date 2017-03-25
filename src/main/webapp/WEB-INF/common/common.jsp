<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- <%@ page import="com.iokbl.www.core.util.BaseResources"%> --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ taglib prefix="domain" uri="http://www.iokbl/jsp/tag/domain"%> --%>
<c:set var="domain" value="${pageContext.request.contextPath}"/> 
<script>
	var domain = {
// 		main : "${domains.main}",
		main :"${pageContext.request.contextPath}",
	};
</script>
