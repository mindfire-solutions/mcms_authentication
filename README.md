## Mcms_authentication


Mcms_authentication is a flexible and most updated authentication solution for Rails 3 .

* Is Rack based;
* Integrated with authentication and authorization modules based on devise and cancan gem;
* Allows you to have multiple roles (or models/scopes) signed in at the same time;


## Information

### The Mcms installation

Installation of Mcms_authentication is crazy simple. 

Here is how:

* Create your rails applications

```console
rails new my_great_app
```

Now,in your Gemfile

```ruby
gem 'mcms_authentication'
```


Run the bundle command to install it.


```console
rails g mcms_authentication install
```

and navigate

```ruby
/mcms/users
```




### Note

This has most of the features required in a good authentication solution but it requires further testing to make it more robust and feature rich. So please pass on you valuable feedback 
to help us make this better. 

 

## License

MIT License. Copyright 2012 Mindfire Solutions Pvt Ltd. http://www.mindfiresolutions.com

