<%
String[] brch1=DataIn.getBranch();//retriving branch

List<String[]> l1 = new ArrayList<String[]>();
for(int i=0;i<brch1.length;i++)
{
	l1.add(DataIn.getSubject(brch1[i],1));//retriving subject for spec
}
String[][] sm1= new String[l1.size()][];
l1.toArray(sm1);


List<String[]> l2 = new ArrayList<String[]>();
for(int i=0;i<brch1.length;i++)
{
	l2.add(DataIn.getSubject(brch1[i],2));//retriving subject for spec
}
String[][] sm2= new String[l2.size()][];
l2.toArray(sm2);
			

List<String[]> l3 = new ArrayList<String[]>();
for(int i=0;i<brch1.length;i++)
{
	l3.add(DataIn.getSubject(brch1[i],3));//retriving subject for spec
}
String[][] sm3= new String[l3.size()][];
l3.toArray(sm3);
			
List<String[]> l4 = new ArrayList<String[]>();
for(int i=0;i<brch1.length;i++)
{
	l4.add(DataIn.getSubject(brch1[i],4));//retriving subject for spec
}
String[][] sm4= new String[l3.size()][];
l4.toArray(sm4);

List<String[]> l5 = new ArrayList<String[]>();
for(int i=0;i<brch1.length;i++)
{
	l5.add(DataIn.getSubject(brch1[i],5));//retriving subject for spec
}
String[][] sm5= new String[l5.size()][];
l5.toArray(sm5);
			
List<String[]> l6 = new ArrayList<String[]>();
for(int i=0;i<brch1.length;i++)
{
	l6.add(DataIn.getSubject(brch1[i],6));//retriving subject for spec
}
String[][] sm6= new String[l6.size()][];
l6.toArray(sm6);
			
List<String[]> l7 = new ArrayList<String[]>();
for(int i=0;i<brch1.length;i++)
{
	l7.add(DataIn.getSubject(brch1[i],7));//retriving subject for spec
}
String[][] sm7= new String[l7.size()][];
l7.toArray(sm7);
			
List<String[]> l8 = new ArrayList<String[]>();
for(int i=0;i<brch1.length;i++)
{
	l8.add(DataIn.getSubject(brch1[i],8));//retriving subject for spec
}
String[][] sm8= new String[l8.size()][];
l8.toArray(sm8);
%>