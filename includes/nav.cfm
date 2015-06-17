<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <cfoutput><a class="navbar-brand" href="#baseURL#">CF 101</a></cfoutput>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <cfoutput>
          <li class="active"><a href="#baseURL#">HOME <span class="sr-only">(current)</span></a></li>
        </cfoutput>
				<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee DB <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <cfoutput>
              <li><a href="#baseURL#employees/index.cfm">Employee List</a></li>
              <li><a href="#baseURL#employees/search.cfm">Employee Search</a></li>
						</cfoutput>
          </ul>
        </li>
      </ul>
      <cfoutput>
       <form action="#baseurl#employees/details.cfm" method="get" class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input name="emp_no" type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      </cfoutput> 
      <ul class="nav navbar-nav navbar-right">
        <li><a target="_blank" href="https://github.com/jbriccetti/cf101-fasttrack">GitHub Repo</a></li>
        <li><a target="_blank" href="http://getbootstrap.com">Bootstrap UI</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Help <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a target="_blank" href="http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/index.html">CF Docs</a></li>
            <li><a target="_blank" href="http://www.cflib.org/">CFLIB.ORG</a></li>
            <!--- <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li> --->
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<!--- <cfoutput>
  <nav>
    <a href="#baseURL#index.cfm">HOME</a>
    <a href="#baseURL#employees/index.cfm">EMPLOYEES</a>
  </nav>
</cfoutput> --->