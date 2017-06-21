<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Population.aspx.cs" Inherits="Mindlance.Web.Population" %>
<!DOCTYPE html >

<html data-ng-app="mSSApp" >
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <script src="../scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="scripts/angular.min.js" type="text/javascript"></script>
    <script src="scripts/angular-route.js" type="text/javascript"></script>
    <script src="../App/app.js" type="text/javascript"></script>
    <script src="../App/controllers.js" type="text/javascript"></script>
    
    <script src="scripts/bootstrap.js"></script>
   <style type="text/css">
        /* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
.Row
{
    display: table;
    width: 100%; /*Optional*/
    table-layout: fixed; /*Optional*/
    border-spacing: 10px; /*Optional*/
}
.Column
{
    display: table-cell;
    background-color: red; /*Optional*/
}
table, td, th {
    border: 1px solid black;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th {
    text-align: left;
}
    </style>
</head>
    

<body>

    <form id="form1" runat="server" data-ng-controller="PopulationController">     

        <div id="myModal" class="modal">

            <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
      <table style="align-content:center;text-align:right;">
                <tr>
                    <td colspan="2">
                        <p style="text-align:center;color:darkblue">{{selectedCity.city}}</p>
                    </td>                    
                </tr>
                <tr>
                    <td colspan="2"><p style="text-align:center;color:darkblue">State:  {{selectedCity.state}}</p> </td>
                    
                </tr>
                <tr>
                    <td><P style="text-align:center;color:darkblue">Population</P></td>
                    <td style="text-align:center;"><input type="text" data-ng-model="modelPopulation"/></td>
                </tr>
                 <tr>
                     <td colspan="2"><p style="text-align:center;color:darkblue">Zip:  {{selectedCity._id}}</p> </td>                    
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;"><input type="button" value="Save" data-ng-click="UpdateCity()" />&nbsp;<input type="button" value="Cancel" data-ng-click="Cancel()" /></td>
                    
                </tr>
            </table>
  </div>


          
        </div>


    <div >
       
    <div >

        <div align="center" style="border:1px solid double">
            <div align="center" style="border:1px solid double">
                <table style="width:80%">
                    
                        
                                <tr>
                                    <td colspan="2" style="text-align:center;width:auto;height:50px;font-size:x-large;color:darkblue">US City Population Data</td>
                                </tr>
                                
                                <tr>
                                   <%-- <td>
                                        <table >
                                            <tr>--%>
                                                <td colspan="2" style="text-align:center;width:auto;height:50px"><input type="text"  placeholder="Please Enter City" data-ng-model="SelectCity"/><input type="button" value="Search" data-ng-click="SearchCity()"></td>
                                                
                                           <%-- </tr>
                                        </table>--%>
                                        
                                    
                                </tr>
                                
                            
                   
                </table>
                <br />
                <br />
            </div>
            <div class="table-responsive">


                <table >                    
                    <thead>
                        <th colspan="2" style="width:20%">City</th>
                        <th colspan="2" style="width:20%">State</th>
                        <th colspan="2" style="width:20%">Zip</th>
                        <th colspan="2" style="width:20%">Population</th>
                    </thead>

                    <tr ng-repeat="pop in populations">
                <td colspan="2" style="align-content:space-around;width:20%">
                    <a href="" data-ng-click="DisplaySelectedCity(pop)">{{pop.city}}</a>                    
                </td>
                <td colspan="2" style="align-content:center;width:20%">
                    {{pop.state}}
                </td>
                <td colspan="2" style="align-content:center;width:20%">
                    {{pop._id}}
                </td>
              <td colspan="2" style="align-content:center;width:20%">
                    {{pop.pop}}
                </td>
            
            </tr>
                    <%--<tr>
                                                
                    </tr>--%>
                    <%--<tr>
                        <td>We are seeing pages from {{start}} to {{end}}</td>
                    </tr>--%>
                      
                </table>
               <br />
                <div class="Row">
                    <a href="" data-ng-click="First()">First</a>&nbsp;
                    <a href="" data-ng-click="Previous()">Previous</a>&nbsp;
                    <a href="" data-ng-click="Next()">Next</a>&nbsp;
                    <a href="" data-ng-click="Last()">Last</a>
                </div>
                                
            </div>
        </div>
    </div>
    <%--<div id="mydiv" data-ng-show="loading">
        <img src="Images/ajax-loader.gif" class="ajax-loader" />
    </div>--%>
</div>

   

    </form>
</body>
</html>
