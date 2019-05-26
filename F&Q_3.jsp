<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Shekhar's school</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css.css"/>
        <link rel="stylesheet" href="css/templatemo-style_1.css">
    </head>

<body background="photo/r.jpg">
<script language="javascript">
function PrintMe(DivID) {
var disp_setting="toolbar=yes,location=no,";
disp_setting+="directories=yes,menubar=yes,";
disp_setting+="scrollbars=yes,width=650, height=600, left=100, top=25";
   var content_vlue = document.getElementById(DivID).innerHTML;
   var docprint=window.open("","",disp_setting);
   docprint.document.open();
   docprint.document.write('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"');
   docprint.document.write('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
   docprint.document.write('<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">');
   docprint.document.write('<head><title>shekhars_school</title>');
   docprint.document.write('<style type="text/css">body{ margin:0px;');
   docprint.document.write('font-family:verdana,Arial;color:#000;');
   docprint.document.write('font-family:Verdana, Geneva, sans-serif; font-size:12px;}');
   docprint.document.write('a{color:#000;text-decoration:none;} </style>');
   docprint.document.write('</head><body onLoad="self.print()"><center>');
   docprint.document.write(content_vlue);
   docprint.document.write('</center></body></html>');
   docprint.document.close();
   docprint.focus();
}
</script>
      
    <nav>
         <div id="course-table">
        <ul>
            <li class="active"><a href="admin.jsp">Home</a></li>
            <li class="dropdown"><a href="#">Course</a>
                <div class="dropdown-content">
                <a href="viewallcourse.jsp">ViewCourse</a>
                <a href="addcourse.jsp">Add New Course</a>
                <a href="modifycourse.jsp">Modify Course</a>
                <a href="deletecourse.jsp">Delete Course</a>
                </div>
            </li>
            <li  class="dropdown"><a href="#">ClassRoom Students</a>
                <div class="dropdown-content">
                <a href="viewallstudent.jsp">View students</a>
                <a href="addstudent.jsp">Add New student</a>
                <a href="modifystudent.jsp">Modify student</a>
                <a href="deletestudent.jsp">Delete student</a>
                </div>
            </li>
            <li  class="dropdown"><a href="#">Outside Students</a>
                <div class="dropdown-content">
                <a href="viewalloutsidestudent.jsp">View students</a>
                <a href="deleteoutsidestudent.jsp">Delete student</a>
                </div>
            </li>
            
            <li  class="dropdown"><a href="#">Enrol</a>
                <div class="dropdown-content">
                <a href="enrol.jsp">Enrol</a>
                <a href="removestudent.jsp">Remove</a>
                </div>
            </li>
            <li><a href="fee.jsp">Fees</a></li>
             
              <li  class="dropdown"><a href="#">Upload & Delete File</a>
                <div class="dropdown-content">
               <a href="index.jsp">Upload File</a>
                <a href="file-list_2.jsp">Delete File</a>
                </div>
            </li>
            <li  class="dropdown"><a href="#">F&Q</a>
                <div class="dropdown-content">
               <a href="F&Q_1.jsp">Answering Question</a>
                <a href="F&Q_3.jsp">Delete F&Q</a>
                </div>
            </li>
           <li style="float:right"><img src="photo/logo.png"></a></li>
            <li style="float:right"><a href="logout.jsp">Logout</a></li>
                 <li style="float:right"> <input type="button" name="btnprint" value="Print" onclick="PrintMe('divid')"</li>
                <a class="cta-btn" href="ChangePassword.jsp">Change Password</a>  
            
        </ul>
        </div>
      
    </nav>


    <div class="page-heading">
        <div class="container">
            <div class="heading-content">
                <h1>STUDY <em>Point</em></h1>
            </div>
        </div>
    </div>
<div id="divid">
    <div class="more-about-us">
        <div class="container">
            <div class="col-md-10 col-md-offset-3">
                 <%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  Connection conn = null;
  String url="jdbc:mysql://localhost:3306/";
  String dbName ="database2";
  String  driver="com.mysql.jdbc.Driver";
  String userName="root";
  String password="";
  Statement st;
  try{
      Class.forName(driver).newInstance();
      conn= DriverManager.getConnection(url+dbName,userName,password);
      st=conn.createStatement();
      String id=request.getParameter("id");
       String solution=request.getParameter("solution");
       String qq="Update quessolmaster set solution='"+solution+"' where id="+id+" ;";
        int resu = st.executeUpdate(qq);
       String quer="select * from quessolmaster;";
      ResultSet rs = st.executeQuery(quer);
      
   %>  
  <%--
create table quessolmaster (id integer auto_increment,student varchar(20),
course varchar(20),question varchar(1000)  ,solution varchar(1000),primary key(id));
select * from quessolmaster;
  --%>
  <form method="post" action="F&Q_4.jsp">
      <table Id="course-table" align="center">
          <tr>
                <th>NAME OF STUDENT</th>
                <th>NAME OF COURSE</th>
                <th>QUESTION</th>
                <th>SOLUTION</th>
                <th>Select</th>
            </tr>
         <%
 while(rs.next()){   
 %>
            <tr>
                <td><%=rs.getString("student")%></td>
                <td><%=rs.getString("course")%></td>
               
                <td><TEXTAREA NAME="Question" rows="15" cols="32" readonly="1">
                <%=rs.getString("question")%>      
              </TEXTAREA></td>
              <td><TEXTAREA NAME="Solution" rows="15" cols="32" readonly="1">
                <%=rs.getString("Solution")%>      
              </TEXTAREA></td>
               <td><input type="radio" name="selectedStudent" value="<%=rs.getInt("id")%>"</td>
            </tr>
            
            <%  }  %>
              <tr>
                 <td colspan="6" align="center" ><input type="submit" value="DELETE"></td>
                 
            </tr>
</table>
  <%    
  }
  catch(Exception e){out.println(e);}
%>
      
     
          
           
         
            </div>
        </div>
    </div>
</div>
</body>
</html>
