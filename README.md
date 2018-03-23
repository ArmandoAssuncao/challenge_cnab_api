# Challenge CNAB Api

In short, the challenge is to develop an application in RoR, which should read a `CNAB.txt` file and insert its data into the database. These recorded data must be exposed by a non-public API.

### Made with:
* Rails 5.x
* Rubocop
* Rspec
* Rake tasks
* PostgreSQL
* ActiveModel Serializer
* Api key validation

### How to use

#### Populate DB with CNAB.txt
Run the following command to populate:
```
rake cnab:insert_cnab
```

#### Generate the API Key
You'll need has a api key to access the api.  
Run the following command and copy the key showed.  
Is necessary add an **email** and a **description** for generate the key, only for later identification.
```
rake apikey:generate['foo@test.com','something description']
```

#### Running the server
```
rails server
```

#### Accessing the API
Has only one endpoint to access the api:
```
curl --header "X-Api-Key: YOUR_KEY" http://localhost:3000/api/v1/financial_transactions
```