
function aaa() {
	var kg = document.getElementById('kg').value;
	var kgresult = document.getElementById('kgresult');
	if (kg >= 50) {		
		kgresult.value = 50 * 10 + 100 + 20 * (kg-50);
	} else{
		kgresult.value = kg * 10 + 100;
	}
}


//函数：x<1的时候，y = x；1<=x<10的时候，y=2x-1；x>=10的时候，y=3x-11。写一段程序，输入x，输出y值。\
function bbb() {
	var x = document.getElementById('xvalue').value;
	var y = document.getElementById('yvalue');
	if (x < 1) {
		y.value = x;
	} else if (x < 10){
		y.value = 2*x - 1;
	}else {
		y.value = 3*x - 11;
	}
}
			
function ddd() {
	
	
	var year = +document.getElementById('year').value;
	var month = +document.getElementById('month').value;
	var day = +document.getElementById('day').value;
	var result = document.getElementById('dayresult');
	result.value = 0;
	switch (month){
		case 1:
		{
			result.value = day;
		}
			break;
		case 2:
		{
			result.value =  31 + day;
		}
			break;
		case 3:
		{
			result.value = 31 + 28 + day;
		}
			break;
		case 4:
		{
			result.value =  31 + 28 + 31 + day;
		}
			break;
		case 5:
		{
			result.value = 31 + 28 + 31 + 30 +day;
		}
			break;
		case 6:
		{
			result.value = 31 + 28 + 31+ 30 + 31 + day;
		}
			break;
		case 7:
		{
			result.value = 31 + 28 + 31+ 30 + 31 + 30 + day;
		}
			break;
		case 8:
		{
			result.value =  31 + 28 + 31+ 30 + 31 + 30 + 31 + day;
		}
			break;
		case 9:
		{
			result.value = 31 + 28 + 31+ 30 + 31 + 30 + 31 + 31 + day;
		}
			break;
		case 10:
		{
			result.value = 31 + 28 + 31+ 30 + 31 + 30 + 31 + 31 + 30 + day;
		}
			break;
		case 11:
		{
			result.value = 31 + 28 + 31+ 30 + 31 + 30 + 31 + 31 + 30 + 31 + day;
		}
			break;
		case 12:
		{
			result.value = 31 + 28 + 31+ 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + day;
		}
			break;
			
		default:
			break;		
	}
	
	if (month > 2) {
		if (( year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
			result.value = ++result.value;
		}
	}
	
	dateee.year = year;
	dateee.month = month;
	dateee.day = day;
	dateee.person.name = "牛大佬";
	alert(String(dateee.year)+'   '+String(dateee.month)+"  "+String(dateee.day)+ "  "+ dateee.person.name);
	
	
}


document.write('水仙花数：');
	for (var i = 1; i < 10; i++) {
		for (var j = 0; j < 10; j++) {
			for (var k = 0; k < 10; k++) {
				if (i * i * i + j * j * j + k * k * k == i * 100 + j * 10 + k) {
					document.write(i * 100 + j * 10 + k + '<br/>');
				}
			}
		}
	}
	
	
	
var person = new Object();
person.name = "hello,\n";
person.age = "world";
document.write(person.name + person.age);


var dateee = new Object();
dateee.year = "";
dateee.month = "";
dateee.day = "";
dateee.person = person;


