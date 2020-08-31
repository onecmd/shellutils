# shellutils
Shell utils library, include:
- Pretty logs
  - Print time
  - Print script name
  - Print log level
  - Print file
- Load file variables to env variables
  - Load properties variables to env
  - Load json variables to env
- Set|Unset proxies for
  - System
  - ENV
  - YUM
  - Docker
  - NPM
- Install|Uninstall software by one command, resolve proxies and dependencies issue automatically, select fast mirrors automatically
  - jq
  - Docker
  - Java
  - Golang
  - Nginx
  - Apache
  - Tomcat
  - Kubernetes
  - Microk8s
  - Ansible
  - Terraform
  - node_exporter

## Usage example

### Pretty logs
Log logs to file: /var/log/shellutils.log

#### Usage
- Import pretty logs library in script:
```
. ${SCRIPT_ROOT_PATH}/shellutils/logs/pretty_logs.sh
```
- Print logs:
```
info "Start to create configuration..."
info "check_env_parameters..."
warn "LAB_ID not set, use default."
error "Not found Openstack lab vars file: /opt/oneshell/runtime/lab_vars.sh!"
```
- Logs output example:
```
2020-08-24 03:17:06 | /opt/oneshell/main.sh | INFO | Start to create configuration...
2020-08-24 03:17:07 | /opt/oneshell/main.sh | INFO | check_env_parameters...
2020-08-24 03:17:07 | /opt/oneshell/main.sh | WARN | LAB_ID not set, use default.
2020-08-24 03:17:07 | /opt/oneshell/main.sh | ERROR | Not found Openstack lab vars file: /opt/oneshell/runtime/lab_vars.sh!
```

### Load file variables to env variables
#### Load properties variables to env
- Use command:
```
. ${SCRIPT_ROOT_PATH}/shellutils/env/load_properties_to_env.sh {properties file path}
```
Then can use the env variables which defined in properties file.

#### Load json variables to env
recondition: install jq: https://stedolan.github.io/jq/ .
- Json file format like:
```
{
    "parameter_1":"value_1",
    "parameter_2":"value_2"
}
```
- Load json variables to env:
```
. ${SCRIPT_ROOT_PATH}/shellutils/env/load_json_to_env.sh {json file path}
```
Then can use the env variables which defined in json file.

### Set|Unset proxies
Set proxy in file: ${SCRIPT_ROOT_PATH}/shellutils/proxies/config/proxies_config.properties

#### Set|unset proxy for system
```
. ${SCRIPT_ROOT_PATH}/shellutils/proxies/set_system_proxy.sh set|unset [proxy]
```

#### Set|unset proxy for env
```
. ${SCRIPT_ROOT_PATH}/shellutils/proxies/set_env_proxy.sh set|unset [proxy]
```

#### Set|unset proxy for yum
```
. ${SCRIPT_ROOT_PATH}/shellutils/proxies/set_yum_proxy.sh set|unset [proxy]
```

#### Set|unset proxy for docker
```
. ${SCRIPT_ROOT_PATH}/shellutils/proxies/set_docker_proxy.sh set|unset [proxy]
```

#### Set|unset proxy for npm
```
. ${SCRIPT_ROOT_PATH}/shellutils/proxies/set_npm_proxy.sh set|unset [proxy]
```
