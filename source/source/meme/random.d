module meme.random;

import std.random;
import std.file;
import std.string;
import std.array;
import std.string;

string randomMeme()
{
  auto entries = cast(DirEntry[])dirEntries("public/", SpanMode.shallow).array();
  DirEntry entry;
  string name;
  do {
    entry = entries.choice();
    name = entry.name();
    name = name[name.indexOf("public/") + "public/".length..$];
  } while (!entry.isFile() || entry.isSymlink() || name[0] == '.');
  return name;
}
