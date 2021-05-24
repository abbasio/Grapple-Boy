/// Approach (a, b, amount)
///@arg object1
///@arg object2
///@arg speed
function Approach(){
if (argument0 < argument1)
{
	argument0 += argument2;
	if (argument0 > argument1) return argument1;	
}
else
{
	argument0 -= argument2;
	if (argument0 < argument1) return argument1;
}
return argument0;
}