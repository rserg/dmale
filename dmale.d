import std.stdio,std.string,std.exception,std.math, std.algorithm;

template doubleTemplate(T,S){
	alias T[][][S] KeyValues;
	alias T[][][S] KeyValue;
	//alias
}

template singleTemplate(T){
	alias T[] VArray;
	alias T[][]VArrays;
}

//TODO Parse file with matrix of params
class ParseText
{

}

//Some struct of values
struct knn(T,R)
{
	string name;
	T length_chas;
	T length_lepes;
	T dimension;
}


class Attributes{}
class LoadKNN(T,V=singleTemplate!(T).VArray)
{
	this(V[] arr, V cand)
	{
		this.set = arr;
		this.svalue = cand;
	}
	private int x;

	//const pure @safe nothrow @property
	int length()
	{
	     return this.set.length;
	}

	private mixin template DefineAttribute(T, Ts...)
	{

	}


    private string get_weight(T[] dims, int[string] wegt, string[] names)
    {

    	double max = 0.0;
    	string name="8";
    	for(int i = 0;i < dims.length;++i)
    	{
    		string mem = names[i];
    		if(names[i] != null)
    		{
    		  double sum = 0.0;
    		  for(int j = i;j < dims.length;++j)
    		  {
    			  if(names[i] == names[j])
    			  {
    				sum += (1/(pow(dims[i], 2)));
    				names[j] = null;
    			  }
    		  }
    		  if(max < sum)
    		  {
    		  	max = sum;
    		  	name = mem;
    		  }
    		  writeln(sum);
    		}

    	}
    	return name;
    }


	string get(string[]names)
	{
	   auto newdim = new T[this.set.length];
	   int inc = 0;
	   T max = 0.0;
	   int pos = 0;
	   int[string]wegt;

	   if(names.length != set.length)
	   	return "Null";
	   foreach(name;this.set)
	   {
	   	    auto dim = 0.0;
	   		for(int i = 0;i < name.length;++i)
	   		{
	   			dim+= pow(this.svalue[i] - name[i],2);
	   		}
	   		auto sqr = sqrt(dim);
	   		newdim[inc++] = sqr;
	   		if(sqr > max)
	   		{
	   			max = sqr;
	   			pos = inc;
	   		}
	   		wegt[names[inc-1]]+=1;
	   }
	   return get_weight(newdim, wegt, names);
	}
	V svalue;
	V[]set;
}

unittest {
	auto tbit = [0.4,0.8,0.4];
	auto bits = [[0.1,0.5,0.6],[0.8,0.4,0.7],[0.7,0.8,0.2], [0.2,0.3,0.7]];

    //alias singleTemplate!(double).VArray Tp;
    auto ld = new LoadKNN!double(bits, tbit);
    writeln(ld.get(["olg", "olg", "told", "told"]));
}

void main()
{

	
}