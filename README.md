Discourse
===

Discourse
-----------------
It's a forum which is integrated with smokefree project. People can discuss about quitting smoke


Rails Servers
---------------
There are two digital ocean droplets available. One for test and one for production respectively.
<table>
    <tr>
        <th>Environment</th>
        <th>IP</th>
        <th>RAM</th>
        <th>Git branch</th>
        <th>domain names</th>
    </tr>
    <tr>
        <td>test</td>
        <td>95.85.63.95</td>
        <td>1024MB</td>
        <td>master</td>
        <td>95.85.63.95</td>
    </tr>
    <tr>
        <td>production</td>
        <td>188.226.156.19</td>
        <td>1024MB</td>
        <td>master</td>
        <td>Not yet decided</td>
    </tr>
</table>

Server Config
--------------
Both the test and production server configuration are exact replicas.
The default images provided by Digital ocean was used. You would find more information about this [here](https://www.digitalocean.com/community/articles/how-to-1-click-install-ruby-on-rails-on-ubuntu-12-10-with-digitalocean).
* Rails servers are fronted by Nginx
* ROR is deployed on Unicorn.
* The database is POSTGRES
* Preferred clients are [PGADMIN]
* Both are deployed from github via https

Server restarts
---------------
Both nginx and unicorn are configured as services

Nginx
* service nginx stop
* service nginx start
* service nginx restart

Unicorn
* service unicorn stop
* service unicorn start
* service unicorn restart

POSTGRESQL
* service postgresql stop
* service postgresql start
* service postgresql restart


SideKiq
----------
For sending emails and running background jobs

To start in test server [env: profile] : bundle exec sidekiq -d -L sidekiq.log -e profile

To start in production server [env: production] : bundle exec sidekiq -d -L sidekiq.log -e production

TODO: Still need to add some more info
