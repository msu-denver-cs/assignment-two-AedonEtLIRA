https://www.youtube.com/watch?reload=9&v=VPor5ErX_90


To update the database
    rake db:migrate
    
To add a model
    rails g model <Model_Name> <Name>:<Type>
    eg. rails g model Thing name:string description:string count:string

To remove a model
    rails destroy model <Model_Name>
    
To add a controller
    rails g controller <Controller_Name>
    
To reset database
    rake db:reset db:migrate
    
To list that rails routes
    rails routes
    