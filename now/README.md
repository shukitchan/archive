Back in 2005, Yahoo! released a free music player called the Yahoo! Music Jukebox. You can read more about the history of it in Wikipedia. The engine inside is called the Yahoo Music Engine (YME) and it has a plugin architecture that allows developer to extend the functionality.

Now! is a YME plugins that I developed back in 2005. It allows user to associate windows programs and playlist. So when you are switching between different programs, different playlists can be played. Technically, it is very simple. It involves a ActiveX object that retrieves the currently active program name. Then I write a web page to allow users to define the mapping between program names and playlist. This web page is going to be rendered inside the music player and the music player is exposed as a window external object that the page can interact with. Thus I can write Javascript code to instruct the player to play or stop, etc. I also exposed the ActiveX object I wrote to be available inside the player. So now inside the web page I can also have javascript to interact with the ActiveX Object to retrieve the active program name and pick the the play list to play.

Here is a screenshot of the page inside the music player