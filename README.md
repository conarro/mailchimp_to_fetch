# Mailchimp to Fetch

Send your Mailchimp subscribes to [Amplemarket Fetch](http://fetch.amplemarket.com/) to get enriched data sent to Slack.

# Getting started

0. If you haven't already signed up for Fetch, [do that here](http://fetch.amplemarket.com/)
1. Deploy this app to Heroku

    [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

2. Set the `FETCH_API_KEY` environment variable in Heroku. This is where you can find that value in Fetch:
    
    ![](https://tppr.s3.amazonaws.com/uploads/ad5ee6513f9385047fb9aa158d75bd63.png)

3. In Mailchimp, go to the list you want to send to Fetch. Go to Settings > Webhooks.
4. Add the URL of your Heroku app as a webhook, and only check 'Subscribe' events
    * You'll need to use HTTP Basic Auth in your URL (this protects your Heroku app a bit), like so: `https://username:password@yourapp.herokuapp.com`
    * The Deploy button will auto-generate random strings for `username` and `password`, you can find those in your Heroku app settings
