// JavaScript Document
window.onload = function(){
	 var lik = document.getElementsByTagName("li");
	 
	 function fun(i,j){
		 lik[i].style.opacity = 1;
		  lik[j].style.opacity = 0;	 
}
     fun(0,1);
	 var i=0;
	 setInterval(function(){
		 if(++i >= 5 ){
			 i = 0;
			 fun(0,4);
		 }
		 else fun(i,i-1);
	 },2000);
}
		 