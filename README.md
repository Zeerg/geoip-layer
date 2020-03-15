# GeoIP Lambda Layer

This GeoIP layer can be deployed to AWS Lambda as a layer. You must have a Maxmind Lite Account and generate a license to build the docker image. 

Signup can be done here: https://www.maxmind.com/en/geolite2/signup


## Building

To Build the layer use make and build. License is the license from GeoLite

```
make build license=xxx
```

Build with no docker cache

```
make rebuild license=xxx
```

Cleaning can be done with
```
make clean
```

## Deploy
You must have serverless setup to deploy this to AWS. Once done run
```
make deploy
```

## Credits

Original Idea: https://github.com/dschep/geoip-lambda-layer
