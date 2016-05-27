Writing Plugin for Yahoo Music Engine
=====================================

Back in 2005, Yahoo! released a free music player called the Yahoo! Music Jukebox. You can read more about the history of it in Wikipedia. The engine inside is called the Yahoo Music Engine (YME) and it has a plugin architecture that allows developer to extend the functionality.

Now! is a YME plugins that I developed back in 2005. It allows user to associate windows programs and playlist. So when you are switching between different programs, different playlists can be played. Technically, it is very simple. It involves a ActiveX object that retrieves the currently active program name. Then I write a web page to allow users to define the mapping between program names and playlist. This web page is going to be rendered inside the music player and the music player is exposed as a window external object that the page can interact with. Thus I can write Javascript code to instruct the player to play or stop, etc. I also exposed the ActiveX object I wrote to be available inside the player. So now inside the web page I can also have javascript to interact with the ActiveX Object to retrieve the active program name and pick the the play list to play.

Here is a screenshot of the page inside the music player

![Alt text](/screen1.jpg?raw=true "Screen Shot")

The ActiveX plugin is simple. The core logic is here.

```
if(GetGUIThreadInfo(NULL, &guiThreadInfo))
{
    TCHAR szBuf[80];
    GetWindowText(guiThreadInfo.hwndActive, szBuf, 80);
    return COleVariant(szBuf).Detach();
}
```

Here is some Javascript snippet of the web page that shows the use of the ActiveX objects and how to interact with the music player

```
var appObject = new ActiveXObject("Now.Application");
var playlists = window.external.PlaylistManager.PlaylistNames;
var engine = window.external.PlaylistEngine;
var manager = window.external.PlaylistManager;
var curText = "";
var curPlaylist = "";

// This is the code to get the current active program name
curText = appObject.Name();

// If you find a match you have a playlist to play
curPlaylist = playlist;
temp = manager.LoadPlaylist(playlist);
engine.Load(temp);

// You can loop the playlist
engine.ContinuousPlay=true;

// You can shuffle the playlist whiling playing
engine.Shuffle=true;
```

The program name, the playlist to play, the option to loop and shuffle are all defined by user. User can define multiple such mappings. The main matching logic is set to run every second to detect the change of active program and change playlist if needed.

So how do I register a new ActiveX object? We use the [Nullsoft Scriptable Install System (NSIS)](http://nsis.sourceforge.net/Main_Page). Basically you wrote a NSI script and you can use their freeware to turn your object and the windows object registry related changes into an executable file. Your user can then download the executable and click on it to install your program to the specified location and update windows registry accordingly. You can also specify what to cleanup when your program is uninstalled. You can download the source code below to see how the script looks like.
