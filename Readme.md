Tabinin
-------

This is a container that runs [Tabinin](https://github.com/shokunin/tabinin), a front end to display information about a [nomad](http://nomadproject.io) cluster

To run you need to set the NOMAD_API and NOMAD_CLUSTER environment variables

```
$ docker run -e "NOMAD_API=http://MYCLUSTER_ADDRESS:4646" -e "NOMAD_CLUSTER=DISPLAY_NAME" -p 4040:4000 -i -t maguec/tabinin 
```

[View the interface](http://localhost:4040)
