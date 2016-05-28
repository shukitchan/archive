Photo Sticker
=============

Photo Sticker is a Facebook app that I have been working on since March 2008. It allows users to drag-and-drop some stickers onto a photo they own and put the decorated (or vandalized!) photo onto their profile page. Back in 2008, developing Facebook App is like this  –

* OAuth is not used in Facebook App.
* FBML is widely used to generate UI elements
* The Facebook App can add stuff to user profile page!
* People do send App requests to their friends!

Over the years I was delighted to show it among friends from time to time and it has also been able to help bring me some extra cash (like 20 cents a day :P). But I have been neglecting to upgrade it for far too long. The first sign came when the “Add to Profile” FBML button is deprecated in early 2010 and apps can no longer add extra information on the profile. The photo sticker app then became quite meaningless and users can only play with the canvas to put sticker on but they cannot save the results somewhere. The final nail on the coffin is when Facebook finally move to OAuth in Oct/Nov 2011. Now the app is completely not showing up any more.

That’s when I decided to modernize the app for the changes the Facebook platform required. I used the latest PHP SDK. I tried to remove the use of FBML as much as possible. I also used some PHP script to merge the stickers with the photos according to how the users have set it and upload the photos to the user album.

Here is how the app works now. You will first be given a list of albums that you have to choose from.

![alt text](/photostick/ps1.jpg?raw=true "ps1.jpg")

Then you can choose a photo out of the selected album

![alt text](/photostick/ps2.jpg?raw=true "ps2.jpg")

After that, a list of stickers will be available at the bottom of the photo for you to drag-and-drop onto any position
of the photo.

![alt text](/photostick/ps3.jpg?raw=true "ps3.jpg")

You can choose a different set of stickers and start all over again.

![alt text](/photostick/ps4.jpg?raw=true "ps4.jpg")

When you are done, you can click on a link to upload the decorated (or vandalized photo) to the user album.

![alt text](/photostick/ps5.jpg?raw=true "ps5.jpg")

There are more changes coming. FBML will be completely [deprecated](http://developers.facebook.com/blog/post/568/) somewhere in 2012 and I need to move the “Tell Your Friend” from using FBML request form to using the Javascript SDK to render the request form. Also the app profile page will be [removed](https://developers.facebook.com/blog/post/611/). But I think I am not going to do anything about it with the existing profile page for the Photo Sticker App and will just let it go away.
