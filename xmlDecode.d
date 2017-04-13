import std.stdio;
import std.string;
import std.conv;

void main()
{
	string str = `<xml>
		<return_code><![CDATA[SUCCESS]]></return_code>
		<return_msg><![CDATA]></return_msg>
		<appid><![CDATA[wx06a0e77b790bbc19]]></appid>
		<mch_id><![CDATA[1308474501]]></mch_id>
		<nonce_str><![CDATA[v0FK8hrQJ4NqMLoT]]></nonce_str>
		<sign><![CDATA[FC4016C251CEE84D4DF0C90457242AE3]]></sign>
		<result_code><![CDATA[SUCCESS]]></result_code>
		<prepay_id><![CDATA[wx20170413110145ae31d512e40733401154]]></prepay_id>
		<trade_type><![CDATA[APP]]></trade_type>
		</xml>`;

	XMLtree root = new XMLtree("root");
	strToTree(root,str,0,str.length.to!int);
}

XMLtree strToTree(XMLtree parent,string str,int s,int e)
{
	//writeln(s,"",e,"",str[s]);
	if(s > e)return parent;
	if(str[s] == '\n')
		return strToTree(parent,str,s+1,e);
	if(s == 0)
		return strToTree(parent,str,5,str.length.to!int - 6);
	while(s < e){
	//Node node = pushNode(str,s,e);
	//writeln(node);
	return parent;
}
/*
Node pushNode(string str,int s,int e)
{
	int result = 0;
	writeln("pushStartNode:"," s: ",s," e:",e," str[s]:",str[s]);
	while(s < e){
		if(str[s] == '<')
			return pushNode(str,s+1,e);
		result++;
		s++;
		if(str[s] == '>')
			break;
	}
	Node node;
	node.len = result;
	node.name = str[s-result .. s];
	node.start = s - result;
	
	string endNode = "</" ~ node.name ~ ">";
	while(s < e){
		if(str[s .. s+3+node.len] == endNode){
			node.end = s;
			break;
		}
		s++;
	}
	return node;
}
*/
abstract class Element
{
	public string Evaluate();
}

class Statement : Element
{
	Element parent;
	string value;
	override public string Evaluate(){
		return value;
	}
}
class Annotations : Element
{
	Element parent;
	string value;
	override public string Evaluate(){
		return value;
	}
}
class Cdata : Element
{
	Element parent;
	string value;
	override public string Evaluate(){
		return value;
	}
}
class Node : Element
{
	Element parent;
	string value;
	override public string Evaluate(){
		return value;
	}
}

class XMLtree : Element
{
	string node;
	string value;
	XMLtree parent;
	XMLtree[string] childs;

	this()
	{
	
	}
	this(string node)
	{
		this.node = node;
	}
}
