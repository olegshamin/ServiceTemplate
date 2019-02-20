90% of all iOS app send requests to server, get response, parse it, save to database and show to the user.
It's template for service layer almost for every app.

Current template implemented with Realm and Alamofire. But it can be easily change to Core Data and standard URLSession framework, for example.

Every service has few layers:

1. Mapper for mapping internal model to realm model (and realm model to internal model). We need this layer because we don't want to work with Realm object inside app.

2. Repository. Here we implement methods for working with database and network.

3. Service. Here we send requests to database or network repository. For example we want to fetch data from server, we send request to Service layer and inside this layer we first send request to Network repository to fetch data and than save data to database via Database repo.

4. Request. For every request to server we create custom Request object inherited from parent class. Here we setup path, method (get, post etc), parameters, headers

We have protocol `Transport` for requests to server, if we want we can implement different ways for request. In this case implemented AlamofireTranposrt but we can use URLSession too.
We have `Scheduler` for working in background or in main thread. Now it's implemented with GCD but can be easily change to NSOperation or whatever. For test purpose we have SyncScheduler where all tasks executing one by one.
