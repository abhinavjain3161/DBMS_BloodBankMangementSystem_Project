var app = angular.module("bloodApp",[])

/* DONOR */

app.controller("donorController",function($scope,$http){

$scope.loadDonors=function(){

$http.get("http://localhost:3000/donors")
.then(function(response){

$scope.donors=response.data

})

}

$scope.addDonor=function(){

$http.post("http://localhost:3000/donor",$scope.donor)
.then(function(){

alert("Donor Registered")

$scope.loadDonors()

$scope.donor={}

})

}

$scope.loadDonors()

})

/* RECIPIENT REQUEST */

app.controller("recipientController",function($scope,$http){

$scope.addRecipient=function(){

$http.post("http://localhost:3000/recipient",$scope.recipient)
.then(function(){

alert("Blood Request Submitted")

$scope.recipient={}

})

}

})

/* RECIPIENT LIST */

app.controller("recipientListController",function($scope,$http){

$scope.loadRecipients=function(){

$http.get("http://localhost:3000/recipients")
.then(function(response){

$scope.recipients=response.data

})

}

$scope.loadRecipients()

})

/* BLOOD SEARCH */

app.controller("searchController",function($scope,$http){

$scope.searchBlood=function(){

$http.get("http://localhost:3000/blood/"+$scope.group)
.then(function(response){

$scope.blood=response.data

})

}

})

/* BLOOD INVENTORY */

app.controller("bloodController",function($scope,$http){

$scope.loadBlood=function(){

$http.get("http://localhost:3000/bloodunits")
.then(function(response){

$scope.bloodunits=response.data

})

}

$scope.loadBlood()

})

/* ISSUE BLOOD */

app.controller("issueController",function($scope,$http){

$scope.loadUnits=function(){

$http.get("http://localhost:3000/bloodavailable")
.then(function(response){

$scope.bloodunits=response.data

})

}

$scope.issueBlood=function(){

$http.post("http://localhost:3000/issueblood",{

recipient_id:$scope.recipient_id,
unitNo:$scope.unitNo

})
.then(function(){

alert("Blood Issued Successfully")

$scope.loadUnits()

})

}

$scope.loadUnits()

})