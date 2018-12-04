<%@ tag description="morethan8" pageEncoding="UTF-8"%>
<%@ tag import="java.util.ArrayList"%>

<%! 
private class Option1 { 
    int value; 
    String label;
    
    Option1(int value, String label) {
        this.value = value;
        this.label = label;
    }
} 
%>
<%


int current = 0;
if (request.getParameter("semester") != null)
    current = Integer.parseInt(request.getParameter("semester"));



String queryString = request.getQueryString();
if (queryString == null) //search뒤에 파라미터가 없는 경우
    queryString = "semester=@@@";
else if (queryString.matches(".*semester=[0-9]+.*")) //semester외에도 다른 파라미터가 있는 경우
    queryString = queryString.replaceAll("semester=[0-9]+", "semester=@@@");
else
    queryString = queryString + "&semester=@@@";
String url = request.getAttribute("javax.servlet.forward.request_uri") + "?" + queryString;
%>

<div class="morethan8">
	<input type="checkbox" name=morethan8 onclick="morethan8onClick()" value="notchecked" />8학기
	이상
</div>
<script language="javascript">

function morethan8onClick()
{
	var value=$('input[name=morethan8]').val();
	value="checked"
	location.href='<%= url.replace("@@@", "8") %>';
	
	
}

</script>

