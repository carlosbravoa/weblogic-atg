# wl_setup_test Cookbook

This cookbook creates and configure domains, machine and admin server on Weblogic.
It is based on: http://blog.c2b2.co.uk/2015/03/installing-weblogic-with-chef.html

## Requirements

weblogic recipe

### Platforms

- Tested on Centos 6.5

### Chef

- Chef 12.0 or later

### Cookbooks

default.rb: creates a py file to run in Weblogic Server Scripting Shell, using an environment file for configurations

## Attributes

Everything is on the environment file

### wl_setup::default



## Usage

### wl_setup::default


Just include `wl_setup` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[wl_setup_test]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Alan Fryer
http://blog.c2b2.co.uk/2015/03/installing-weblogic-with-chef.html

Fixer: Carlos Bravo

