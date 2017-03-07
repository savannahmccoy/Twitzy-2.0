# Project 4 - *TwitZy*

Submitted by **Savannah McCoy**

**TwitZy** is a basic twitter app to read and compose tweets using the [Twitter API](https://apps.twitter.com/).

Time spent: **+/- 40** hours spent in total


## User Stories

The following **required** functionality is completed:

- [x] User can sign in using OAuth login flow
- [x] The current signed in user will be persisted across restarts
- [x] User can view last 20 tweets from their home timeline
- [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [x] User can pull to refresh.
- [x] User should display the relative timestamp for each tweet "8m", "7h"
- [x] Retweeting and favoriting should increment the retweet and favorite count.
- [x] User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [x] User can compose a new tweet by tapping on a compose button.
- [x] User can tap the profile image in any tweet to see another user's profile
   - [x] Contains the user header view: picture and tagline
   - [x] Contains a section with the users basic stats: # tweets, # following, # followers
- [x] User can navigate to view their own profile
   - [x] Contains the user header view: picture and tagline
   - [x] Contains a section with the users basic stats: # tweets, # following, # followers

The following **optional** features are implemented:

- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
- [x] When composing, you should have a countdown in the upper right for the tweet limit.
- [x] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet
- [ ] Links in tweets are clickable
- [x] User can switch between timeline, mentions, or profile view through a tab bar
- [ ] Pulling down the profile page should blur and resize the header image.

The following **additional** features are implemented:


Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Gif Walkthroughs


Auto Layout for rotation is only applied on the Login & Compose VC's because I have a custom tab bar design which would not work well in a rotated view. (Charlie said this is Ok) 


Walkthrough of implemented user stories:

<img src='https://i.imgur.com/lBz3Sj8.gif' title='gif of user stories' width='' alt='Video Walkthrough' />

AutoLayout #1:

<img src='https://i.imgur.com/6C81wth.gif' title='gif of auto layout #1' width='' alt='Auto Layout' />

AutoLayout #2:

<img src='https://i.imgur.com/5I6Od0X.gif' title='gif of auto layout #2' width='' alt='Auto Layout' />

GIFs created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

everything :/

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [BDBOAuth1Manager] - user authorization

## License

    Copyright [2016] [Savannah McCoy]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
