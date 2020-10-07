# Nextflow errors

This file contains nextflow errors expressions and their solutions.

## unknown method invocation

Output on screen: 

```
 Unknown method invocationconda` on _parse_closure5 type`
```

Cause:
Nepal pipeline was run with the `main.nf`file as a the config file: 
```
 ./nepal.sh main.nf 20200923_test
 ```
 Pipeline should be run like this:
 ```
  ./nepal.sh main.config 20200923_test
  ```
  
