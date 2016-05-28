YAP Friend Game
===============

Back in 2009, Yahoo! introduced the Yahoo! Application Platform (YAP). It was a lookalike to the Facebook Application Platform back then. They have YML and YQL, which were just very similar to FBML and FQL. Unfortunately Yahoo! did not keep the innovation going. I think by now the only real valuation thing coming out of all these is just YQL. It becomes a cool mashup tool to scrap any contents on the web and massage it into a consumable format.

I was testing out the platform back in 2009 and developed a YAP “Friend Game”. In the early days, “Friend Game” was one of the first popular Facebook app that you might had played. It asked you random questions about your friends. e.g. “Which of your friend is single”. Then it shows photos of 5 of your friends. And you have to guess which of your friends fit the description within a limited time. Here is a screenshot.

![alt text](/friendgame/screenshot.png?raw=true "YAP friend game")

With the [Yahoo! Social SDK](https://github.com/yahoo/yos-social-php), the development of the game is pretty straightforward. It allows you to use YQL to find out all your Yahoo! connections. Then you can find all of the information that they have provided, such as relationship, interests, favorite books, favorite music, etc. So I can construct the questions to ask and the list of friends for you to choose from pretty easily. Below is some code snippet

```
// Register the YAP app with http://developer.yahoo.com and obtain the key and secret
$yahoo_session = YahooSession::requireSession(API_KEY, SHARED_SECRET);
$yahoo_user = $yahoo_session->getSessionedUser();
// get all your Yahoo! connection
$connections = $yahoo_user->getConnections($start, $count, $num);
foreach($connections as $connection)
{
        $connect_user = $yahoo_session->getUser($connection->guid);
        $connect_user_profile = $connect_user->getProfile();

        //photo of your friend
        echo $connect->image->imageUrl;

        // favorite hobby of your friend
        echo $connect->interests[0]->declaredInterests[0]

        // relationship status
        echo $connect->relationshipStatus;

        // school attended
        echo $connect->schools[0]->schoolName;

        // past employer
        echo $connect->works[0]->workName;
}
```

The app you developed can generate YML to render some UI elements to users. e.g. In my app, I use the following to generate HTML markup to display my profile picture and my linked name to my profile page.

```
<yml:profile-pic width="48" /> <yml:name linked="true" capitalize="true" />
```
