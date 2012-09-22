import std.stdio,std.string,std.exception,std.math, std.algorithm,
std.file,std.array,std.conv;


interface ILearning
{
	string get();
	int length();
}
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

//TODO
struct knn(T,R)
{
	string name;
	T length_chas;
	T length_lepes;
	T dimension;
}


//Загрузка данных в виде матрицы
auto LoadMatrixData(string filename)
{
	//Not found?
	auto file = File(filename,"r");
	float dataArray[][];
	foreach(line;file.byLine())
	{
		float lineData[];
		foreach(num;line.split(" "))
		{
			lineData~=parse!float(num);
		}

		dataArray~= lineData;
	}

	assert(dataArray.length > 0);

    return dataArray;
}

class Attributes{}
class LoadKNN(T,V=singleTemplate!(T).VArray):ILearning
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

class Perceptron(T):ILearning
{
  T[]data;
  this(T[] data)
  {
  	this.data = data;
  }

  T get(string[]names)
  {
  	for(int i = 0;i < data.length;++i)
  	{

  	}
  }
 int length()
 {

 }
}

/*Bayes area*/
//http://oscarbonilla.com/2009/05/visualizing-bayes-theorem/
//P(A|B) = P(B|A)*P(A)/P(B)
//http://en.wikipedia.org/wiki/Naive_Bayes_classifier
class NativeBayesClassifier(T):ILearning
{
	T[]data;
	this(T[]data)
	{
		this.data = data;
	}

	int length()
	{
		return data.length;
	}

	float calculate(T num)
	{
		return 0.0;
	}


}

private float bayis()
{
	float a0 = 0.01;
	float a1 = 0.8;
	float a2 = 0.2;
	float a3 = 0.96;

	float pa = ((1 - 0.8) * a3) + (a1 * a0);
	return a0 * a1/pa;
}

unittest {
	auto tbit = [0.4,0.8,0.4];
	auto bits = [[0.1,0.5,0.6],[0.8,0.4,0.7],[0.7,0.8,0.2], [0.2,0.3,0.7]];

    //alias singleTemplate!(double).VArray Tp;
    auto ld = new LoadKNN!double(bits, tbit);
    writeln(ld.get(["olg", "olg", "told", "told"]));
}

unittest {
	auto ld = new Perceptron!double();
}

void main()
{
 
 
}