#ifndef STOI_DEFINED
#include <cstdlib>
namespace std
{
	inline int stoi(std::string str)
	{
		return atoi(str.c_str());
	}
	inline long stol(std::string str)
	{
		return atol(str.c_str());
	}
	inline long long stoll(std::string str)
	{
		return atoll(str.c_str());
	}
}
#define STOI_DEFINED
#endif


#ifndef STD_TO_STRING_DEFINED
#define STD_TO_STRING_DEFINED
#include <string>
#include <sstream>
namespace std
{
	template <typename T>
	std::string to_string(T value)
	{
		std::ostringstream os ;
		os << value ;
		return os.str() ;
	}
}
#endif
