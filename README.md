# GitAround

GitAround is the easiest way to find, replicate, and customize travel itineraries. Users can browse through a catalog of day/overnight/multi-day trips, clone the ones they like to their own profile, view the pins on a map, and then customize it to their liking

# Built With

* Ruby on Rails <br>
* Mapbox <br>
* Google Places <br>
* Paperclip <br>
* Bootstrap <br>

# User Stories

## Must Have

* I am Ivan the Itinerator and I just went on this amazing trip and I want to share what I did with other people. I go to GitAround and create a trip itinerary.  After I am done, I share this itinerary with friends.

* I am Tara the Traveler and I want to travel to Vietnam. I am not sure what to do. I want to get some ideas. So I go to GitAround. On their homepage, I see a bunch of itineraries. I open one and see a bunch of places to go - restaurants, places to stay, sites to see. I also see all of these locations on a map. I can click on a place and go see additional details - ratings, reviews, their website. I can also save this itinerary if I really like it.

* I am Carina the Cloner. I have a few days to plan my trip to Brazil. On the front page of GitAround, I can search for an itinerary on a dropdown of cities. The itineraries have ratings on them. I can clone the itineraries I find on GitAround. I can find my clones in a repository that is on my profile page.


## Wishlist

* I am Debbie the Downloader. I am going somewhere with shitty internet speed, so I download my itinerary. (Can I download it to an easily-viewable mobile format?)


* I am Dinesh the Discoverer and I like to keep a bucket list of itineraries. I am not traveling immediately but would like to maintain a list of trips I want to make when I have the time and money

* I am Ming the Merger. My plan sucks, so I take my friend as advice and merge their copy of my itinerary with my own.

#Wireframes

![Alt text](http://i.imgur.com/mF85lUz.png "GitAround wireframes and entity models")


#Contributors
* Manu Lohiya: https://github.com/manulohiya <br>
* Aileen Santos: https://github.com/asantos3026 <br>
* Katie Gaudin: https://github.com/katiego <br>
* Jason Tasharski: https://github.com/JasonTasharski <br>

#Find it here: https://gitaround.herokuapp.com

## To install on local machine:
* Favorite and fork this repository
* Run 'bundle install' from terminal
* rake db:migrate to set up your database
* rails s to turn on your server
* Open your browser and point to localhost:3000





#### Solutions to Likely Pull Problems
1. If the update you're pulling added seed data for the first time, run "rake db:seed" in the terminal. If you do this more than once, you will get duplicates of the seed data with different ids. You should only need to do this once.
2. If the seed data changes, you may need to run "rake db:reset db:migrate". Make sure your postgresql and any rails consoles aren't running when you do this; you can restart them afterwards.
	* If you end up with duplicate data, you will need to do this.
	* If you aren't sure if you have duplicate data, check in the rails console.
3. If your migrations changed but your seed data didn't, you will only need to run "rake db:migrate" after pulling.

#### Reminders on Pushing
1. Don't push to master.
2. If we agreed to push to master, push to master.
3. Make sure you're working on a branch with "git branch".
4. If you aren't, change to a branch for the feature you're working on with "git checkout -b featureName".
5. When you push from that branch, run "git push origin featurename", and a repository for that branch will be created on github.
6. If you have conflicts, fix the conflicts, add, merge, commit, and push.
