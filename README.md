== ask yourself:

- are your views handling more than they should?
- are you sending too many queries to db?
- are you DRY?
- are your controller actions doing too much?
- are your actions/methods doing unnecessary work?
- are you hitting the database (insert, update, etc.) when you don't need to?
- are you duplicating view code?
- can you think of a way to DRY your todo model?
  it seems that we're repeating ourselves in all of the status related methods.
- do you have the right schema and db structure?


## To Do

- move instance creation from view to controller
- remove redundancy from views
- uncrazy the model


<@users.all.each do user<
<2user.age>
@users.includes(:age)
