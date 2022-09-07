const qty = document.getElementsByClassName("qty");
const dbqty = document.getElementsByClassName("dbqty");
const totcol = document.querySelectorAll(".tot-col span");
const prices = document.querySelectorAll(".price-col span");
const subtot = document.querySelector(".subtotal span");
const totprice = document.querySelector(".totalprice span");
const checkoutlink = document.querySelector(".checkout-link");

let sub_tot_cost = 0;

for(let i=0; i< qty.length ; i++){
	
	const qtyfromdb = dbqty[i].textContent;
	const price = prices[i].textContent;
	const options = qty[i].getElementsByTagName("option");
	options[parseInt(qtyfromdb) -1].setAttribute("selected", "");
	
	totcol[i].textContent = parseInt(qtyfromdb) * parseInt(price);
	sub_tot_cost += parseInt(totcol[i].textContent);
	
	qty[i].onchange = e => {
		const quantity = parseInt(e.target.options.selectedIndex) + 1;
		const pid = qty[i].classList[0];
		window.location.href="http://localhost:8080/musica/views/updatecart?pid="+pid+"&qty="+quantity;
	}
}

subtot.textContent = sub_tot_cost;
totprice.textContent = (parseInt(sub_tot_cost)>0) ?  parseInt(sub_tot_cost)+ 56 : 0;

checkoutlink.setAttribute("href", "./payment.jsp?price=" + parseInt(totprice.textContent));

