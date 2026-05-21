<%--
  Created by IntelliJ IDEA.
  User: Facundo-I
  Date: 5/20/2026
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="nuevoVideo" class="ubp.pdc.pdcpracticos.abmvideos.VideoBean" scope="page" />

<jsp:setProperty name="nuevoVideo" property="*"/>

<jsp:useBean id="abmVideos" class="ubp.pdc.pdcpracticos.abmvideos.GestorVideosBean" scope="session"></jsp:useBean>

<c:set target="${abmVideos}" property="nuevoVideo" value="${nuevoVideo}" />

<jsp:forward page="index.jsp"></jsp:forward>