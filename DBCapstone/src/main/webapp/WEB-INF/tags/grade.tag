<%@ tag description="grade" pageEncoding="UTF-8"%>
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
if (request.getParameter("grade") != null) //전달된 url에 grade이 있을 경우
    current = Integer.parseInt(request.getParameter("grade")); //현재를 전달받은 파라미터 값으로 정함



String queryString = request.getQueryString();
if (queryString == null) //search뒤에 파라미터가 없는 경우
    queryString = "grade=@@@";
else if (queryString.matches(".*grade=[0-9]+.*")) //grade외에도 다른 파라미터가 있는 경우
    queryString = queryString.replaceAll("grade=[0-9]+", "grade=@@@");
else
    queryString = queryString + "&grade=@@@";
String url = request.getAttribute("javax.servlet.forward.request_uri") + "?" + queryString;

ArrayList<Option1> gradeList = new ArrayList<Option1>();


   gradeList.add(new Option1(0, "A"));
   gradeList.add(new Option1(1, "1"));
   gradeList.add(new Option1(2, "2"));
   gradeList.add(new Option1(3, "3"));
   gradeList.add(new Option1(4, "4"));
   gradeList.add(new Option1(5, "+"));


%>
<div class="grade">
	<% for (Option1 o : gradeList) { %>
	<span id="circle" class='<%= o.value == current ? "active" : "" %>'><a
		href='<%= url.replace("@@@", String.valueOf(o.value)) %>'><%= o.label %></a>
	</span>
	<% } %>
</div>
