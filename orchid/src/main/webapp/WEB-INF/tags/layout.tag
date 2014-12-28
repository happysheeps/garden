<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>UML editor based on PlantUML</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="UML online editor">
	<link href="${model.webapp}/css/bootstrap.css" type="text/css" rel="stylesheet">
	<link href="${model.webapp}/css/bootstrap-responsive.css" type="text/css" rel="stylesheet">
	<script src="${model.webapp}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">var contextpath = "${model.webapp}";</script>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset="50">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="selected"><a href="${model.webapp}/uml">Edit</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/usecase.jsp">Use Case</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/sequence.jsp">Sequence</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/classes.jsp">Class</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/activity.jsp">Activity</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/activity2.jsp">Advanced Activity</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/component.jsp">Component</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/state.jsp">State</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/skinparam.jsp">Skin Param</a></li>
						<li class="selected"><a href="${model.webapp}/jsp/help/salt.jsp">Salt</a></li>
						<li class="selected"><a href="${model.webapp}/PlantUML_Language_Reference_Guide.pdf">Guide in PDF</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid" style="min-height:524px;">
		<div class="row-fluid">
			<div class="span12">
				<br><br>
				<jsp:doBody />
			</div>
		</div>
	</div>
	<!--/.fluid-container-->

	<script src="${model.webapp}/js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
