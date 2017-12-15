import std.json;
import arsd.cgi;
import fx; 

void handle(Cgi cgi) 
{
    if (cgi.requestMethod == Cgi.RequestMethod.POST && cgi.pathInfo == "/")
    {
        auto input = parseJSON(cgi.post.keys[0]);
        auto result = JSONValue(executeFx(input));
        cgi.setResponseContentType("application/json");
        cgi.write(toJSON(result));
    }
}

mixin GenericMain!handle;