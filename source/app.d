import std.stdio;
import vibe.d;
import mood.vibe;
import mood.hook;


shared static this()
{
  auto router = new URLRouter;


  router.get("/", moodRender!"index.html");
  router.get("/m/*", moodRender!"perma.html");
  router.get("*", serveStaticFiles("public/"));

  auto settings = new HTTPServerSettings;
	settings.port = 9003;
	settings.bindAddresses = ["::1", "0.0.0.0"];
  
	listenHTTP(settings, router);
}
