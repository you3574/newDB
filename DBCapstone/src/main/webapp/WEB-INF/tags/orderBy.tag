<%@ tag description="orderBy" pageEncoding="UTF-8"%>
<%@ tag import="java.util.ArrayList" %>

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
if (request.getParameter("orderBy") != null)
    current = Integer.parseInt(request.getParameter("orderBy"));



String queryString = request.getQueryString();
if (queryString == null) //search뒤에 파라미터가 없는 경우
    queryString = "orderBy=@@@";
else if (queryString.matches(".*orderBy=[0-9]+.*")) //orderBy외에도 다른 파라미터가 있는 경우
    queryString = queryString.replaceAll("orderBy=[0-9]+", "orderBy=@@@");
else
    queryString = queryString + "&orderBy=@@@";
String url = request.getAttribute("javax.servlet.forward.request_uri") + "?" + queryString;

ArrayList<Option1> orders = new ArrayList<Option1>();


   orders.add(new Option1(0, "ID오름차순"));
   orders.add(new Option1(1, "ID내림차순"));
   orders.add(new Option1(2, "학번순"));


%>
<ul class="orderBy">
	<% for (Option1 o : orders) { %>
	<li class='<%= o.value == current ? "active" : "" %>'><a
		href='<%= url.replace("@@@", String.valueOf(o.value)) %>'><%= o.label %></a>
	</li>
	<% } %>
</ul>
