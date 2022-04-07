

Application : Stripe payment processing with Heroku | AWS S3 | Sendgrid | Active Admin

Heroku app : https://learn-rail-payments.herokuapp.com/

Stripe creds
- Stripe/Sendgrid keys : config/application.yml
- Stripe test card : 4242 4242 4242 4242

Heroku commands used : 

- heroku login
- heroku apps:create learn_rails_payment
- git push heroku master
- heroku run rails db:migrate db:seed
- heroku config:set PUBLISHABLE_KEY=p
- heroku addons:create sendgrid:starter
- heroku config:get SENDGRID_USERNAME


Docs & links : 
https://stripe.com/docs/api
https://dashboard.stripe.com/
https://dashboard.heroku.com/
